//
//  CGPoint+Extensions.swift
//  Presentation
//
//  Created by Joel Thiessen on 2022-09-04.
//

import Foundation
import UIKit

extension CGPoint {
    func translate(x: CGFloat, _ y: CGFloat) -> CGPoint {
        CGPoint(x: self.x + x, y: self.y + y)
    }

    func translateX(x: CGFloat) -> CGPoint {
        CGPoint(x: self.x + x, y: y)
    }

    func translateY(y: CGFloat) -> CGPoint {
        CGPoint(x: x, y: self.y + y)
    }

    func invertY() -> CGPoint {
        CGPoint(x: x, y: -y)
    }

    func xAxis() -> CGPoint {
        CGPoint(x: 0, y: y)
    }

    func yAxis() -> CGPoint {
        CGPoint(x: x, y: 0)
    }

    func addTo(a: CGPoint) -> CGPoint {
        CGPoint(x: x + a.x, y: y + a.y)
    }

    func deltaTo(a: CGPoint) -> CGPoint {
        CGPoint(x: x - a.x, y: y - a.y)
    }

    func multiplyBy(value: CGFloat) -> CGPoint {
        CGPoint(x: x * value, y: y * value)
    }

    func length() -> CGFloat {
        CGFloat(sqrt(CDouble(
            x * x + y * y
        )))
    }

    func normalize() -> CGPoint {
        let l = length()
        return CGPoint(x: x / l, y: y / l)
    }
}
