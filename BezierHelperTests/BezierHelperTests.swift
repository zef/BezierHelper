//
//  BezierHelperTests.swift
//  BezierHelperTests
//
//  Created by Josef Houssney on 10/21/14.
//  Copyright (c) 2014 Made by Kiwi. All rights reserved.
//

import UIKit
import BezierHelper
import XCTest

class BezierHelperTests: XCTestCase {
    
    func testDataCreation() {
        let points = [0, 1, 2, 3, 4, 5, 6, 7]
        let data = BezierHelper.bezierDataFromArray(points)

        let origin = CGPoint(x: 0, y: 1)
        let pointAnchor = CGPoint(x: 6, y: 7)
        let controlOne = CGPoint(x: 2, y: 3)
        let controlTwo = CGPoint(x: 4, y: 5)

        XCTAssertEqual(data.origin, origin, "Anchor point should be set")
        XCTAssertEqual(data.points.count, 1, "Data should contain one point")

        let point = data.points.first!
        XCTAssertEqual(point.anchor, pointAnchor, "Point anchor should be set")
        XCTAssertEqual(point.controlPoint1, controlOne, "Control point anchor 1 should be set")
        XCTAssertEqual(point.controlPoint2, controlTwo, "Control point anchor 2 should be set")
    }

    func testPointShifting() {
        let points = [0, 1, 2, 3, 4, 5, 6, 7]
        let shift = 100
        let data = BezierHelper.bezierDataFromArray(points, shift: CGPoint(x: shift, y: shift))

        let origin = CGPoint(x: 0 + shift, y: 1 + shift)
        let pointAnchor = CGPoint(x: 6 + shift, y: 7 + shift)
        let controlOne = CGPoint(x: 2 + shift, y: 3 + shift)
        let controlTwo = CGPoint(x: 4 + shift, y: 5 + shift)

        XCTAssertEqual(data.origin, origin, "Anchor point should be set")
        XCTAssertEqual(data.points.count, 1, "Data should contain one point")

        let point = data.points.first!
        XCTAssertEqual(point.anchor, pointAnchor, "Point anchor should be set")
        XCTAssertEqual(point.controlPoint1, controlOne, "Control point anchor 1 should be set")
        XCTAssertEqual(point.controlPoint2, controlTwo, "Control point anchor 2 should be set")
    }

    func testPathCreation() {
        let points = [0, 1, 2, 3, 4, 5, 6, 7]
        let path = BezierHelper.bezierPathFromArray(points)
        XCTAssert(path.isKindOfClass(UIBezierPath), "Should get a path back")
    }

    func testBadData() {
        let points = [0, 1, 2, 3]
        let data = BezierHelper.bezierDataFromArray(points)

        XCTAssertEqual(data.origin, CGPointZero, "Anchor point should be set to zero")
        XCTAssertEqual(data.points.count, 0, "Data should not contain points")
    }
}
