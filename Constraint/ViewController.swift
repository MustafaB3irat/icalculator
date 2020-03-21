//
//  ViewController.swift
//  Constraint
//
//  Created by Asal Macbook 1 on 17/03/2020.
//  Copyright © 2020 Mustafa Birat. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var calculator: Calculator = Calculator()
    
    @IBOutlet weak var resutlLabel: UILabel!
    @IBOutlet weak var secondaryResult: UILabel!
    @IBOutlet weak var operationLabel: UILabel!
    
    @IBOutlet var roundedButtons: [UIButton]!
    var x: Double? = 0.0 , y: Double? = 0.0 , op: Character = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        roundButtonCorners()
        
        // Do any additional setup after loading the view.
    }
    
    
    private func roundButtonCorners() {
        
        for button in roundedButtons {
            
            button.layer.cornerRadius = 16
                      button.layer.masksToBounds = true
            
            if button.currentTitle! == "-"{

                button.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
            }else{

                button.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
            }
          
        }

    }
    
    @IBAction func OperationIsClicked(_ sender: UIButton) {
        
        secondaryResult.text = resutlLabel.text
        
                x = Double(resutlLabel.text!.trimmingCharacters(in: .whitespacesAndNewlines))
                operationLabel.text = sender.currentTitle!
                resutlLabel.text = "0"
        
                op = sender.currentTitle![sender.currentTitle!.startIndex]
                
        
        
    }
    
    @IBAction func NumberIsPressed(_ sender: UIButton) {
        
        resutlLabel.text! = calculator.NumberBuilder(inputString: sender.currentTitle! , resultLabel: resutlLabel.text!)
 
    }
    
    
    @IBAction func clear(_ sender: UIButton) {
   
        if resutlLabel.text!.count > 1{
        resutlLabel.text!.removeLast()
        }else{
            resutlLabel.text = "0"
        }
        
    }
    
    
    @IBAction func calculate(_ sender: UIButton) {
        
        y = Double(resutlLabel.text!.trimmingCharacters(in: .whitespacesAndNewlines))
        
        
        secondaryResult.text = ""
        operationLabel.text = ""
    
        resutlLabel.text = String(calculator.Calculate(x: x!, y: y!, operation: String(op)))
        
    }
    
    

    
    
}

