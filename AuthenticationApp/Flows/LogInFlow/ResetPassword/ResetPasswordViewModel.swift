//
//  ResetPasswordViewModel.swift
//  AuthenticationApp
//
//  Created by poskreepta on 18.06.23.
//

import Foundation

protocol ResetPasswordViewModelType {
    func goBackToLogIn()
    func resetPassword(email: String)
}

class ResetPasswordViewModel: ResetPasswordViewModelType {
    
    var coordinator = LoginCoordinator(navController: BaseNavigationController())
    var user_id: Int?

    func goBackToLogIn() {
        coordinator.goBack()
    }
    
    func goToCreatePassword() {
        if let user_id = user_id {  // Проверяем, что user_id существует
            coordinator.goToCreatePassword(with: user_id)
        } else {
            print("no user_id")
        }
    }
    
    func resetPassword(email: String) {
        let userRequest = ForgotPasswordRequest(email: email)
        guard let request = Endpoints.forgotPassword(userRequest: userRequest).request else { return }
        AuthService.resetPassword(request: request) { response in
            print(response)
            switch response {
            case .success(let forgotPassword):
                DispatchQueue.main.async {
                    self.user_id = forgotPassword.user_id
                    self.goToCreatePassword()
                    print("success")
                }
            case .failure(let error):
                guard let error = error as? ServiceError else { return }
                
                switch error {
                    
                case .serviceError(_):
                    break
                case .unknown(_):
                    break
                case .decodingError(let string):
                    print("\(string)")
            }
        }
        }
    }
}
