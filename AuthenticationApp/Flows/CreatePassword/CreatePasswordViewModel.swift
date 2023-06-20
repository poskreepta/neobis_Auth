//
//  CreatePasswordViewModel.swift
//  AuthenticationApp
//
//  Created by poskreepta on 06.06.23.
//

import Foundation

protocol CreatePasswordViewModelType {
    func goBack()
    func createPassword(password: String, passwordRepeat: String) 
}

class CreatePasswordViewModel: CreatePasswordViewModelType {
    var showAlertMessageClosure: ((String) -> Void)?
    private var user_id: Int?
    private var coordinator: Coordinator?
    init(coordinator: Coordinator?, user_id: Int? = nil) {
        self.coordinator = coordinator
        self.user_id = user_id
    }
    
    func goBack() {
        if let coordinator = coordinator {
            coordinator.popViewController(animated: true)
        }
    }
    
    func createPassword(password: String, passwordRepeat: String) {
        if let user_id = user_id {
            let userDetails = SavePasswordRequest(password1: password, password2: passwordRepeat, user_id: "\(user_id)")
            guard let request = Endpoints.setPassword(user_id: "\(user_id)", userRequest: userDetails).request else { return }
            AuthService.setPasswords(request: request) { response in
                print(request)
                print(response)
                switch response {
                case .success(_):
                    DispatchQueue.main.async {
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
                        //                    self.showAlertMassege(errorMessage)
                        
                    }
                    
                }
            }
        } else {
            print("no user_id")
        }
    }
    
    func showAlertMassege(_ message: String) {
        showAlertMessageClosure?(message)
    }
    
}
