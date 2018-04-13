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
            reloadInputViews()
        case "celcius to fahrenheit":
            inputDisplay.text = converter?.inputUnit
            outputDisplay.text = converter?.outputUnit
        case "miles to kilometers":
            inputDisplay.text = converter?.inputUnit
            outputDisplay.text = converter?.outputUnit
        case "kilometers to miles":
            inputDisplay.text = converter?.inputUnit
            outputDisplay.text = converter?.outputUnit
            reloadInputViews()
        default:
            inputDisplay.text = "ERROR"
            outputDisplay.text = "ERROR"
        }
    }
}
