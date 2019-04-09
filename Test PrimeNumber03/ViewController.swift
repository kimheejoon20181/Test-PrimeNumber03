//
//  ViewController.swift
//  Test PrimeNumber03
//
//  Created by D7703_22 on 2019. 4. 9..
//  Copyright © 2019년 fb. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var textP: UITextField!
    @IBOutlet weak var lbl1: UILabel!
    var isPrime = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textP.delegate = self
        textP.placeholder = "숫자 입력"
        
    }

    @IBAction func buttonP(_ sender: Any) {
        //옵셔널 바인딩? optional binding 숫자뺴고 다 제외
        if let number = Int(textP.text!) {
            
            var isPrime = true
            
            if number <= 0 {
                lbl1.text = "input correct value!"
                textP.text = ""
                return
            }
            
            if number == 1 {
                isPrime = false
            }
            
            if number != 1 && number != 2 {
                for i in 2 ..< number {
                    if number % i == 0 {
                        isPrime = false
                    }
                }
            }
            
            if isPrime == true {
                lbl1.text = "prime number"
            } else {
                lbl1.text = "Not Prime number"
            }
            textP.text = ""
        } else {
            // 0과 숫자값이 입력됐을때...
            print("nil 발생")
            lbl1.text = "input numeric value!"
            textP.text = ""
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textP.resignFirstResponder()
        return true
    }
    
}

