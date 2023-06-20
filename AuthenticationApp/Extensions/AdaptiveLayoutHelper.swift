//
//  AdaptiveLayoutHelper.swift
//  Neobis_iOS_UIScreens
//
//  Created by poskreepta on 12.05.23.
//

import UIKit

extension NSObject {
    //    based on the iPhone11 pro size
    func vAdapted(to dimension: CGFloat) -> CGFloat {
        return UIScreen.main.bounds.height * dimension / 812
    }
    
    func hAdapted(to dimension: CGFloat) -> CGFloat {
        return UIScreen.main.bounds.width * dimension / 375
    }
    
    func resized(width: CGFloat, height: CGFloat) -> CGSize {
        let ratioWH = width / height
        let heightAdapted = UIScreen.main.bounds.height * (height / 896) * ratioWH

        let ratioHW = height / width
        let widthAdapted = UIScreen.main.bounds.width * (width / 414) * ratioHW

        let cgcSize = CGSize(width: heightAdapted, height: widthAdapted)
        return cgcSize
    }
    
    
}


