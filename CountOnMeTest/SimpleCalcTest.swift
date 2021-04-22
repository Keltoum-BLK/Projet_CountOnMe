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
    
    var tabtest = [String]()
    
    override func setUp() {
        super.setUp()
        simpleCalc = SimpleCalc()
        tabtest = simpleCalc.elements
        //créer un tableau elements our prendre pour accueillir les données pour les tests
        //pour chaque test créer des valeurs différentes.
    }
    

//MARK: TESTS TO CHECK EVERY FUNCTIONNABILITIES OF SIMPLECALC CLASS
    func testGivenAddiction_WhenHavingOperatorPlus_ThenPrintingResult() {

       
    }
    
    func testGivenSubstraction_WhenHavingOperatorLess_ThenPrintingResult() {
        
    }
    
    
    func testGivenMultiplication_WhenHavingOperatorTime_ThenPrintingResult() {
        
    }
    
    func testGivenDivision_WhenHavingOperatorDivision_ThenPrintingResult() {
        
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

