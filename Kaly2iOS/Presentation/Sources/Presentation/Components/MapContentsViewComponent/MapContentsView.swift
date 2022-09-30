//
//  MapContentsView.swift
//  presentation
//
//  Created by Joel Thiessen on 2022-09-04.
//

import Foundation
import UIKit

@MainActor
final class MapContentsView: UIView {
    private var animationShapeLayers: [CAShapeLayer] = .init()
    private var shapeLayers: [CAShapeLayer] = .init()

    func setup(maxLayers: Int) {
        for _ in 0 ..< maxLayers {
            let animationShapeLayer = CAShapeLayer()
            animationShapeLayer.lineWidth = 3
            animationShapeLayer.fillColor = nil
            layer.addSublayer(animationShapeLayer)
            animationShapeLayers.append(animationShapeLayer)

            let shapeLayer = CAShapeLayer()
            shapeLayer.lineWidth = 3
            shapeLayer.fillColor = nil
            layer.addSublayer(shapeLayer)
            shapeLayers.append(shapeLayer)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    func commonInit() {
        setup(maxLayers: 4)
    }

    // [path color : list of path points]
    private var backgroundPaths = [CGColor: [CGPoint]]()
    private var pathsToAminate: [CGColor: [CGPoint]] = .init()

    func animateAndAddToBackground(newPaths: [CGColor: [CGPoint]]) {
        let alreadyAnimating = pathsToAminate.reduce(false) { partialResult, colorToPath in
            partialResult || colorToPath.value.isEmpty == false
        }

        // Set new paths such that the animate() function will pick them up
        newPaths.forEach {
            if pathsToAminate[$0.key] == nil {
                pathsToAminate[$0.key] = [CGPoint]()
            }
            pathsToAminate[$0.key]?.append(contentsOf: $0.value)
        }

        if alreadyAnimating == false {
            animate()
        } else {
            // If already animating, after the current animation is done,
            // the new paths will get picked up and animated too
        }
    }

    private func animate() {
        let newPaths = pathsToAminate
        newPaths.enumerated().forEach { index, colorToPath in
            let layer = animationShapeLayers[index]
            let size = colorToPath.value.count
            layer.strokeColor = UIColor.purple.cgColor
            layer.fillColor = nil

//            let path = UIBezierPath(catmullRomPoints: colorToPath.value, closed: false, alpha: 0)
            let path = UIBezierPath(quadCurve: colorToPath.value)
            layer.path = path?.cgPath

            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.fromValue = 0.0
            animation.toValue = 1.0

            animation.duration = 7.0

            CATransaction.setCompletionBlock { [weak self] in
                if self?.backgroundPaths[colorToPath.key] == nil {
                    self?.backgroundPaths[colorToPath.key] = [CGPoint]()
                }
                self?.backgroundPaths[colorToPath.key]?.append(contentsOf: colorToPath.value[..<size])
                self?.pathsToAminate[colorToPath.key]?.removeFirst(size)
                layer.path = nil

                // Check for newly added points to animate
                if let pathsToAnimate = self?.pathsToAminate {
                    for colorToPath in pathsToAnimate {
                        if colorToPath.value.isEmpty == false {
                            self?.animate() // continue animating remaining points
                            break
                        }
                    }
                }
                layer.removeAllAnimations()
                if let paths = self?.backgroundPaths {
                    self?.drawBackgroundPaths(paths: paths)
                }
            }

            layer.add(animation, forKey: "myStroke")
            self.layer.addSublayer(layer)
        }
    }

    func drawBackgroundPaths(paths: [CGColor: [CGPoint]]) {
        backgroundPaths = paths
        backgroundPaths.enumerated().forEach { index, colorToPath in
            let layer = shapeLayers[index]
            layer.fillColor = nil
            layer.strokeColor = colorToPath.key
            layer.strokeColor = UIColor.blue.cgColor
            let path = UIBezierPath(quadCurve: colorToPath.value)
            layer.path = path?.cgPath
        }
    }

    func drawPaths(newPaths: [CGColor: [CGPoint]]) {
        animateAndAddToBackground(newPaths: newPaths)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        drawBackgroundPaths(paths: backgroundPaths)
    }
}
