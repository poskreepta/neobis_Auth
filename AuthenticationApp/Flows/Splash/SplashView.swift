//
//  SplashView.swift
//  AuthenticationApp
//
//  Created by poskreepta on 31.05.23.
//

import UIKit
import SnapKit

class SplashView: UIView {

    var mainLogoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "smileLogo")
        return imageView
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
    
    var registrationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Начать пользоваться", for: .normal)
        button.configurePurpleStyleButton()
        return button
    }()
    
    var logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Есть аккаунт? Войти", for: .normal)
        button.titleLabel?.font = UIFont(name: Fonts.gothamproBold, size: 16)
        button.setTitleColor(.black, for: .normal)
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
        addSubview(mainLogoImage, mainLogoLabel, registrationButton, logInButton)
        backgroundColor = .white
    }
    
    private func setupConstraints() {
        mainLogoImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(vAdapted(to: 154))
            make.centerX.equalToSuperview()
            make.size.equalTo(resized(width: 200, height: 200))
        }
        
        mainLogoLabel.snp.makeConstraints { make in
            make.top.equalTo(mainLogoImage.snp.bottom).offset(vAdapted(to: 60))
            make.leading.equalToSuperview().offset(hAdapted(to: 20))
            make.trailing.equalToSuperview().offset(hAdapted(to: -20))
//            make.height.equalTo(vAdapted(to: 144))
        }
        
        registrationButton.snp.makeConstraints { make in
            make.top.equalTo(mainLogoLabel.snp.bottom).offset(vAdapted(to: 64))
            make.size.equalTo(resized(width: 335, height: 65))
            make.centerX.equalToSuperview()
        }
        
        logInButton.snp.makeConstraints { make in
            make.top.equalTo(registrationButton.snp.bottom).offset(vAdapted(to: 16))
            make.size.equalTo(resized(width: 335, height: 65))
            make.centerX.equalToSuperview()

        }
    }

}
