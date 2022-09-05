//
//  UIBezierPath+Extensions.swift
//  Presentation
//
//  Created by Joel Thiessen on 2022-09-04.
//

import Foundation
import UIKit

// Quad curve Bezier Path
// After: https://gist.github.com/mbuchetics/e56a7ef7a2551af5089aa30ee246a976
extension UIBezierPath {
    convenience init?(quadCurve points: [CGPoint]) {
        guard points.count > 1 else { return nil }

        self.init()

        var p1 = points[0]
        move(to: p1)

        if points.count == 2 {
            addLine(to: points[1])
        }

        for i in 0 ..< points.count {
            let mid = midPoint(p1: p1, p2: points[i])

            addQuadCurve(to: mid, controlPoint: controlPoint(p1: mid, p2: p1))
            addQuadCurve(to: points[i], controlPoint: controlPoint(p1: mid, p2: points[i]))

            p1 = points[i]
        }
    }

    private func midPoint(p1: CGPoint, p2: CGPoint) -> CGPoint {
        CGPoint(x: (p1.x + p2.x) / 2, y: (p1.y + p2.y) / 2)
    }

    private func controlPoint(p1: CGPoint, p2: CGPoint) -> CGPoint {
        var controlPoint = midPoint(p1: p1, p2: p2)
        let diffY = abs(p2.y - controlPoint.y)

        if p1.y < p2.y {
            controlPoint.y += diffY
        } else if p1.y > p2.y {
            controlPoint.y -= diffY
        }
        return controlPoint
    }
}

// Catmull Rom-Bezier Path
// After: https://github.com/andrelind/swift-catmullrom/blob/master/CatmullRom.swift
extension UIBezierPath {
    convenience init?(catmullRomPoints: [CGPoint], closed: Bool, alpha: CGFloat) {
        self.init()

        if catmullRomPoints.count < 4 {
            return nil
        }

        let startIndex = closed ? 0 : 1
        let endIndex = closed ? catmullRomPoints.count : catmullRomPoints.count - 2

        for i in startIndex ..< endIndex {
            let p0 = catmullRomPoints[i - 1 < 0 ? catmullRomPoints.count - 1 : i - 1]
            let p1 = catmullRomPoints[i]
            let p2 = catmullRomPoints[(i + 1) % catmullRomPoints.count]
            let p3 = catmullRomPoints[(i + 1) % catmullRomPoints.count + 1]

            let d1 = p1.deltaTo(a: p0).length()
            let d2 = p2.deltaTo(a: p1).length()
            let d3 = p3.deltaTo(a: p2).length()

            var b1 = p2.multiplyBy(value: pow(d1, 2 * alpha))
            b1 = b1.deltaTo(a: p0.multiplyBy(value: pow(d2, 2 * alpha)))
            let part = 2 * pow(d1, 2 * alpha) + 3 * pow(d1, alpha) * pow(d2, alpha) + pow(d2, 2 * alpha)
            b1 = b1.addTo(a: p1.multiplyBy(value: part))
            b1 = b1.multiplyBy(value: 1.0 / (3 * pow(d1, alpha) * (pow(d1, alpha) + pow(d2, alpha))))

            var b2 = p1.multiplyBy(value: pow(d3, 2 * alpha))
            b2 = b2.deltaTo(a: p3.multiplyBy(value: pow(d2, 2 * alpha)))
            let partB = 2 * pow(d3, 2 * alpha) + 3 * pow(d3, alpha) * pow(d2, alpha) + pow(d2, 2 * alpha)
            b2 = b2.addTo(a: p2.multiplyBy(value: partB))
            b2 = b2.multiplyBy(value: 1.0 / (3 * pow(d3, alpha) * (pow(d3, alpha) + pow(d2, alpha))))

            if i == startIndex {
                move(to: p1)
            }

            addCurve(to: p2, controlPoint1: b1, controlPoint2: b2)
        }

        if closed {
            close()
        }
    }
}
