//
//  Constants.swift
//  calculator
//
//  Created by poliorang on 15.03.2023.
//

import UIKit

struct Constants {
    static let screenRect = UIScreen.main.bounds
    static let screenWidth = screenRect.size.width
    static let screenHeight = screenRect.size.height
}

enum AppColors {
    static let background   = #colorLiteral(red: 0.5487359166, green: 0.5614295006, blue: 0.5281506181, alpha: 1)
    static let numbers      = #colorLiteral(red: 0.903622508, green: 0.8172492981, blue: 0.9244607091, alpha: 1)
    static let topNumbers   = #colorLiteral(red: 0.710678041, green: 0.6563789248, blue: 0.7721142173, alpha: 1)
    static let actions      = #colorLiteral(red: 0.710678041, green: 0.6563789248, blue: 0.7721142173, alpha: 1)
}
