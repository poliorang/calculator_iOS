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
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
          return .portrait
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.background
        service = CalculatorService(displayView: self)
        
        configureAppearance()
        updateDisplay(text: "0")
    }
    
    
    func updateDisplay(text: String) {
        DispatchQueue.main.async {
            self.display.text = text
        }
    }

    @objc
    func buttonPressed(_ sender: UIButton) {
        print(sender.tag)
        switch sender.tag {
        case 0...9:
            service?.numberAction(number: sender.tag)
        case 10:
            print()
            service?.dot()
        case 11:
            service?.makeResult()
        case 12:
            service?.addition()
        case 13:
            service?.substraction()
        case 14:
            service?.multiplication()
        case 15:
            service?.acAction()
        case 16:
            service?.changeSign()
        case 17:
            service?.percent()
        case 18:
            service?.division()
        default:
            break
        }
    }
}

private extension ViewController {
    func configureAppearance() {
        setupConteiner()
        setupDisplay()
        setupButtons()
    }
    
    func setupConteiner() {
        conteinerView.axis = .vertical
        conteinerView.frame = CGRect(x: 0, y: 60, width: Constants.screenWidth, height: Constants.screenHeight)
        conteinerView.alignment = .fill
        conteinerView.distribution = .fill
        view.addSubview(conteinerView)
    }

    func createRows(y: Int) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.frame = CGRect(x: 0, y: y, width: Int(Constants.screenWidth), height: 80)
        
        return stack
    }
    
    func createButton(order: Int, title: String, tag: Int) -> UIButton {
        let button = UIButton(frame: CGRect(x: (0 + Int(Constants.screenWidth / 4) * order + 2), y: 0, width: Int(Constants.screenWidth) / 4 - 2, height: 80))

        button.setTitle(title, for: .normal)
        button.backgroundColor = AppColors.numbers
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.layer.cornerRadius = 7
        button.tag = tag

        return button
   }
    
    func setupLine1() {
        let line1 = createRows(y: Int(displayView.frame.height) + 0)
        
        let acButton = createButton(order: 0, title: "AC", tag: 15)
        acButton.backgroundColor = AppColors.topNumbers
        acButton.setTitleColor(.black, for: .normal)
        acButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
        let changeSignButton = createButton(order: 1, title: "+/-", tag: 16)
        changeSignButton.backgroundColor = AppColors.topNumbers
        changeSignButton.setTitleColor(.black, for: .normal)
        changeSignButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
        let percentButton = createButton(order: 2, title: "%", tag: 17)
        percentButton.backgroundColor = AppColors.topNumbers
        percentButton.setTitleColor(.black, for: .normal)
        percentButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
        let divButton = createButton(order: 3, title: "/", tag: 18)
        divButton.backgroundColor = AppColors.actions
        divButton.setTitleColor(.black, for: .normal)
        divButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
        line1.addSubview(acButton)
        line1.addSubview(changeSignButton)
        line1.addSubview(percentButton)
        line1.addSubview(divButton)
        
        conteinerView.addSubview(line1)
    }
    
    func setupLine2() {
        let line2 = createRows(y: Int(displayView.frame.height) + 82)
        
        let sevenButton = createButton(order: 0, title: "7", tag: 7)
        sevenButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let eightButton = createButton(order: 1, title: "8", tag: 8)
        eightButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let nineButton = createButton(order: 2, title: "9", tag: 9)
        nineButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let multButton = createButton(order: 3, title: "*", tag: 14)
        multButton.backgroundColor = AppColors.actions
        multButton.setTitleColor(.black, for: .normal)
        multButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
        line2.addSubview(sevenButton)
        line2.addSubview(eightButton)
        line2.addSubview(nineButton)
        line2.addSubview(multButton)
        
        conteinerView.addSubview(line2)
    }
    
    func setupLine3() {
        let line3 = createRows(y: Int(displayView.frame.height) + 82 * 2)
        
        let fourButton = createButton(order: 0, title: "4", tag: 4)
        fourButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let fiveButton = createButton(order: 1, title: "5", tag: 5)
        fiveButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let sixButton = createButton(order: 2, title: "6", tag: 6)
        sixButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let subsButton = createButton(order: 3, title: "-", tag: 13)
        subsButton.setTitleColor(.black, for: .normal)
        subsButton.backgroundColor = AppColors.actions
        subsButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
        line3.addSubview(fourButton)
        line3.addSubview(fiveButton)
        line3.addSubview(sixButton)
        line3.addSubview(subsButton)
        
        conteinerView.addSubview(line3)
    }
    
    func setupLine4() {
        let line4 = createRows(y: Int(displayView.frame.height) + 82 * 3)
        
        let oneButton = createButton(order: 0, title: "1", tag: 1)
        oneButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let twoButton = createButton(order: 1, title: "2", tag: 2)
        twoButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let threeButton = createButton(order: 2, title: "3", tag: 3)
        threeButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let plusButton = createButton(order: 3, title: "+", tag: 12)
        plusButton.setTitleColor(.black, for: .normal)
        plusButton.backgroundColor = AppColors.actions
        plusButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
        line4.addSubview(oneButton)
        line4.addSubview(twoButton)
        line4.addSubview(threeButton)
        line4.addSubview(plusButton)
        
        conteinerView.addSubview(line4)
    }
    
    func setupLine5() {
        let line5 = createRows(y: Int(displayView.frame.height) + 82 * 4)
        
        let zeroButton = UIButton(frame: CGRect(x: (0 + 2), y: 0, width: (Int(Constants.screenWidth) / 4) * 2 - 2, height: 80))
        zeroButton.setTitle("0", for: .normal)
        zeroButton.backgroundColor = .systemBlue
        zeroButton.tag = 0
        zeroButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        zeroButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        zeroButton.backgroundColor = AppColors.numbers
        zeroButton.layer.cornerRadius = 7
        
        let dotButton = createButton(order: 2, title: ".", tag: 10)
        dotButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let equalButton = createButton(order: 3, title: "=", tag: 11)
        equalButton.setTitleColor(.black, for: .normal)
        equalButton.backgroundColor = AppColors.actions
        equalButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
        line5.addSubview(zeroButton)
        line5.addSubview(dotButton)
        line5.addSubview(equalButton)
        
        conteinerView.addSubview(line5)
    }
    
    func setupButtons() {
        setupLine1()
        setupLine2()
        setupLine3()
        setupLine4()
        setupLine5()
    }
    
    func setupDisplay() {
        displayView.frame = CGRect(x: 0, y: 0, width: Constants.screenWidth, height: conteinerView.frame.height - (82 * 5) - 60 - 30)
        
        display.frame = CGRect(x: 15, y: 15, width: displayView.frame.width - 30, height: displayView.frame.height - 15)
        display.textAlignment               = .right
        display.contentVerticalAlignment    = .bottom
        display.text                        = "0"
        display.textColor                   = .white
        display.font = UIFont.boldSystemFont(ofSize: 80)
        
        displayView.addSubview(display)
        conteinerView.addSubview(displayView)
    }
}
