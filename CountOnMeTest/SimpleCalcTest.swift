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
    
    var viewCOntroller: ViewController!
    var simpleCalc: SimpleCalc!
    
    var Tabtest = [String]()
    
    override func setUp() {
        super.setUp()
        viewCOntroller = ViewController()
        simpleCalc = SimpleCalc()
        //créer un tableau elements our prendre pour accueillir les données pour les tests
        //pour chaque test créer des valeurs différentes.
    }
    
    func testGivenOperatorAlertMessage_WhenAlreadyAddingAnOperator_ThenPrintAlertOperatorInView() {
        
    }
 
    
    func testGivenAlertMessage_WhenExpressionHaveEnoughElements_ThenPrintAlert() {
        
    }
    
    func testGivenAddiction_WhenTappingOnButtonsAndSelectingTheOperatorPlus_ThenPrintingResult() {
        
    }
    
    func testGivenSubstraction_WhenTappingOnButtonsAndSelectingTheOperatorPlus_ThenPrintingResult() {
        
    }
    
    
    func testGivenMultiplication_WhenTappingOnButtonsAndSelectingTheOperatorPlus_ThenPrintingResult() {
        
    }
    
    func testGivenDivision_WhenTappingOnButtonsAndSelectingTheOperatorPlus_ThenPrintingResult() {
        
    }
    
    func testGiven2Operand_WhenTheyFollowEachOther_ThenResultingAnAlertMessage() {
        
    }
    
    func testGivenAPriority_WhenAddingAMultiplicationInOperation_ThenResultingXFirst(){
        
    }
    
    func testGivenPriority_WhenAddingADivisionInOperation_ThenResultingDivisionFirst() {
        
    }
    
    func testGivenDivisionPriority_WhenHavingAMultiplicationInOperation_ThenResultingDivisionFirst() {
        
    }
    func testGivenMultiplyPriority_WhenAHavingADivisionInOperation_ThenResultingDivisionFirst() {
        
    }
    func testGivenMoreAddictions_WhenHavingSameOperand_ThenHavingResult() {
        
    }
    
    func testGivenMoreSubstrations_WhenHavingSameOperand_ThenHavingResult() {
        
    }
    
    func testGivenMoreMultiplications_WhenHavindSameOperand_ThenHavingResult() {
        
    }
    
    func testGivenMoreDivisions_WhenHavingSameOperand_ThenHavingResult() {
        
    }
    
    func testGivenResetCalc_WhenTappingOnAC_ThenresultingAnEmptyArray() {
        
    }
    
    func testGivenAnAlert_WhenTappingOnACTwice_ThenresultingAMessagetoAdvice() {
        
    }
    
    func testGivenAErrorMessage_WhenEndingTheCalcWithAnOperand_ThenResultingAnAlertMessage(){
        
    }
    
    
}

