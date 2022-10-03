//
//  ArithmeticUnitTestCase.swift
//  UItestCaseTests
//
//  Created by phonestop on 10/1/22.
//

import XCTest
//Import the application as test case comes under other bundle
@testable import UItestCase

class ArithmeticUnitTestCase: XCTestCase {

    var sut: Arithmetic!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = Arithmetic() //assigning the instance to the variable
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil // assigning nil after completion/execution of all the testCases
    }

    func testAddition() {
        //Given, it decides the input
        let num1 = 2
        let num2 = 5
        //When, the particular operation is carried out
        let result = sut.Add(num1: num1, num2: num2)
        
        //Then, expected output should be derived
        XCTAssertEqual(result, 7)
    }

}
