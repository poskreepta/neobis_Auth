//
//  LoginCoordinator.swift
//  AuthenticationApp
//
//  Created by poskreepta on 06.06.23.
//

import Foundation

class LoginCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: BaseNavigationController
    
    init(navController: BaseNavigationController) {
        self.navigationController = navController
    }
    
    func start() {
        let viewModel = LoginViewModel()
        viewModel.coordinator = self
        let vc = LoginViewController(viewModel: viewModel)
//        navigationController.setViewControllers([vc], animated: true)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goBack() {
        navigationController.popViewController(animated: true)
    }
    
    func goToResetPassword() {
        let viewModel = ResetPasswordViewModel()
        let vc = ResetPasswordViewController(viewModel: viewModel)
        viewModel.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goToCreatePassword(with user_id: Int) {
        let viewModel = CreatePasswordViewModel(coordinator: self, user_id: user_id)
        let createPasswordVC = CreatePasswordViewController(viewModel: viewModel)
        navigationController.pushViewController(createPasswordVC, animated: true)
    }

}
