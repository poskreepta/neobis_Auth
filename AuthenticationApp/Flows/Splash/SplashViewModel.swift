//
//  SplashViewModel.swift
//  AuthenticationApp
//
//  Created by poskreepta on 31.05.23.
//

import Foundation

protocol SplashViewModelType {
    func tapRegistrationButton()
    func tapLogInButton()
    
}

class SplashViewModel: SplashViewModelType {
 
    
    var coordinator = SplashCoordinator(navigationController: BaseNavigationController())
    
//    init(coordinator: SplashCoordinator) {
//        self.coordinator = coordinator
//    }
    
    func tapRegistrationButton() {
        coordinator.presentRegistration()
    }
    
    func tapLogInButton() {
        coordinator.goToLogin()
        
    }

}
