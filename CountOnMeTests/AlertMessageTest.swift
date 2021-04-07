//
//  AlertMessageTest.swift
//  CountOnMeTests
//
//  Created by Kel_Jellysh on 07/04/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class AlertMessageTest: XCTestCase {

    var viewCOntroller: ViewController!
    var alertMessageTool: AlertMessageTool!
    
    override func setUp() {
        super.setUp()
        viewCOntroller = ViewController()
        var alertMessageTool = AlertMessageTool()
    }
    
    func testGivenOperatorAlertMessage_WhenAlreadyAddingAnOperator_ThenPrintAlertOperatorInView(){
        
    }

    func testGivenAlertMessage_WhenExpressionHaveEnoughElements_ThenPrintAlertInView(){
        
    }

}
