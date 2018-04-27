//
//  ConverterViewController.swift
//  ConversionCalculator
//
//  Created by Mandy Rogers on 4/12/18.
//  Copyright © 2018 Mandy Rogers. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {

    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    @IBOutlet weak var numberInputButton: UITextField!
    @IBOutlet weak var numberOutput: UITextField!
    
    var decimalBool = false
    
    @IBAction func addNumbers (_ sender: UIButton) {
        
        if sender.tag == 11 {
            if let double = Double(numberInputButton.text!) {
                numberInputButton.text = String(double * -1)
                
                return
            }
        }
        
        if sender.tag == 10 {
            numberInputButton.text = ""
            decimalBool = false
            return
        }
        
        if sender.tag <= 9 {
            numberInputButton.text = numberInputButton.text! + String(sender.tag)
                return
        }
        
        if sender.tag == 12 && self.decimalBool == false {
                self.numberInputButton.text = numberInputButton.text! + "."
                self.decimalBool = true
            return
        }
        
        
    }
    
    @IBAction func doConversions(_ sender: Any) {
        let convertAlert = UIAlertController(title: "Convert", message: "Choose Converter", preferredStyle: UIAlertControllerStyle.alert)

        convertAlert.addAction(UIAlertAction(title: "fahrenheit to celcius", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.converter = conversionsArray[0]
            self.checkConverter()
        }))

        convertAlert.addAction(UIAlertAction(title: "celcius to fahrenheit", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.converter = conversionsArray[1]
            self.checkConverter()

        }))

        convertAlert.addAction(UIAlertAction(title: "miles to kilometers", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.converter = conversionsArray[2]
            self.checkConverter()
        }))

        convertAlert.addAction(UIAlertAction(title: "kilometers to miles", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.converter = conversionsArray[3]
            self.checkConverter()
            
        }))

        self.present(convertAlert, animated: true, completion: nil)
    }

    var converter: conversions?

    override func viewDidLoad() {
        super.viewDidLoad()
     converter = conversionsArray[0]
        
        checkConverter()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func checkConverter () -> Void {
        switch converter?.label {
        case "fahrenheit to celsius":
            inputDisplay.text = converter?.inputUnit
            outputDisplay.text = converter?.outputUnit
            
            if let double = Double(numberInputButton.text!) {
                numberOutput.text = String((double - 32) / 1.8)
            }
            
        case "celcius to fahrenheit":
            inputDisplay.text = converter?.inputUnit
            outputDisplay.text = converter?.outputUnit
            
            if let double = Double(numberInputButton.text!) {
                numberOutput.text = String((double * 1.8 + 32))
            }
        case "miles to kilometers":
            inputDisplay.text = converter?.inputUnit
            outputDisplay.text = converter?.outputUnit
            
            if let double = Double(numberInputButton.text!) {
                numberOutput.text = String((double * 1.609344))
            }
            
        case "kilometers to miles":
            inputDisplay.text = converter?.inputUnit
            outputDisplay.text = converter?.outputUnit
            
            if let double = Double(numberInputButton.text!) {
                numberOutput.text = String((double / 1.609344))
            }
            
        default:
            inputDisplay.text = "ERROR"
            outputDisplay.text = "ERROR"
        }
    }
}
