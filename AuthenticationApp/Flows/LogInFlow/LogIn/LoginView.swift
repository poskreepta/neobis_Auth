//
//  LoginView.swift
//  AuthenticationApp
//
//  Created by poskreepta on 06.06.23.
//

import UIKit

class LoginView: UIView {

    var mainLogoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "smileLogoSmall")
        return imageView
    }()
    
    let emailTextField: CustomUITextField = {
        let textField = CustomUITextField()
        textField.configureWhiteTextField()
        textField.placeholder = "Электронная почта"
        return textField
    }()
    
    let passwordTextField: CustomUITextField = {
        let textField = CustomUITextField()
        textField.configurePasswordTextField()
        textField.configureWhiteTextField()
        textField.addEyeButtontoTextField()
        textField.placeholder = "Пароль"
        return textField
    }()
    
    var invalidCredentialsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = UIFont(name: Fonts.gothamproMedium, size: 14)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Неверный логин или пароль"
        return label
    }()
    
    let loginEnterButton: UIButton = {
        let button = UIButton()
        button.configureWhiteStyleButton()
        button.setTitle("Войти", for: .normal)
        return button
    }()
    
    var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Забыли пароль?", for: .normal)
        button.titleLabel?.font = UIFont(name: Fonts.gothamproBold, size: 16)
        button.setTitleColor(.black, for: .normal)
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
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(mainLogoImage, emailTextField, passwordTextField, invalidCredentialsLabel, loginEnterButton, forgotPasswordButton, backButton)
    }
    
    func setupConstraints() {
        
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(vAdapted(to: 60))
            make.leading.equalToSuperview().offset(hAdapted(to: 20))
            make.size.equalTo(resized(width: 44, height: 28))
        }
        
        mainLogoImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(vAdapted(to: 76))
//            make.width.equalTo(flexibleWidth(to: 120))
//            make.height.equalTo(flexibleHeight(to: 120))
            make.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(mainLogoImage.snp.bottom).offset(vAdapted(to: 40))
            make.height.equalTo(vAdapted(to: 60))
            make.leading.trailing.equalTo(loginEnterButton)
            make.centerX.equalToSuperview()
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(vAdapted(to: 24))
            make.height.equalTo(vAdapted(to: 60))
            make.leading.trailing.equalTo(loginEnterButton)
            make.centerX.equalToSuperview()
        }
        
        invalidCredentialsLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(vAdapted(to: 16))
            make.centerX.equalToSuperview()
        }
        
        loginEnterButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(vAdapted(to: 60))
            make.leading.equalToSuperview().offset(hAdapted(to: 20))
            make.trailing.equalToSuperview().offset(hAdapted(to: -20))
            make.height.equalTo(vAdapted(to: 65))
        }
        forgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(loginEnterButton.snp.bottom).offset(vAdapted(to: 223))
            make.centerX.equalToSuperview()
        }
    }

}
