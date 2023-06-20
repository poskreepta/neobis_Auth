//
//  LoginViewModel.swift
//  AuthenticationApp
//
//  Created by poskreepta on 06.06.23.
//

import Foundation

protocol LoginViewModelType {
    func goToResetPassword()
    func logIn(email: String, password: String)
    var showErrorToUser: (() -> Void)? { get set }
    func goBack()
}

class LoginViewModel: LoginViewModelType {
    var coordinator = LoginCoordinator(navController: BaseNavigationController())
    private var tokenAccess: String?
    private var tokenRefresh: String?
    var showErrorToUser: (() -> Void)?

    
    func goBack() {
        coordinator.goBack()
    }
    
    func goToResetPassword() {
        coordinator.goToResetPassword()
    }
    
    func logIn(email: String, password: String) {
            let userRequest = LogInRequest(email: email, password: password)
            guard let request = Endpoints.logIn(userRequest: userRequest).request else { return }
        AuthService.logIn(request: request) { response in
                print(response)
                switch response {
                case .success(let loggedInUser):
                    DispatchQueue.main.async {
                        self.tokenAccess = loggedInUser.token.access
                        self.tokenRefresh = loggedInUser.token.refresh
                        print("success")
                    }
                case .failure(let error):
                    guard let error = error as? ServiceError else { return }
                    switch error {
                    case .serviceError(_):
                        self.showErrorToUser?()
                    case .unknown(_):
                        break
                    case .decodingError(let string):
                        print("\(string)")
                }
            }
            }
            
        }
    
}
    
