//
//  SimpleCalc.swift
//  CountOnMe
//
//  Created by Kel_Jellysh on 07/04/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation
//MARK: protocle to communicate with the viewCOntroller
protocol SimpleCalcDelegate: AnyObject {
    //methods to communicate the data to ViewController
    func didReceiveData(_ data: String)
    func displayAlert(_ message : String)
}


class SimpleCalc {
    
    //MARK: Variables used to check and run the code
    //variables using to run the code
    weak var delegate: SimpleCalcDelegate?
    var textView = String()
    var elements: [String] {
        return textView.split(separator: " ").map { "\($0)" }
    }
    
    var result: Double = 0.00
    
    // Error check computed private variables
    private var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/"
    }
    
    private var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }
    
    private var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/"
    }
    
    private var expressionHaveResult: Bool {
        return textView.firstIndex(of: "=") != nil
    }
    
    private var alreadyReset : Bool {
        return textView != ""
    }
    
    private var dontOperandFirst: Bool {
        return elements.count >= 1
    }
    
    private var textError : Bool {
        return textView == "Error"
    }
    
    //MARK: Delegate methods to send data to ViewController
    private func sendToController(data: String) {
        delegate?.didReceiveData(data)
    }
    
    func displayAlertInController(message: String) {
        delegate?.displayAlert(message)
    }
    
    //MARK: methods to add a number, add an operand addition, substration,  multiplication and division.
    func addNumber(number: String) {
        if expressionHaveResult || textError {
            textView = ""
        }
        textView += number
        sendToController(data: number)
    }
    
    func tappedAddition() {
        addOperand("+")
    }
    
    func tappedSubstration() {
        addOperand("-")
    }
    
    func tappedMultiplication() {
        addOperand("x")
    }
    
    func tappedDivision() {
        addOperand("/")
    }
    //method to factorize the methods of adding operators
    private func addOperand(_ operand: String){
        let spaceOperator = " " + operand + " "
        if expressionHaveResult {
            textView = ""
        }
        if canAddOperator {
            if dontOperandFirst {
                textView += spaceOperator
            } else {
                displayAlertInController(message: "Enter a number")
            }
        } else {
            displayAlertInController(message: "An operator is already set")
        }
        return sendToController(data: operand)
    }
    //method to calculate when there have got enough elements.
    func calculator() {
        var operationsToReduce = elements
        
        guard expressionIsCorrect else { return  displayAlertInController(message: "Enter a correct expression !") }
        guard expressionHaveEnoughElement else {  return displayAlertInController(message: "Start a new calculation !")}
        
        while operationsToReduce.count > 1 {
            var prio = 0
            if let index = operationsToReduce.firstIndex(where: {$0 == "x" || $0 == "/"}) {
                prio = index - 1
                print("priority operand is instead \(index)")
                
            }
            guard let left = Double(operationsToReduce[prio]) else { return }
            let operand = operationsToReduce[prio + 1]
            guard let right = Double(operationsToReduce[prio + 2]) else { return }
            
            
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
            case "x": result = left * right
            case "/": result = division(left: left, right: right)
            default: displayAlertInController(message: "Start a new calculation !")
                return
            }
            
            for _ in 1...3{
                operationsToReduce.remove(at: prio)
            }
            operationsToReduce.insert("\(result)", at: prio)
        }
        if !textError {
            textView.append(" = \(operationsToReduce.first!)")
            sendToController(data: textView)
        } else {
            sendToController(data: textView)
        }
    }
    
    //method to alert a division per 0
    func division(left: Double, right: Double) -> Double {
        if right == 0 {
            result = 0.00
            textView = "Error"
            displayAlertInController(message: "You can't divise per 0, try a new calculation.")
        } else {
            result = left / right
            result = round(result * 10000) / 10000
        }
        return result
    }
    
    // method to reset the calculation and start a new one at any moment.
    func resetCalc() {
        if alreadyReset {
            textView = ""
        } else {
            displayAlertInController(message: "You have already cleared the calculation.")
        }
        return sendToController(data: textView)
    }
    
}
