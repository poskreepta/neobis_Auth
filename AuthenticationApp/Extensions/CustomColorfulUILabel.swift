//
//  CustomColorfulUILabel.swift
//  AuthenticationApp
//
//  Created by poskreepta on 05.06.23.
//

import UIKit

class CustomColorfulUILabel: UILabel {
    var email: String? {
           didSet {
               updateText()
           }
       }
       
       override init(frame: CGRect) {
           super.init(frame: frame)
           commonInit()
       }
       
       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           commonInit()
       }
       
       private func commonInit() {
           textColor = .black
       }
       
       private func updateText() {
           guard let email = email else {
               text = nil
               return
           }
           
           let attributedText = NSMutableAttributedString(string: "На вашу почту ")
           let emailText = NSAttributedString(string: email, attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "#5D5FEF")])
           let restOfText = NSAttributedString(string: " было отправлено письмо")
           
           attributedText.append(emailText)
           attributedText.append(restOfText)
           
           self.attributedText = attributedText
       }
}
