//
//  SimpleCalcTest.swift
//  CountOnMeTest
//
//  Created by Kel_Jellysh on 08/04/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class SimpleCalcTest: XCTestCase {
    
    var simpleCalc: SimpleCalc!
    
    override func setUp() {
        super.setUp()
        simpleCalc = SimpleCalc()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    override func tearDownWithError() throws {
        simpleCalc = nil
    }

//MARK: TESTS OPERATIONS OF CALCULATIONS OF SIMPLECALC CLASS
    func testGivenAddiction_WhenHavingOperatorPlus_ThenPrintingResult() {
        simpleCalc.addNumber(number: "4")
        simpleCalc.tappedAddition()
        simpleCalc.addNumber(number: "5")
        
        simpleCalc.calculator()
       
        XCTAssert(simpleCalc.result == 9)
    }
    func testGivenSubstraction_WhenHavingOperatorLess_ThenPrintingResult() {
        simpleCalc.addNumber(number: "3")
        simpleCalc.tappedSubstration()
        simpleCalc.addNumber(number: "2")
        
        simpleCalc.calculator()
       
        XCTAssert(simpleCalc.result == 1)
    }
    func testGivenMultiplication_WhenHavingOperatorTime_ThenPrintingResult() {
        simpleCalc.addNumber(number: "3")
        simpleCalc.tappedMultiplication()
        simpleCalc.addNumber(number: "2")
        
        simpleCalc.calculator()
       
        XCTAssert(simpleCalc.result == 6)
    }
    func testGivenDivision_WhenHavingOperatorDivision_ThenPrintingResult() {
        simpleCalc.addNumber(number: "6")
        simpleCalc.tappedDivision()
        simpleCalc.addNumber(number: "2")
        
        simpleCalc.calculator()
       
        XCTAssert(simpleCalc.result == 3)
    }
    func testGivenSubstration_WhenhavingASubstration_ThenResultingANegativeNumber() {
        simpleCalc.addNumber(number: "2")
        simpleCalc.tappedSubstration()
        simpleCalc.addNumber(number: "4")
        
        simpleCalc.calculator()
        
        XCTAssert(simpleCalc.result == -2)
    }
    func testGivenAPriority_WhenTimeOperationWithAPlusOperand_ThenResultingXFirst(){
        simpleCalc.addNumber(number: "2")
        simpleCalc.tappedAddition()
        simpleCalc.addNumber(number: "1")
        simpleCalc.tappedMultiplication()
        simpleCalc.addNumber(number: "3")
        
        simpleCalc.calculator()
        
        XCTAssert(simpleCalc.result == 5)
    }
    func testGivenPriority_WhenADivisionOperationWithPlusOperand_ThenResultingDivisionFirst() {
        simpleCalc.addNumber(number: "2")
        simpleCalc.tappedAddition()
        simpleCalc.addNumber(number: "2")
        simpleCalc.tappedDivision()
        simpleCalc.addNumber(number: "2")
        
        simpleCalc.calculator()
        
        XCTAssert(simpleCalc.result == 3)
    }
    func testGivenAPriority_WhenTimeOperationWithALessOperand_ThenResultingXFirst(){
        simpleCalc.addNumber(number: "10")
        simpleCalc.tappedSubstration()
        simpleCalc.addNumber(number: "3")
        simpleCalc.tappedMultiplication()
        simpleCalc.addNumber(number: "3")
        
        simpleCalc.calculator()
        
        XCTAssert(simpleCalc.result == 1)
    }
    func testGivenADecimalResult_WhenSubstrateInAnOperation_ThenHavingAResult() {
        simpleCalc.addNumber(number: "1")
        simpleCalc.tappedSubstration()
        simpleCalc.addNumber(number: "1")
        simpleCalc.tappedDivision()
        simpleCalc.addNumber(number: "2")
        
        simpleCalc.calculator()
        
        XCTAssert(simpleCalc.result == 0.5)
    }
    func testGivenPriority_WhenADivisionOperationWithLessOperand_ThenResultingDivisionFirst() {
        simpleCalc.addNumber(number: "2")
        simpleCalc.tappedSubstration()
        simpleCalc.addNumber(number: "3")
        simpleCalc.tappedDivision()
        simpleCalc.addNumber(number: "3")
        
        simpleCalc.calculator()
        
        XCTAssert(simpleCalc.result == 1)
    }
    func testGivenDivisionPriority_WhenHavingAMultiplicationInOperation_ThenResultingDivisionFirst() {
        simpleCalc.addNumber(number: "2")
        simpleCalc.tappedDivision()
        simpleCalc.addNumber(number: "2")
        simpleCalc.tappedMultiplication()
        simpleCalc.addNumber(number: "3")
        
        simpleCalc.calculator()
        
        XCTAssert(simpleCalc.result == 3)
    }
    func testGivenMoreAddictions_WhenHavingSameOperand_ThenHavingResult() {
        simpleCalc.addNumber(number: "2")
        simpleCalc.tappedAddition()
        simpleCalc.addNumber(number: "2")
        simpleCalc.tappedAddition()
        simpleCalc.addNumber(number: "3")
        
        simpleCalc.calculator()
        
        XCTAssert(simpleCalc.result == 7)
    }
    func testGivenFIrstSubstrations_WhenHavingSameOperand_ThenHavingResult() {
        simpleCalc.addNumber(number: "4")
        simpleCalc.tappedSubstration()
        simpleCalc.addNumber(number: "2")
        simpleCalc.tappedSubstration()
        simpleCalc.addNumber(number: "1")
        
        simpleCalc.calculator()
        
        XCTAssert(simpleCalc.result == 1)
    }
    func testGivenFirstMultiplications_WhenHavindSameOperand_ThenHavingResult() {
        simpleCalc.addNumber(number: "4")
        simpleCalc.tappedMultiplication()
        simpleCalc.addNumber(number: "2")
        simpleCalc.tappedMultiplication()
        simpleCalc.addNumber(number: "1")
        
        simpleCalc.calculator()
    
        XCTAssert(simpleCalc.result == 8)
    }
    func testGivenMoreDivisions_WhenHavingSameOperand_ThenHavingResult() {
        simpleCalc.addNumber(number: "20")
        simpleCalc.tappedDivision()
        simpleCalc.addNumber(number: "2")
        simpleCalc.tappedDivision()
        simpleCalc.addNumber(number: "4")
        
        simpleCalc.calculator()
        
        XCTAssert(simpleCalc.result == 2.5)
    }
    
    func testGivenMoreOperations_WhenHavingMoreOperand_ThenHavingResult() {
        simpleCalc.addNumber(number: "2")
        simpleCalc.tappedAddition()
        simpleCalc.addNumber(number: "2")
        simpleCalc.tappedSubstration()
        simpleCalc.addNumber(number: "1")
        simpleCalc.tappedMultiplication()
        simpleCalc.addNumber(number: "1")
        simpleCalc.tappedDivision()
        simpleCalc.addNumber(number: "1")
        
        simpleCalc.calculator()
        
        XCTAssert(simpleCalc.result == 3)
    }
    
    func testGivenDivision_WhenAddingNumbers_ThenHavingResult(){
        
        simpleCalc.result = simpleCalc.division(left: 1, right: 2)
        
        XCTAssert(simpleCalc.result == 0.5)
    }
    
    func testGivenResetCalc_WhenAskingAReset_ThenStartingANewCalc() {
        
        simpleCalc.resetCalc()
        
        XCTAssertEqual(simpleCalc.result == 0.0, simpleCalc.textView == "")
    }
    
    func testGivenMinDecimal_WhenHavingMaxLenghtDouble_ThenResultingMinNumberAfterDot() {
        simpleCalc.addNumber(number: "2")
        simpleCalc.tappedDivision()
        simpleCalc.addNumber(number: "3")
        
        simpleCalc.calculator()
        
        XCTAssert(simpleCalc.result == 0.66667)
    }
    
    
    func testGivenNumber_WhenAddingNumber_ThenAddToCalc() {
        simpleCalc.addNumber(number: "2")
        simpleCalc.addNumber(number: "5")
        simpleCalc.addNumber(number: "6")
        
        XCTAssert(simpleCalc.textView == "256")
    }
    
    func testGivenNothing_WhenAddReset_ThenResultingNothing() {
        simpleCalc.addNumber(number: "6")
        
        simpleCalc.resetCalc()
        
        XCTAssert(simpleCalc.textView == "")
    }
    
    //MARK: TESTS FOR ALERT MESSAGES
    func testGivenAlert_WhenAskingTwiceToReset_ThenPrintAlertMessage() {
        simpleCalc.resetCalc()
        simpleCalc.resetCalc()
        
        XCTAssertEqual(simpleCalc.result == 0.0, simpleCalc.displayAlertInController(message: "You have already cleared the calculation.") == simpleCalc.displayAlertInController(message: "You have already cleared the calculation."))
    }
    
    func testGivenAlert_WhenAddingAnOperandBefore_ThenResultingAMessage() {
        simpleCalc.tappedMultiplication()
        
        XCTAssertEqual(simpleCalc.result == 0.0, simpleCalc.displayAlertInController(message: "Enter a number") == simpleCalc.displayAlertInController(message: "Enter a number"))
       
    }
    func testGivenAlert_WhenAddingAnOperandAfterResult_ThenResultingAMessage() {
        simpleCalc.addNumber(number: "1")
        simpleCalc.tappedAddition()
        simpleCalc.addNumber(number: "2")
        
        simpleCalc.calculator()
        
        simpleCalc.tappedAddition()
        
        XCTAssertEqual(simpleCalc.textView == "", simpleCalc.result == 3)
    }
    
    func testGiven2Operand_WhenTheyFollowEachOther_ThenResultingAnAlertMessage() {
        simpleCalc.addNumber(number: "2")
        simpleCalc.tappedAddition()
        simpleCalc.tappedAddition()
        
        XCTAssertEqual(simpleCalc.result == 0.00,  simpleCalc.displayAlertInController(message: "An operator is already set !") == simpleCalc.displayAlertInController(message: "An operator is already set !"))
    }
    
    func testGivenAlert_WhenDivisingPerO_ThenResultingAnAlertMessage() {
        simpleCalc.addNumber(number: "1")
        simpleCalc.tappedDivision()
        simpleCalc.addNumber(number: "0")
        
        XCTAssertEqual(simpleCalc.result == 0.00, simpleCalc.displayAlertInController(message: "You can't divise per 0, try a new calculation.") == simpleCalc.displayAlertInController(message: "You can't divise per 0, try a new calculation."))
    }
}

