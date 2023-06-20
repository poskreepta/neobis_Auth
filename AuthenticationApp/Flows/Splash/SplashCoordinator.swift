//
//  SplashCoordinator.swift
//  AuthenticationApp
//
//  Created by poskreepta on 31.05.23.
//

import Foundation

class SplashCoordinator: Coordinator {
   
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: BaseNavigationController
    
    init(navigationController: BaseNavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = SplashViewModel()
        viewModel.coordinator = self
        let vc = SplashViewController(viewModel: viewModel)
        navigationController.setViewControllers([vc], animated: true)
    }
    
    func presentRegistration() {
        let registatinCoordinator = RegistrationCoordinator(navController: navigationController)
        addChild(registatinCoordinator)
        registatinCoordinator.start()
    }
    
    func goToLogin() {
        let loginCoordinator = LoginCoordinator(navController: navigationController)
        addChild(loginCoordinator)
        loginCoordinator.start()
    }
    
    func goBack() {
        navigationController.dismiss(animated: true)
    }
}
