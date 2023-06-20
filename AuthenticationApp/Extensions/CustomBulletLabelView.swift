//
//  CustomBulletLabel.swift
//  AuthenticationApp
//
//  Created by poskreepta on 06.06.23.
//

import UIKit

class CustomBulletLabelView: UIView {

    let bulletView: UIView = {
          let view = UIView()
          view.backgroundColor = UIColor(hexString: "#C1C1C1")
          view.layer.cornerRadius = 4
          view.translatesAutoresizingMaskIntoConstraints = false
          return view
      }()
    
    let textLabel: UILabel = {
         let label = UILabel()
        label.font = UIFont(name: Fonts.gothamproMedium, size: 16)
         label.textColor = UIColor(hexString: "#C1C1C1")
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
    
    var text: String? {
           get { return textLabel.text }
           set { textLabel.text = newValue }
       }
    
    init() {
            super.init(frame: .zero)
            setupViews()
            setupConstraints()
        }
    
    required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    private func setupViews() {
            addSubview(bulletView)
            addSubview(textLabel)
        }
        
        private func setupConstraints() {
            bulletView.snp.makeConstraints { make in
                make.leading.equalToSuperview()
                make.centerY.equalToSuperview()
                make.size.equalTo(CGSize(width: 8, height: 8))
            }
            
            textLabel.snp.makeConstraints { make in
                make.leading.equalTo(bulletView.snp.trailing).offset(8)
                make.trailing.equalToSuperview()
                make.centerY.equalToSuperview()
            }
        }
       
        

}
