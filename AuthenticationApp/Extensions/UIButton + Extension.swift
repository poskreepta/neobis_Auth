//
//  UIButton + Extension.swift
//  AuthenticationApp
//
//  Created by poskreepta on 31.05.23.
//

import UIKit

extension UIButton {
    func configureWhiteStyleButton() {
        backgroundColor = UIColor(hexString: "#F7F7F8")
        setTitleColor(UIColor(hexString: "#9CA4AB"), for: .normal)
        titleLabel?.font = UIFont(name: Fonts.gothamproBold, size: 16)
        layer.cornerRadius = 16
    }
    
    func configurePurpleStyleButton() {
        backgroundColor = UIColor(hexString: "#5D5FEF")
        setTitleColor(UIColor(hexString: "#FFFFFF"), for: .normal)
        titleLabel?.font = UIFont(name: Fonts.gothamproBold, size: 16)
        layer.cornerRadius = 16
    }
    
    func configureBackButton() {
        setImage(UIImage(named: "back"), for: .normal)
//        self.tintColor = .black
//        self.backgroundColor = UIColor(hexString: "#C0C0C033")
//        self.layer.cornerRadius = 12
    }
    
}
