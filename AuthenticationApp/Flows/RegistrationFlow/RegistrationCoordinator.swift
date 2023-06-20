//
//  RegistrationCoordinator.swift
//  AuthenticationApp
//
//  Created by poskreepta on 31.05.23.
//

import UIKit

protocol RegistrationCoordinatorDelegate {
    func goToUserDetails(user_id: Int)

}

class RegistrationCoordinator: Coordinator {
   
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: BaseNavigationController
    
    init(navController: BaseNavigationController) {
        self.navigationController = navController
    }
    
    func start() {
        let viewModel = RegisatrationViewModel()
        viewModel.coordinator = self
        let vc = RegistrationViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goBack() {
        navigationController.popViewController(animated: true)
    }
    
    func goToUserDetails(with user_id: Int) {
        let userDetailViewModel = UserDetailViewModel(user_id: user_id)
        userDetailViewModel.coordinator = self
        let userDetailVC = UserDetailViewController(viewModel: userDetailViewModel)
        navigationController.pushViewController(userDetailVC, animated: true)
    }
    
    func goToCreatePassword(with user_id: Int) {
        let viewModel = CreatePasswordViewModel(coordinator: self, user_id: user_id)
        let createPasswordVC = CreatePasswordViewController(viewModel: viewModel)
        navigationController.pushViewController(createPasswordVC, animated: true)
    }


}
