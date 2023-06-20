//
//  Coordinator.swift
//  AuthenticationApp
//
//  Created by poskreepta on 30.05.23.
//

import UIKit

protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController: BaseNavigationController { get set }
    func start()
}

extension Coordinator {
    func popViewController(animated: Bool) {
        navigationController.popViewController(animated: animated)
    }
    
    func popToRootViewController(animated: Bool) {
        navigationController.popToRootViewController(animated: animated)
    }
    
    func dismiss(animated: Bool) {
        parentCoordinator?.removeChild(self)
        navigationController.dismiss(animated: animated)
    }
    
    func dismiss(animated: Bool, completion: (() -> ())?) {
        navigationController.dismiss(animated: animated, completion: completion)
    }
    
    func addChild(_ coordinator: Coordinator) {
        guard children.contains(where: { $0 === coordinator }) else { return }
        children.append(coordinator)
    }
    
    func removeChild(_ coordinator: Coordinator) {
        if let index = children.firstIndex(where: { $0 === coordinator}) {
            children.remove(at: index)
        }
    }
}
