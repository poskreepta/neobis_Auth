//
//  UITextField + Extension.swift
//  AuthenticationApp
//
//  Created by poskreepta on 05.06.23.
//

import UIKit

extension UITextField {
    func oconfigureWhiteTextField() {
        font = UIFont(name: Fonts.gothamproMedium, size: 16)
        textColor = .black
        backgroundColor = UIColor(hexString: "#F5F5F5")
        layer.cornerRadius = 8
    }
    
    func oconfigurePasswordTextField() {
        font = UIFont(name: Fonts.gothamproMedium, size: 16)
        textColor = .black
        backgroundColor = UIColor(hexString: "#F5F5F5")
        layer.cornerRadius = 8
    }
}
