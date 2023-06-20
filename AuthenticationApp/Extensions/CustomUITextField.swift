//
//  CustomUITextField.swift
//  AuthenticationApp
//
//  Created by poskreepta on 06.06.23.
//

import UIKit

class CustomUITextField: UITextField {
    
    func configureWhiteTextField() {
        font = UIFont(name: Fonts.gothamproMedium, size: 16)
        textColor = .black
        backgroundColor = UIColor(hexString: "#F5F5F5")
        layer.cornerRadius = 8
    }
    
    func configurePasswordTextField() {
        font = UIFont(name: Fonts.gothamproMedium, size: 16)
        textColor = .black
        backgroundColor = UIColor(hexString: "#F5F5F5")
        layer.cornerRadius = 8
    }
    
    //MARK: Add EyeButton To TextField
    private lazy var showHidePasswordButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(named: "hide")
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
        configuration.baseBackgroundColor = .clear
        let button = UIButton(configuration: configuration)
        button.addTarget(self, action: #selector(handleShowPassword), for: .touchUpInside)
        return button
    }()
    
    func addEyeButtontoTextField() {
        rightView = showHidePasswordButton
        rightViewMode = .always
        isSecureTextEntry = true
      
    }
    
    @objc func handleShowPassword(sender: UIButton) {
        isSecureTextEntry.toggle()
        let imageName = isSecureTextEntry ? "hide" : "showBlack"
        sender.setImage(UIImage(named: imageName), for: .normal)
    }
    
//MARK: - BirthDateFormat
    let dateFormatter: DateFormatter = {
          let formatter = DateFormatter()
          formatter.dateFormat = "dd.MM.yyyy"
          return formatter
      }()
    
    func birthDateFormat() {
        addTarget(self, action: #selector(dateTextFieldDidChange(_:)), for: .editingChanged)
        delegate = self
        print("dsd")
    }
    
    @objc private func dateTextFieldDidChange(_ textField: UITextField) {
            if let text = textField.text, !text.isEmpty {
                var formattedText = ""
                
                let digits = CharacterSet.decimalDigits
                let filteredText = text.unicodeScalars.filter { digits.contains($0) }
                let digitText = String(filteredText)
                
                if digitText.count >= 2 {
                    let dayIndex = digitText.index(digitText.startIndex, offsetBy: 2)
                    let day = digitText[digitText.startIndex..<dayIndex]
                    formattedText += day + "."
                }
                if digitText.count >= 4 {
                    let monthIndex = digitText.index(digitText.startIndex, offsetBy: 4)
                    let month = digitText[digitText.index(digitText.startIndex, offsetBy: 2)..<monthIndex]
                    formattedText += month + "."
                }
                if digitText.count >= 8 {
                    let yearIndex = digitText.index(digitText.startIndex, offsetBy: 8)
                    let year = digitText[digitText.index(digitText.startIndex, offsetBy: 4)..<yearIndex]
                    formattedText += year
                }
                
                textField.text = formattedText
            }
        }
}

extension CustomUITextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
            if let date = dateFormatter.date(from: textField.text ?? "") {
                textField.text = dateFormatter.string(from: date)
            }
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            if let text = textField.text, !text.isEmpty {
                if let date = dateFormatter.date(from: text) {
                    textField.text = dateFormatter.string(from: date)
                }
            }
        }
}
