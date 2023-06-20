//
//  RegistrationView.swift
//  AuthenticationApp
//
//  Created by poskreepta on 31.05.23.
//

import UIKit
import SnapKit

class RegistrationView: UIView {
    
    let navigationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.gothamproMedium, size: 18)
        label.textColor = .black
        return label
    }()

    var mainLogoLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "#5D5FEF")
        label.font = UIFont(name: Fonts.gothamproMedium, size: 40)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Смейся \nи улыбайся \nкаждый день"
        return label
    }()
    
    var mainLogoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "smileLogoSmall")
        return imageView
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Электронная почта"
        textField.font = UIFont(name: Fonts.gothamproMedium, size: 16)
        textField.textColor = .black
        textField.backgroundColor = UIColor(hexString: "#EDEDED")
        textField.layer.cornerRadius = 8
        return textField
    }()
    
    var emailAlreadyExistLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = UIFont(name: Fonts.gothamproMedium, size: 14)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Данная почта уже зарегистрирована"
        label.isHidden = true
        return label
    }()
    
    var nextButton: UIButton = {
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupViews()
        setupConstraints()

    }
    
    private func setupViews() {
        addSubview(backButton, navigationLabel, mainLogoLabel, mainLogoImage, emailTextField, emailAlreadyExistLabel, nextButton)
        backgroundColor = .white
    }
    
    private func setupConstraints() {
        
        backButton.snp.makeConstraints { make in
            make.bottom.equalTo(navigationLabel.snp.bottom)
            make.leading.equalToSuperview().offset(hAdapted(to: 20))
            make.size.equalTo(resized(width: 44, height: 28))
        }
        navigationLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(vAdapted(to: 55))
            make.centerX.equalToSuperview()
        }

        mainLogoLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(hAdapted(to: 20))
            make.trailing.equalToSuperview().offset(hAdapted(to: -20))
            make.top.equalToSuperview().offset(vAdapted(to: 116))
        }
        
        mainLogoImage.snp.makeConstraints { make in
            make.trailing.equalTo(mainLogoLabel.snp.trailing)
            make.top.equalTo(mainLogoLabel.snp.top).offset(-25)
            make.size.equalTo(resized(width: 80, height: 80))

        }
        mainLogoLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)

        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(mainLogoLabel.snp.bottom).offset(vAdapted(to: 60))
            make.centerX.equalToSuperview()
            make.size.equalTo(resized(width: 335, height: 60))
        }
        
        emailAlreadyExistLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(vAdapted(to: 16))
            make.centerX.equalToSuperview()
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(vAdapted(to: 60))
            make.size.equalTo(resized(width: 335, height: 65))
            make.centerX.equalToSuperview()
        }
    }
}
