//
//  SceneDelegate.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 03.12.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let navigationController = BaseNavigationController()
//        let appCoordinator = AppCoordinator(navigationController: navigationController)
//        appCoordinator.start()
        let splashCoordinator = SplashCoordinator(navigationController: navigationController)
        splashCoordinator.start()
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
    }
}

