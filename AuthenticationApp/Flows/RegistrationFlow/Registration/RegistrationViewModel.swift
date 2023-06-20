//
//  RegistrationViewModel.swift
//  AuthenticationApp
//
//  Created by poskreepta on 31.05.23.
//

import Foundation

protocol RegistrationViewModelType {
    func goBack()
    func goToUserDetails()
    func checkEmail(email: String)
    var showAlertMessageClosure: ((String) -> Void)? { get set }
    var showEmailSentAlertToUser: (() -> Void)? { get set }
}

class RegisatrationViewModel: RegistrationViewModelType {
    
    var showAlertMessageClosure: ((String) -> Void)?
    var showEmailSentAlertToUser: (() -> Void)? 
    var coordinator = RegistrationCoordinator(navController: BaseNavigationController())
    var user_id: Int?

    func goBack() {
        coordinator.goBack()
    }
    
    func goToUserDetails() {
        if let user_id = user_id {
                   coordinator.goToUserDetails(with: user_id)
               } else {
                   print("no user_id")
               }
    }
    
    func checkEmail(email: String) {
        let userRequest = RegisterUserRequest(email: email)
        guard let request = Endpoints.checkEmail(userRequest: userRequest).request else { return }
        AuthService.checkEmail(request: request) { response in
            print(response)
            switch response {
            case .success(let createUser):
                DispatchQueue.main.async {
                    self.user_id = createUser.user_id
                    self.showEmailSentAlertToUser?()
                }
            case .failure(let error):
                guard let error = error as? ServiceError else { return }
                switch error {
                case .serviceError(_):
                    break
                case .unknown(_):
                    break
                case .decodingError(let errorMessage):
                    self.showAlertMassege(errorMessage)
                    print("\(errorMessage)")
            }
        }
        }
    }
    
    func showAlertMassege(_ message: String) {
        showAlertMessageClosure?(message)
    }
}
