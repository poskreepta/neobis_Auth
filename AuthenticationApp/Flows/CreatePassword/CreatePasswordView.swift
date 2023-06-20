//
//  CreatePasswordView.swift
//  AuthenticationApp
//
//  Created by poskreepta on 06.06.23.
//

import UIKit
import SnapKit

class CreatePasswordView: UIView {
    
    let navigationLabel: UILabel = {
        let label = UILabel()
        label.text = "Создание пароля"
        label.font = UIFont(name: Fonts.gothamproMedium, size: 18)
        label.textColor = .black
        return label
    }()
    
    let passwordTextField: CustomUITextField = {
        let textField = CustomUITextField()
        textField.placeholder = "Придумайте пароль"
        textField.configurePasswordTextField()
        textField.addEyeButtontoTextField()
        return textField
    }()
    
    let againPasswordTextField: CustomUITextField = {
        let textField = CustomUITextField()
        textField.placeholder = "Повторите пароль"
        textField.configurePasswordTextField()
        textField.addEyeButtontoTextField()
        return textField
    }()
    
    let capitalLetterLabel: CustomBulletLabelView = {
        let imageView = CustomBulletLabelView()
        imageView.text = "Заглавная буква"
        return imageView
    }()
    
    let numberLabel: CustomBulletLabelView = {
        let imageView = CustomBulletLabelView()
        imageView.text = "Цифры"
        return imageView
    }()
    
    let specialLabel: CustomBulletLabelView = {
        let imageView = CustomBulletLabelView()
        imageView.text = "Специальные символы"
        return imageView
    }()
    
    let matchLabel: CustomBulletLabelView = {
        let imageView = CustomBulletLabelView()
        imageView.text = "Совпадение пароля"
        return imageView
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Далее", for: .normal)
        button.configureWhiteStyleButton()
        return button
    }()
    
    var backButton: UIButton = {
        let button = UIButton()
        button.configureBackButton()
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = .white
        addSubview(navigationLabel, passwordTextField, againPasswordTextField, capitalLetterLabel, numberLabel, specialLabel, matchLabel, nextButton, backButton)
    }
    
    func setupConstraints() {
        backButton.snp.makeConstraints { make in
            make.bottom.equalTo(navigationLabel.snp.bottom)
            make.leading.equalToSuperview().offset(hAdapted(to: 20))
            make.size.equalTo(resized(width: 44, height: 28))
        }
        navigationLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(vAdapted(to: 55))
            make.centerX.equalToSuperview()
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(navigationLabel.snp.bottom).offset(vAdapted(to: 50))
            make.trailing.leading.equalToSuperview().inset(hAdapted(to: 20))
            make.height.equalTo(vAdapted(to: 60))
        }
        againPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(vAdapted(to: 25))
            make.trailing.leading.equalToSuperview().inset(hAdapted(to: 20))
            make.height.equalTo(vAdapted(to: 60))
        }
        capitalLetterLabel.snp.makeConstraints { make in
            make.top.equalTo(againPasswordTextField.snp.bottom).offset(vAdapted(to: 36))
            make.leading.equalToSuperview().offset(hAdapted(to: 20))
        }
        
        numberLabel.snp.makeConstraints { make in
            make.top.equalTo(capitalLetterLabel.snp.bottom).offset(vAdapted(to: 27))
            make.leading.equalTo(capitalLetterLabel.snp.leading)
        }
  
        specialLabel.snp.makeConstraints { make in
            make.top.equalTo(numberLabel.snp.bottom).offset(vAdapted(to: 27))
            make.leading.equalTo(capitalLetterLabel.snp.leading)
        }
        
        matchLabel.snp.makeConstraints { make in
            make.top.equalTo(specialLabel.snp.bottom).offset(vAdapted(to: 27))
            make.leading.equalTo(capitalLetterLabel.snp.leading)
        }
   
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(matchLabel.snp.bottom).offset(vAdapted(to: 40))
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(hAdapted(to: 20))
            make.height.equalTo(hAdapted(to: 65))
        }
    }
}
