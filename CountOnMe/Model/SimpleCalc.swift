//
//  SimpleCalc.swift
//  CountOnMe
//
//  Created by Kel_Jellysh on 07/04/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation

class SimpleCalc {
    
    private var _operationsToReduce = [String]()
    
    
    func calcWithUserChoiceOperands( tab: [String]) -> [String] {
        
        _operationsToReduce = tab
        
        while _operationsToReduce.count > 1 {
            var prio = 0
            if let index = _operationsToReduce.firstIndex(where: {$0 == "x" || $0 == "/"}) {
                prio = index - 1
                print("operand prioritaire est à la place \(index)")
                
            }
            let left = Int(_operationsToReduce[prio])!
            let operand = _operationsToReduce[prio + 1]
            let right = Int(_operationsToReduce[prio + 2])!

            let result: Int
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
            case "x": result = left * right
            case "/": result = left / right
            default: fatalError("Unknown operator !")
            }

//            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            for _ in 1...3{
                _operationsToReduce.remove(at: prio)
            }
            _operationsToReduce.insert("\(result)", at: prio)
        }
        
        return _operationsToReduce
    }
    
    func doubleOperandFollow() {
        
    }
    
}
