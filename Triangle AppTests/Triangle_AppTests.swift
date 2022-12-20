//
//  Triangle_AppTests.swift
//  Triangle AppTests
//
//  Created by septe habudin on 19/12/22.
//

import XCTest
@testable import Triangle_App

final class Triangle_AppTests: XCTestCase {

    func testInvalidInputSides() {
        XCTAssertThrowsError(try detectTriangle(-2, 2, 3)) { error in
            XCTAssertEqual(error as? TriangleError, TriangleError.invalidInput)
        }
    }

    // cek is triangle Segitiga Sama Sisi
    func testDetectEquilateralTriangle() {
        XCTAssertEqual(try detectTriangle(2, 2, 2), "Segitiga Sama Sisi")
    }

    // test segitiga sama kaki
    func testDetectIsoscelesTriangle() {
        //        XCTAssertEqual(try detectTriangle(1, 1, 2), "Segitiga Sama Kaki") // jika di open akan masuk ke case pertama
        //        XCTAssertEqual(try detectTriangle(1, 2, 1), "Segitiga Sama Kaki")
        XCTAssertEqual(try detectTriangle(8, 8, 10), "Segitiga Sama Kaki")
        XCTAssertEqual(try detectTriangle(8, 10, 8), "Segitiga Sama Kaki")
        XCTAssertEqual(try detectTriangle(1, 2, 2), "Segitiga Sama Kaki")
        XCTAssertEqual(try detectTriangle(2, 1, 2), "Segitiga Sama Kaki")
    }

    // test segitiga sembarang
    func testDetectRandomTriangle() {
        //        XCTAssertEqual(try detectTriangle(1, 2, 3), "Segitiga Sembarang")
        XCTAssertEqual(try detectTriangle(3, 4, 5), "Segitiga Sembarang")
    }

    func testInequalityTriangle() {
        XCTAssertThrowsError(try detectTriangle(4, 1, 2)) { error in
            XCTAssertEqual(error as? TriangleError, TriangleError.inequalityInput)
        }

        XCTAssertThrowsError(try detectTriangle(5, 1, 3)) {error in
            XCTAssertEqual(error as? TriangleError, TriangleError.inequalityInput)
        }
    }

    func detectTriangle(
        _ SideA: Int,
        _ SideB: Int,
        _ SideC: Int
    ) throws -> String {
        // sample hanya cek satu argumen saja
        //        if SideA < 1 {
        //            throw TriangleError.invalidInput
        //        }

        let sides = [SideA, SideB, SideC].sorted()

        //        for side in [SideA, SideB, SideC] where side < 1 {
        for side in sides where side < 1 {
            throw TriangleError.invalidInput
        }

        if (sides[1] + sides[0] <= sides[2]) {
            throw TriangleError.inequalityInput
        } else if sides[0] == sides[1] && sides[1] == sides[2] {
            return "Segitiga Sama Sisi"
        } else if sides[0] == sides[1] || sides[1] == sides[2] {
            return "Segitiga Sama Kaki"
        } else {
            return "Segitiga Sembarang"
        }
    }

}


enum TriangleError: Error {
    case invalidInput
    case inequalityInput
}
