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
    
    var simpleCalc = SimpleCalc()
    
    var alreadyReset : Bool {
        return textView.text != ""
    }
    

    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        simpleCalc.delegate = self
    }
    

    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else { return }
        
        simpleCalc.addNumber(number: numberText)
    }

    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        simpleCalc.tappedAddition()
    }

    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        simpleCalc.tappedSubstration()
    }
    
    
    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
        simpleCalc.tappedMultiplication()
    }
    
    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        simpleCalc.tappedDivision()
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        simpleCalc.calculator()
    }
    
    
    @IBAction func resetCalc(_ sender: UIButton) {
//        if alreadyReset {
//            textView.text = ""
//            print("Effacé")
//        } else {
//            displayAlert("Vous avez déjà effacer la dernière opération !")
//        }
    }
    

}

extension ViewController: SimpleCalcDelegate {
    func displayAlert(_ message: String) {
        let alertVC = UIAlertController(title: "Erreur", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    func didReceiveData(_ data: String) {
        textView.text = simpleCalc.textView
    }
    
    

}
