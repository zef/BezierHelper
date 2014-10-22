//
//  BezierHelper.swift
//  BezierHelper
//
//  Created by Zef Houssney on 10/21/14.
//

import UIKit

class BezierHelper {
    typealias BezierPoint = (controlPoint1: CGPoint, controlPoint2: CGPoint, anchor: CGPoint)
    typealias BezierData = (origin: CGPoint, points: [BezierPoint])

    class func bezierDataFromArray(array: [Int], shift: CGPoint = CGPointZero) -> BezierData {
        var points = [BezierPoint]()

        if array.count % 6 != 2 {
            println("An array of points representing a bezier path must consist of two values for the orgin, followed by groups of exactly six values for each point along the bezier path.")
            return (CGPointZero, points)
        }

        var nextIndex = 0
        func nextPoint() -> CGPoint {
            let point = CGPoint(x: CGFloat(array[nextIndex]) + shift.x, y: CGFloat(array[nextIndex + 1]) + shift.y)
            nextIndex += 2
            return point
        }

        let origin = nextPoint()

        while nextIndex < array.count {
            points.append((nextPoint(), nextPoint(), nextPoint()))
        }

        return (origin, points)
    }

    class func bezierPathFromData(data: BezierData) -> UIBezierPath {
        let path = UIBezierPath()
        path.moveToPoint(data.origin)
        for point in data.points {
            path.addCurveToPoint(point.anchor, controlPoint1: point.controlPoint1, controlPoint2: point.controlPoint2)
        }
        return path
    }

    class func bezierPathFromArray(array: [Int], shift: CGPoint = CGPointZero) -> UIBezierPath {
        return bezierPathFromData(bezierDataFromArray(array, shift: shift))
    }
    
}

