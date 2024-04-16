//
//  TriangleAppTests.swift
//  TriangleAppTests
//
//  Created by Naela Fauzul Muna on 16/04/24.
//

import XCTest
@testable import TriangleApp

final class TriangleAppTests: XCTestCase {
    
    func testInvalidInputSides() {
        XCTAssertThrowsError(try detectTriangle(-1, 2, 3)) { error in
            XCTAssertEqual(error as? TriangleError, TriangleError.invalidInput)
        }
    }
    
    func testDetectEquilateralTriangle() {
        XCTAssertEqual(try detectTriangle(2, 2, 2), "Segitiga Sama Sisi")
    }
    
    func testDetectIsoscelesTriangle() {
        XCTAssertEqual(try detectTriangle(1, 2, 2), "Segitiga Sama Kaki")
    }
    
    func testInequalityTriangle() {
      XCTAssertThrowsError(try detectTriangle(4, 1, 2)) { error in
        XCTAssertEqual(error as? TriangleError, TriangleError.inequalityInput)
      }
     
      XCTAssertThrowsError(try detectTriangle(5, 1, 3)) { error in
        XCTAssertEqual(error as? TriangleError, TriangleError.inequalityInput)
      }
    }
    
    func detectTriangle(
      _ sideA: Int,
      _ sideB: Int,
      _ sideC: Int
    ) throws -> String {
      let sides = [sideA, sideB, sideC].sorted()
      for side in sides where side < 0 {
        throw TriangleError.invalidInput
      }
     
      if sides[0] == sides[1] && sides[0] == sides[2] {
        return "Segitiga Sama Sisi"
      } else if sides[0] == sides[1] || sides[1] == sides[2] {
        return "Segitiga Sama Kaki"
      } else if sides[1] + sides[0] <= sides[2] {
        throw TriangleError.inequalityInput
      } else if sides[2] - sides[1] <= sides[0] {
        throw TriangleError.inequalityInput
      } else {
        return "Segitiga Sembarang"
      }
    }
}

enum TriangleError: Error {
    case invalidInput
    case inequalityInput
}
