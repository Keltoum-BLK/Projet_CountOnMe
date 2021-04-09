//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!

    var elements: [String] {
        return textView.text.split(separator: " ").map { "\($0)" }
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
        return textView.text.firstIndex(of: "=") != nil
    }
    
    var alreadyReset : Bool {
        return textView.text != ""
    }
    

    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    private func operatorAlreadyChoosen() {
        let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }

    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else { return }

        if expressionHaveResult {
            textView.text = ""
        }

        textView.text.append(numberText)
    }

    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        if canAddOperator {
            textView.text.append(" + ")
        } else {
           operatorAlreadyChoosen()
        }
    }

    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        if canAddOperator {
            textView.text.append(" - ")
        } else {
            operatorAlreadyChoosen()
        }
    }
    
    
    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
        if canAddOperator {
            textView.text.append(" x ")
        } else {
            operatorAlreadyChoosen()
        }
    }
    
    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        if canAddOperator {
            textView.text.append(" / ")
        } else {
            operatorAlreadyChoosen()
        }
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard expressionIsCorrect else {
            let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }

        guard expressionHaveEnoughElement else {
            let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }

        // Create local copy of operations
        var operationsToReduce = elements

        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
            var prio = 0
            if let index = operationsToReduce.firstIndex(where: {$0 == "x" || $0 == "/"}) {
                prio = index - 1
                print("operand prioritaire est à la place \(index)")
                
            }
            let left = Int(operationsToReduce[prio])!
            let operand = operationsToReduce[prio + 1]
            let right = Int(operationsToReduce[prio + 2])!

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
                operationsToReduce.remove(at: prio)
            }
            operationsToReduce.insert("\(result)", at: prio)
        }

        textView.text.append(" = \(operationsToReduce.first!)")
    }
    
    
    @IBAction func resetCalc(_ sender: UIButton) {
        if alreadyReset {
            textView.text = ""
            print("Effacé")
        } else {
            let alertVC = UIAlertController(title: "Erreur", message: "Vous avez déjà effacer la dernière opération !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
            print("deja effacé")
        }
    }
    

}
