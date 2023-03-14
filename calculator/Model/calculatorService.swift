//
//  calculatorService.swift
//  calculator
//
//  Created by poliorang on 15.03.2023.
//

import Foundation

//
//  main.swift
//  logicForCalculator
//
//  Created by poliorang on 15.03.2023.
//

import Foundation

class CalculatorService {
    

    var currentNumber = "0"
    var currentOperation = Operation.nonAction
    var fisrtNumber = 0.0
    var secondNumber = 0.0
    var displayView: ViewController

    init(displayView: ViewController) {
        self.displayView = displayView
    }

    var result = ""

    func makeCalculation(operation: Operation) {
        if currentOperation != .nonAction {
            if currentNumber != "" {
                secondNumber = Double(currentNumber) ?? 0.0
                switch operation {
                case .addition:
                    result = String(fisrtNumber + secondNumber)
                case .substraction:
                    result = String(fisrtNumber - secondNumber)
                case .multiplication:
                    result = String(fisrtNumber * secondNumber)
                case .division:
                    result = String(fisrtNumber / secondNumber)
                default:
                    result = ""
                }
            }
        } else {
            fisrtNumber = Double(currentNumber) ?? 0.0
            currentNumber = ""
//            updateDisplay(text: currentNumber)
            currentOperation = operation
        }
    }

    func addition() {
        makeCalculation(operation: .addition)
    }

    func substraction() {
        makeCalculation(operation: .substraction)
    }

    func multiplication() {
        makeCalculation(operation: .multiplication)
    }

    func division() {
        makeCalculation(operation: .division)
    }

    func makeResult() {
        makeCalculation(operation: currentOperation)
    }

    func acAction() {
        currentNumber = "0"
        currentOperation = Operation.nonAction
        fisrtNumber = 0.0
        secondNumber = 0.0
        result = ""
    }
}


