//
//  SimpleCalc.swift
//  CountOnMe
//
//  Created by Kel_Jellysh on 07/04/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation
protocol SimpleCalcDelegate: AnyObject {
    
    func didReceiveData(_ data: String)
    func displayAlert(_ message : String)
}


class SimpleCalc {
    
    weak var delegate: SimpleCalcDelegate?
    var textView = String()
    var elements: [String] {
        return textView.split(separator: " ").map { "\($0)" }
    }
    
    // Error check computed variables
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/"
    }
    
    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }
    
    var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/"
    }
    
    var expressionHaveResult: Bool {
        return textView.firstIndex(of: "=") != nil
    }
    
    var alreadyReset : Bool {
        return textView != ""
    }
    
    var dontOperandFirst: Bool {
        return elements.count >= 1
    }
    
    func sendToController(data: String) {
        delegate?.didReceiveData(data)
    }
    
    func displayAlertInController(message: String) {
        delegate?.displayAlert(message)
    }

    func addNumber(number: String) {
        if expressionHaveResult {
            textView = ""
        }
        textView += number
        sendToController(data: number)
    }
    
    func tappedAddition() {
        
        addOperand("+")
//        if expressionHaveResult {
//            textView = ""
//        }
//        if canAddOperator {
//            if dontOperandFirst {
//            textView += " + "
//            } else {
//                delegate?.displayAlert("Entrez un nombre")
//            }
//        } else {
//            delegate?.displayAlert("Un operateur est déja mis !")
//        }
//        return sendToController(data: "+")
    }
    
    func tappedSubstration() {
        if canAddOperator {
            if dontOperandFirst {
            textView += " - "
            } else {
                delegate?.displayAlert("Entrez un nombre")
            }
        } else {
            delegate?.displayAlert("Un operateur est déja mis !")
        }
        return sendToController(data: "-")
    }
    
    func tappedMultiplication() {
        if canAddOperator {
            if dontOperandFirst {
            textView += " x "
            } else {
                delegate?.displayAlert("Entrez un nombre")
            }
        } else {
            delegate?.displayAlert("Un operateur est déja mis !")
        }
        return sendToController(data: "x")
    }
    
    func tappedDivision() {
        if canAddOperator {
            if dontOperandFirst {
            textView += " / "
            } else {
                delegate?.displayAlert("Entrez un nombre")
            }
        } else {
            delegate?.displayAlert("Un operateur est déja mis !")
        }
        return sendToController(data: "/")
        
    }
    
    func addOperand(_ operand: String){
        let spaceOperator = " " + operand + " "
        if expressionHaveResult {
            textView = ""
        }
        if canAddOperator {
            if dontOperandFirst {
            textView += spaceOperator
            } else {
                delegate?.displayAlert("Entrez un nombre")
            }
        } else {
            delegate?.displayAlert("Un operateur est déja mis !")
        }
        return sendToController(data: operand)
    }
    
    func calculator() {
        var operationsToReduce = elements
        
        guard expressionIsCorrect else { return  displayAlertInController(message: "Entrez une expression correcte !") }
        guard expressionHaveEnoughElement else {  return displayAlertInController(message: "Démarrez un nouveau calcul !")}
        
        while operationsToReduce.count > 1 {
            var prio = 0
            if let index = operationsToReduce.firstIndex(where: {$0 == "x" || $0 == "/"}) {
                prio = index - 1
                print("operand prioritaire est à la place \(index)")
                
            }
            guard let left = Double(operationsToReduce[prio]) else { return }
            let operand = operationsToReduce[prio + 1]
            guard let right = Double(operationsToReduce[prio + 2]) else { return }
            
            var result: Double = 0.00
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
            case "x": result = left * right
            case "/": result = left / right
            default: delegate?.displayAlert("Démarrer un nouveau calcul.")
                return
            }
            
            //            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            for _ in 1...3{
                operationsToReduce.remove(at: prio)
            }
            operationsToReduce.insert("\(result)", at: prio)
        }
        textView.append(" = \(operationsToReduce.first!)")
        sendToController(data: textView)
    }
    
    func resetCalc() {
            if alreadyReset {
                    textView = ""
                } else {
                    delegate?.displayAlert("Vous avez déjà effacé le calcul.")
                }
            return sendToController(data: textView)
        
        
    }
    
}
