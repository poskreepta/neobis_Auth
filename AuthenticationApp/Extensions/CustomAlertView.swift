//
//  CustomAlertView.swift
//  AuthenticationApp
//
//  Created by poskreepta on 05.06.23.
//

import UIKit

class CustomAlertView: UIView {
    
    var mainLogoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "smileLogoSmall")
        return imageView
    }()
    
    var alertLabel: CustomColorfulUILabel = {
        let label = CustomColorfulUILabel()
        label.textColor = .black
        label.font = UIFont(name: Fonts.gothamproMedium, size: 18)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
    }()
    
    let closeAlertButton: UIButton = {
        let button = UIButton()
        button.configurePurpleStyleButton()
        button.setTitle("Закрыть", for: .normal)
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
        layer.cornerRadius = 32
        addSubview(mainLogoImage, alertLabel, closeAlertButton)
    }
    
    func setupConstraints() {
        mainLogoImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(vAdapted(to: 24))
            make.centerX.equalToSuperview()
            make.width.equalTo(hAdapted(to: 120))
            make.height.equalTo(vAdapted(to: 120))
        }
        
        alertLabel.snp.makeConstraints { make in
            make.top.equalTo(mainLogoImage.snp.bottom).offset(vAdapted(to: 24))
            make.centerX.equalToSuperview()
            make.size.equalTo(resized(width: 311, height: 40))
        }
        
        closeAlertButton.snp.makeConstraints { make in
            make.top.equalTo(alertLabel.snp.bottom).offset(vAdapted(to: 41))
            make.centerX.equalToSuperview()
            make.size.equalTo(resized(width: 280, height: 44))
        }
    }
}
