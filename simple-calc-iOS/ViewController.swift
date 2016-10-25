//
//  ViewController.swift
//  simple-calc-iOS
//
//  Created by Rohan Thakkar on 10/23/16.
//  Copyright © 2016 Rohan Thakkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UITextField!
    
    var inputs = [String]()
    var toggle: Bool = false
    var operation: String = ""
    var temp: String = ""
    
    
    func factorial(n: Int) -> Int{
        if n==1{return 1}
        return n*factorial(n:(n-1))
        
    }
    
    @IBAction func pressed_reset(_ sender: AnyObject) {
        inputs = [String]()
        operation = ""
        display.text = ""
        toggle = false
        temp = ""
    }
    
    // NO NEGATIVE NUMBER SUPPORT BECAUSE '-' calls the minus function!!!
    
    func special_functions(inputs: [String], operation: String) -> String{
        
        if operation == "count"{
            return String(inputs.count)
        }
        if operation == "avg"{
            var sum = Double(0)
            for i in inputs{
                sum += Double(i)!
            }
            return String(sum/Double(inputs.count))
        }
        
        if operation == "fact" && inputs.count == 1{
            return String(factorial(n:Int(inputs[0])!))
        }
        return ""
        
    }
    
    func calculate(inputs: [String], operation:String) -> String{
        /*
         let o_1 = Double(op1)!
         let o_2 = Double(op2)!
         //var answer = ""
         
         */
        
        if operation == "+"{
            var answer = 0.0
            
            for i in inputs{
                answer += Double(i)!
            }
            return String(answer)
            
        }
        if operation == "-"{
            var answer = 0.0
            
            for i in inputs{
                answer -= Double(i)!
            }
            return String(answer)
            
        }
        if operation == "*"{
            var answer = 1.0
            
            for i in inputs{
                answer *= Double(i)!
            }
            return String(answer)
            
        }
        if operation == "/"{
            var answer = Double(inputs[0])!
            var i = 1
            while i < inputs.count{
                answer /= Double(inputs[i])!
                i += 1
            }
            return String(answer)
            
        }
        if operation == "%"{
            //let answer = o_1%o_2
            var answer = Double(inputs[0])!
            var i = 1
            while i < inputs.count{
                answer = answer.truncatingRemainder(dividingBy: Double(inputs[i])!)
                i += 1
            }
            return String(answer)
            /*
             let answer = o_1.truncatingRemainder(dividingBy: o_2)
             
             return String(answer)
             */
            
        }
        return ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressed_add(_ sender: AnyObject) {
        /*
         if operation != ""{
         op2 = "+"
         display.text = op2
         
         }
         else if op1 == ""{
         op1 = "+"
         display.text = op1
         
         }
         
         else{
         if first_operand == true{
         first_operand = false
         }
         operation = "+"
         display.text = operation
         
         //display.text = op1 + operation
         }
         /*
         */
         if operation != ""{
         temp = "+"
         display.text = temp
         
         }
         else
         */
        if temp==""{
            temp = "+"
            display.text = temp
            
        }
            
        else{
            /*
             if first_operand == true{
             first_operand = false
             }
             */
            inputs.append(temp)
            temp = ""
            if toggle == true{
                display.text = calculate(inputs: inputs, operation: "+")
                
            }
            else{
                
                operation = "+"
                display.text = operation
                
                //display.text = op1 + operation
            }
        }
    }
    
    @IBAction func pressed_avg(_ sender: AnyObject) {
        inputs.append(temp)
        temp = ""
        if toggle == true{
            display.text = special_functions(inputs: inputs, operation: "avg")
        }
        else{
            
            operation = "avg"
        }
        /*inputs.append(op1)
         op1 = ""
         var d = ""
         //var i = 0
         
         for i in inputs{
         d += i
         d += operation
         //i += 1
         }
         
         //d += inputs[inputs.count-1]
         display.text = d
         */
    }
    
    @IBAction func pressed_mod(_ sender: AnyObject) {
        inputs.append(temp)
        temp = ""
        if toggle == true{
            display.text = calculate(inputs: inputs, operation: "%")
            
        }
        else{
            
            operation = "%"}
        /*
         if first_operand == true{
         first_operand = false
         }
         operation = "%"
         display.text = operation
         //display.text = op1 + operation
         */
    }
    
    @IBAction func pressed_equals(_ sender: AnyObject) {
        if toggle == false{
            if operation=="count" || operation == "fact" || operation == "avg"{
                if temp != "" {inputs.append(temp)}
                display.text = special_functions(inputs: inputs, operation: operation)
            }
            else if inputs.count >= 1 && temp != ""{
                inputs.append(temp)
                display.text = calculate(inputs: inputs, operation: operation)
            }
            else{
                display.text = "Too soon"
                
                //String(Double(op1)! + Double(op2)!)
            }
            /*
             if operation=="count" || operation == "fact" || operation == "avg"{
             if op1 != "" {inputs.append(op1)}
             display.text = special_functions(inputs: inputs, operation: operation)
             }
             else if first_operand == true{
             display.text = "Too soon"
             
             }
             else{
             display.text = calculate(op1: inputs[0], op2: inputs[1], operation: operation)
             //String(Double(op1)! + Double(op2)!)
             }
             */
        }
    }
    //issues here
    @IBAction func pressed_count(_ sender: AnyObject) {
        inputs.append(temp)
        temp = ""
        if toggle == true{
            display.text = special_functions(inputs: inputs, operation: "count")
            
        }
        else{
            operation = "count"
            
            display.text = operation
        }
        /*
         var d = ""
         //var i = 0
         
         for i in inputs{
         d += i
         d += operation
         //i += 1
         }
         
         
         //d += inputs[inputs.count-1]
         display.text = d
         count += 1
         operation = "count"
         
         let temp = String(describing:display.text)
         
         display.text = temp + String("count")
         */
    }
    @IBAction func pressed_sub(_ sender: AnyObject) {
        /*
         if operation != ""{
         op2 = "-"
         display.text = op2
         }
         else if op1==""{
         op1 = "-"
         display.text = op1
         }
         else{
         
         if first_operand == true{
         first_operand = false
         }
         operation = "-"
         display.text = operation
         }
         */
        //display.text = op1 + operation
        
        /*
         if operation != ""{
         temp = "-"
         display.text = temp
         
         }
         else if inputs.count == 0{
         temp = "-"
         display.text = temp
         }
         */
        if temp==""{
            temp = "-"
            display.text = temp
            
        }
            
            
        else{
            /*
             if first_operand == true{
             first_operand = false
             }
             */
            inputs.append(temp)
            temp = ""
            if toggle == true{
                display.text = calculate(inputs: inputs, operation: "-")
            }
            else{
                
                operation = "-"
                display.text = operation
            }
            //display.text = op1 + operation
        }
    }
    
    @IBAction func pressed_enter(_ sender: AnyObject) {
        
        if toggle == true{
            inputs.append(temp)
            temp = ""
            display.text = temp
        }
    }
    
    @IBAction func pressed_mul(_ sender: AnyObject) {
        /*if first_operand == true{
         first_operand = false
         }
         operation = "*"
         display.text = operation
         */
        inputs.append(temp)
        temp = ""
        if toggle == true{
            display.text = calculate(inputs: inputs, operation: "*")
            
        }
        else{
            operation = "*"
            display.text = operation
        }
        
        //display.text = op1 + operation
        
    }
    
    @IBAction func pressed_toggle(_ sender: AnyObject) {
        toggle = true
    }
    
    @IBAction func pressed_dot(_ sender: AnyObject) {
        if temp==""{
            temp = String("0.")
        }
        else{
            temp += String(".")
        }
        display.text = temp
        
        /*
         if first_operand == true{
         if op1==""{
         op1 = String("0.")
         }
         else{
         op1 += String(".")
         }
         display.text = op1
         }
         else{
         if op2==""{
         op2 = String("0.")
         }
         else{
         op2 += String(".")
         }
         display.text = op2
         
         //display.text = op1 + operation + op2
         }
         */
    }
    @IBAction func pressed_div(_ sender: AnyObject) {
        /*
         if first_operand == true{
         first_operand = false
         }
         */
        inputs.append(temp)
        temp = ""
        if toggle == true{
            display.text = calculate(inputs: inputs, operation: "/")
            
        }
        else{
            
            operation = "/"
            display.text = operation
        }
        //display.text = op1 + operation
    }
    
    @IBAction func pressed_fact(_ sender: AnyObject) {
        inputs.append(temp)
        temp = ""
        if toggle == true{
            
            display.text = special_functions(inputs: inputs, operation: "fact")
            
        }
        else{
            operation = "fact"
            
            display.text = operation
        }
        /*
         operation = "fact"
         inputs.append(op1)
         op1 = ""
         var d = ""
         //var i = 0
         
         for i in inputs{
         d += i
         d += operation
         //i += 1
         }
         
         //d += inputs[inputs.count-1]
         display.text = d
         */
    }
    
    @IBAction func pressed_0(_ sender: AnyObject) {
        //display.text = "0"
        /*
         if first_operand == true{
         op1 += String(0)
         display.text = op1
         }
         else{
         op2 += String(0)
         display.text = op2
         
         //display.text = op1 + operation + op2
         //add to display
         }
         */
        temp += String(0)
        display.text = temp
    }
    
    @IBAction func pressed_9(_ sender: AnyObject) {
        /*
         if first_operand == true{
         op1 += String(9)
         display.text = op1
         }
         else{
         op2 += String(9)
         display.text = op2
         
         //display.text = op1 + operation + op2
         //add to display
         }
         */
        temp += String(9)
        display.text = temp
    }
    
    @IBAction func pressed_8(_ sender: AnyObject) {
        /*
         if first_operand == true{
         op1 += String(8)
         display.text = op1
         }
         else{
         op2 += String(8)
         display.text = op2
         
         //display.text = op1 + operation + op2
         //add to display
         }
         */
        temp += String(8)
        display.text = temp
    }
    
    @IBAction func pressed_7(_ sender: AnyObject) {
        /*
         if first_operand == true{
         op1 += String(7)
         display.text = op1
         }
         else{
         op2 += String(7)
         display.text = op2
         
         //display.text = op1 + operation + op2
         //add to display
         }
         */
        temp += String(7)
        display.text = temp
    }
    
    @IBAction func pressed_6(_ sender: AnyObject) {
        /*
         if first_operand == true{
         op1 += String(6)
         display.text = op1
         }
         else{
         op2 += String(6)
         display.text = op2
         
         //display.text = op1 + operation + op2
         //add to display
         }
         */
        temp += String(6)
        display.text = temp
    }
    @IBAction func pressed_5(_ sender: AnyObject) {
        /*
         if first_operand == true{
         op1 += String(5)
         display.text = op1
         }
         else{
         op2 += String(5)
         display.text = op2
         
         //display.text = op1 + operation + op2
         //add to display
         }
         */
        temp += String(5)
        display.text = temp
    }
    @IBAction func pressed_1(_ sender: AnyObject) {
        /*
         if first_operand == true{
         op1 += String(1)
         display.text = op1
         }
         else{
         op2 += String(1)
         display.text = op2
         
         //display.text = op1 + operation + op2
         //add to display
         }
         */
        temp += String(1)
        display.text = temp
    }
    
    
    @IBAction func pressed_2(_ sender: AnyObject) {
        /*
         if first_operand == true{
         op1 += String(2)
         display.text = op1
         }
         else{
         op2 += String(2)
         display.text = op2
         //display.text = op1 + operation + op2
         //add to display
         }
         */
        temp += String(2)
        display.text = temp
    }
    
    @IBAction func pressed_3(_ sender: AnyObject) {
        /*
         if first_operand == true{
         op1 += String(3)
         display.text = op1
         }
         else{
         op2 += String(3)
         display.text = op2
         
         //display.text = op1 + operation + op2
         //add to display
         }
         */
        temp += String(3)
        display.text = temp
    }
    
    @IBAction func pressed_4(_ sender: AnyObject) {
        /*
         if first_operand == true{
         op1 += String(4)
         display.text = op1
         }
         else{
         op2 += String(4)
         display.text = op2
         
         //display.text = op1 + operation + op2
         //add to display
         }
         */
        temp += String(4)
        display.text = temp
    }
    
}

