//
//  UIView + Extension.swift
//  WeatherApp
//
//  Created by poskreepta on 26.05.23.
//

import UIKit

extension UIView {
    func addSubview(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
    
    func configureBlurView() {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 0.5
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurEffectView)
    }
    
    func removeBlurView() {
            for subview in subviews {
                if let blurEffectView = subview as? UIVisualEffectView {
                    blurEffectView.removeFromSuperview()
                    break
                }
            }
        }
}
