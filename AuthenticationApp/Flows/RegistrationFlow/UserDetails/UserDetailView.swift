//
//  UserDetailView.swift
//  AuthenticationApp
//
//  Created by poskreepta on 05.06.23.
//

import UIKit

class UserDetailView: UIView {

    let nameTextField: CustomUITextField = {
        let textField = CustomUITextField()
        textField.configureWhiteTextField()
        textField.placeholder = "Имя"
        return textField
    }()
    
    let surnameTextField: CustomUITextField = {
        let textField = CustomUITextField()
        textField.configureWhiteTextField()
        textField.placeholder = "Фамилия"
        return textField
    }()
    
    lazy var birthDateTextField: CustomUITextField = {
        let textField = CustomUITextField()
        textField.configureWhiteTextField()
        textField.placeholder = "День рождения"
        textField.keyboardType = .numberPad
        return textField
    }()
    
    let emailTextField: CustomUITextField = {
        let textField = CustomUITextField()
        textField.configureWhiteTextField()
        textField.placeholder = "Электронная почта"
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    let registrationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Зарегистрироваться", for: .normal)
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupViews()
        setupConstraints()

    }
    
    func setupViews() {
        addSubview(nameTextField, surnameTextField, birthDateTextField, emailTextField, registrationButton, backButton)
        backgroundColor = .white
    }
    
    func setupConstraints() {
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(vAdapted(to: 60))
            make.leading.equalToSuperview().offset(hAdapted(to: 20))
            make.size.equalTo(resized(width: 44, height: 28))
        }
        nameTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(vAdapted(to: 84))
            make.leading.trailing.equalToSuperview().inset(hAdapted(to: 20))
            make.height.equalTo(vAdapted(to: 60))
        }
        surnameTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(vAdapted(to: 24))
            make.leading.trailing.equalToSuperview().inset(hAdapted(to: 20))
            make.height.equalTo(vAdapted(to: 60))
        }
        birthDateTextField.snp.makeConstraints { make in
            make.top.equalTo(surnameTextField.snp.bottom).offset(vAdapted(to: 24))
            make.leading.trailing.equalToSuperview().inset(hAdapted(to: 20))
            make.height.equalTo(vAdapted(to: 60))
        }
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(birthDateTextField.snp.bottom).offset(vAdapted(to: 24))
            make.leading.trailing.equalToSuperview().inset(hAdapted(to: 20))
            make.height.equalTo(vAdapted(to: 60))
        }
        registrationButton.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(vAdapted(to: 37))
            make.leading.trailing.equalToSuperview().inset(hAdapted(to: 20))
            make.height.equalTo(vAdapted(to: 65))
        }
    }
    
}
