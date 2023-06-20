//
//  AppCoordinator.swift
//  AuthenticationApp
//
//  Created by poskreepta on 31.05.23.
//

import UIKit

class AppCoordinator: Coordinator {

    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: BaseNavigationController
    
    init(navigationController: BaseNavigationController) {
        self.navigationController = navigationController
    }
    
    private func addCoordinator(_ coordinator: Coordinator) {
        coordinator.start()
        navigationController.addChild(coordinator.navigationController)
        coordinator.parentCoordinator = self
        children.append(coordinator)
    }

    func start() {
//        mf
    }

    func showSplashFlow() {
        let splashCoordinator = SplashCoordinator(navigationController: navigationController)
        addCoordinator(splashCoordinator)
        print("splash added")
        splashCoordinator.presentRegistration()
    }
}


