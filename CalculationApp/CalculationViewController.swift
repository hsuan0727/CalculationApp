//
//  CalculationViewController.swift
//  CalculationApp
//
//  Created by Hsuan on 2020/12/16.
//

import UIKit


enum OperationType {
    case add
    case subtract
    case multiply
    case divide
    case recursive
    case none
}


class CalculationViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var performingMath = false
    var opertion:OperationType = .none
    var startNew = true
    
    //設定狀態列顏色
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
   
    @IBAction func numbers(_ sender: UIButton) {
        let inputNumber = sender.tag - 1
        if label.text != nil{
            if startNew == true {
                label.text = "\(inputNumber)"
                startNew = false
            }else{
                if  label.text == "0" || label.text == "+" || label.text == "-" || label.text == "x" || label.text == "/"{
                    label.text = "\(inputNumber)"
                }else{
                    label.text = label.text! + "\(inputNumber)"
                }
        
            }
            numberOnScreen = Double(label.text!) ?? 0
        }
  
    }
    
    @IBAction func clear(_ sender: UIButton) {
        label.text = "0"
        numberOnScreen = 0
        previousNumber = 0
        performingMath = false
        opertion = .none
        startNew = true
        
    }
    
    @IBAction func add(_ sender: UIButton) {
        label.text = "+"
        opertion = .add
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func subtract(_ sender: UIButton) {
        label.text = "-"
        opertion = .subtract
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func multiply(_ sender: UIButton) {
        label.text = "x"
        opertion = .multiply
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func recursive(_ sender: UIButton) {
        label.text = "!"
        opertion = .recursive
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    
    @IBAction func divide(_ sender: UIButton) {
        label.text = "/"
        opertion = .divide
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func negativeSwitch(_ sender: UIButton) {
        numberOnScreen = Double(label.text!)! * -1
        makeOKnumberString(from: numberOnScreen)
        performingMath = true
        startNew = false
    }
    
    
    @IBAction func giveMeAnswer(_ sender: UIButton) {
        if performingMath == true {
            switch opertion {
            case .add:
                numberOnScreen = previousNumber + numberOnScreen
                makeOKnumberString(from:numberOnScreen )
            case .subtract:
                numberOnScreen = previousNumber - numberOnScreen
                makeOKnumberString(from: numberOnScreen)
            case .multiply:
                numberOnScreen = previousNumber * numberOnScreen
                makeOKnumberString(from: numberOnScreen)
            case .divide:
                numberOnScreen = previousNumber / numberOnScreen
                makeOKnumberString(from: numberOnScreen)
            case .recursive:
                let total = factorial(from: UInt64(numberOnScreen))
                numberOnScreen = Double(total)
                makeOKnumberString(from: numberOnScreen)

            case .none:
                label.text = "0"
            
            }
            performingMath = false
            startNew = true
        }
    }
    
    func makeOKnumberString(from number:Double) {
        var okText:String
        if floor(number) == number {
            okText = "\(Int(number))"
        }else{
            okText = "\(number)"
        }
        if okText.count >= 10 {
            okText = String(okText.prefix(10))
        }
        label.text = okText
    }
    
    func factorial(from factorialNumber:UInt64)->UInt64{
        if factorialNumber == 0 {
            return 1
        } else {
            return factorialNumber * factorial(from: factorialNumber - 1)
        }
 
    }
    
    
    
        override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
