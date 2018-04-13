//
//  Conversions.swift
//  ConversionCalculator
//
//  Created by Mandy Rogers on 4/12/18.
//  Copyright © 2018 Mandy Rogers. All rights reserved.
//

import Foundation

struct conversions {
    let label: String
    let inputUnit: String
    let outputUnit: String
    
    init(label: String, inputUnit: String, outputUnit: String) {
        self.label = label
        self.inputUnit = inputUnit
        self.outputUnit = outputUnit
    }
}

let conversionsArray = [conversions(label: "fahrenheit to celsius", inputUnit: "°F", outputUnit: "°C"), conversions(label: "celcius to fahrenheit", inputUnit: "°C", outputUnit: "°F"), conversions(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"), conversions(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi")]
