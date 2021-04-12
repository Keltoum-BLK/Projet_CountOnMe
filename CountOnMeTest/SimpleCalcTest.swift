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
    
    override func setUp() {
        super.setUp()
        viewCOntroller = ViewController()
        //créer un tableau elements our prendre pour accueillir les données pour les tests
        //pour chaque test créer des valeurs différentes.
    }
    
    func testGivenOperatorAlertMessage_WhenAlreadyAddingAnOperator_ThenPrintAlertOperatorInView() {
        //element = ["12", "+", "+", "56"]
        
        
        
    }
    
    func testGivenAlertMessage_WhenExpressionHaveEnoughElements_ThenPrintAlertInView() {
        
    }
    
    func testGivenAddiction_WhenTappingOnButtonsAndSelectingTheOperatorPlus_ThenResultingInTextView() {
        
    }
    
    func testGivenSubstraction_WhenTappingOnButtonsAndSelectingTheOperatorPlus_ThenResultingInTextView() {
        
    }
    
    
    func testGivenMultiplication_WhenTappingOnButtonsAndSelectingTheOperatorPlus_ThenResultingInTextView() {
        
    }
    
    func testGivenDivision_WhenTappingOnButtonsAndSelectingTheOperatorPlus_ThenResultingInTextView() {
        
    }
    
    func testGiven2Operand_WhenTheyFollowEachOther_ThenResultingAnAlertMessage() {
        
    }
    
    func testGivenAPriority_WhenAddingAMultiplicationInOperation_ThenResultingXFirst(){
        
    }
    
    func testGivenPriority_WhenAddingADivisionInOperation_ThenResultingDivisionFirst() {
        
    }
    
    func testGivenPriority_WhenAddingADivisionFirstWithAMultiplicationInOperation_ThenResultingDivisionFirst() {
        
    }
    func testGivenPriority_WhenAddingAXFirstWithDivisionInOperation_ThenResultingDivisionFirst() {
        
    }
    func testGivenManyAddition_WhenHavingSameOperand_ThenResultingAddition() {
        
    }
    
    func testGivenResetCalc_WhenTappingOnAC_ThenresultingAnEmptyArray() {
        
    }
    
    func testGivenAnAlert_WhenTappingOnACTwice_ThenresultingAMessagetoAdvice() {
        
    }
    
    func testGivenAErrorMessage_WhenEndingTheCalcWithAnOperand_ThenResultingAnAlertMessage(){
        
    }
    
    
}

