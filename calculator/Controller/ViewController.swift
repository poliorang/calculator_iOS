//
//  ViewController.swift
//  calculator
//
//  Created by poliorang on 15.03.2023.
//

import UIKit

class ViewController: UIViewController {

    private let display       = UITextField()
    private let displayView   = UIView()
    private let conteinerView = UIStackView()
    
    var service: CalculatorService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service = CalculatorService(displayView: self)
        
        view.backgroundColor = .systemPink
        
        
        configureAppearance()
    }
    
    
    func updateDisplay(text: String) {
        print(text)
    }


}

private extension ViewController {
    func configureAppearance() {
        setupConteiner()
        setupDisplayView()
        setupButtons()
    }
    
    func setupConteiner() {
        conteinerView.axis = .vertical
        conteinerView.frame = CGRect(x: 0, y: 60, width: Constants.screenWidth, height: Constants.screenHeight - 60)
        conteinerView.backgroundColor = .brown
        
        self.view.addSubview(conteinerView)
    }
    
    func setupDisplayView() {
        
    }
    
    func setupButtons() {
        let line1 = createRows(y: 0)
        line1.addSubview(createButton(order: 0, title: "0", tag: 0))
        line1.addSubview(createButton(order: 1, title: "1", tag: 1))
        line1.addSubview(createButton(order: 2, title: "2", tag: 2))
        line1.addSubview(createButton(order: 3, title: "3", tag: 3))
        conteinerView.addSubview(line1)
        let line2 = createRows(y: 80 + 2)
        line2.addSubview(createButton(order: 0, title: "4", tag: 4))
        line2.addSubview(createButton(order: 1, title: "5", tag: 5))
        line2.addSubview(createButton(order: 2, title: "6", tag: 6))
        line2.addSubview(createButton(order: 3, title: "7", tag: 7))
        conteinerView.addSubview(line2)
        let line3 = createRows(y: (80 + 2) * 2)
        line3.addSubview(createButton(order: 0, title: "8", tag: 8))
        line3.addSubview(createButton(order: 1, title: "9", tag: 9))
        line3.addSubview(createButton(order: 2, title: "10", tag: 10))
        line3.addSubview(createButton(order: 3, title: "0", tag: 11))
        conteinerView.addSubview(line3)
        let line4 = createRows(y: (80 + 2) * 3)
        line4.addSubview(createButton(order: 0, title: "0", tag: 12))
        line4.addSubview(createButton(order: 1, title: "1", tag: 13))
        line4.addSubview(createButton(order: 2, title: "2", tag: 14))
        line4.addSubview(createButton(order: 3, title: "3", tag: 15))
        conteinerView.addSubview(line4)
    }
    
    func createButton(order: Int, title: String, tag: Int) -> UIButton {
        let button = UIButton(frame: CGRect(x: (0 + Int(Constants.screenWidth / 4) * order + 2), y: 0, width: Int(Constants.screenWidth) / 4 - 2, height: 80))
        
        button.setTitle(title, for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        
        return button
    }
    
    func createRows(y: Int) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.frame = CGRect(x: 0, y: y, width: Int(Constants.screenWidth), height: 80)
        
        return stack
    }
}
