//
//  ViewController.swift
//  Calculater_project
//
//  Created by apple on 9/12/25.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var calculatorWorkings: UILabel!
    
    @IBOutlet weak var calcutatorResults: UILabel!
    
    var workingString: String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        calcutatorResults.text = "0"
        
    }
    func clearAll()
    {
        workingString = ""
        calcutatorResults.text = ""
        calcutatorResults.text = ""
        
    }
    @IBAction func equalTap(_ sender: Any){
        if(validInput())
        {
            _ = workingString.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: workingString)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = String(format: "%.1f", result)
            calcutatorResults.text = resultString
        }
        else {
            let alert = UIAlertController(title: "Invalid Input", message: "Calculater unable to do math based on input", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    func validInput() -> Bool
    {
    var count = 0
    var funcCharIndexs = [Int]()
    
    for char in workingString{
        if(specificCharInString(char: char))
            {
            funcCharIndexs.append(count)
        }
        count += 1
        
    }
        var previous: Int = -1
        
        for index in funcCharIndexs{
            if(previous == 0)
            {
                return false
            }
                
                if(index == workingString.count - 1)
                {
                    return false
                }
            if (previous != -1)
                {
                if(index - previous == 1)
                {
                    return false
                }
            }
            previous = index
            
        }
        return true
    }
    
    func specificCharInString(char: Character) -> Bool
    {
        if(char == "*")
        {
            return true
        }
        else if(char == "/")
        {
            return true
        }
        else if(char == "+")
        {
            return true
        }
        else if(char == "-")
        {
            return true
        }
        return false
    }
    
    func formatResultString(result: Double) -> String {
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", result)
        } else {
            return String(format: "%.2f", result)
        }
    }

        
    @IBAction func allClearTap(_ sender: Any) {
        clearAll()
    }
    
        @IBAction func backTap(_ sender: Any){
            if !workingString.isEmpty
            {
                workingString.removeLast()
                calcutatorResults.text = workingString
            }
        }
        func addToWorkings(value: String)
        {
            workingString.append(value)
            calcutatorResults.text = workingString
        }
        @IBAction func percentTap(_ sender: Any)
        {
            addToWorkings(value: "%")
        }
        @IBAction func divideTap(_ sender: Any)
        {
            addToWorkings(value: "/")
        }
        @IBAction func timesTap(_ sender: Any)
        {
            addToWorkings(value: "*")
        }
        @IBAction func minusTap(_ sender: Any)
        {
            addToWorkings(value: "-")
        }
        @IBAction func plusTap(_ sender: Any)
        {
            addToWorkings(value: "+")
        }
        @IBAction func decimalTap(_ sender: Any)
        {
            addToWorkings(value: ".")
        }
        @IBAction func zeroTap(_ sender: Any)
        {
            addToWorkings(value: "0")
        }
        
        @IBAction func oneTap(_ sender: Any)
        {
            addToWorkings(value: "1")
        }
        @IBAction func twoTap(_ sender: Any)
        {
            addToWorkings(value: "2")
        }
        @IBAction func threeTap(_ sender: Any)
        {
            addToWorkings(value: "3")
        }
        @IBAction func fourTap(_ sender: Any)
        {
            addToWorkings(value: "4")
        }
        @IBAction func fiveTap(_ sender: Any)
        {
            addToWorkings(value: "5")
        }
        @IBAction func sixTap(_ sender: Any)
        {
            addToWorkings(value: "6")
        }
        @IBAction func sevenTap(_ sender: Any)
        {
            addToWorkings(value: "7")
        }
        @IBAction func eightTap(_ sender: Any)
        {
            addToWorkings(value: "8")
        }
        @IBAction func nineTap(_ sender: Any)
        {
            addToWorkings(value: "9")
        }
        
    }
