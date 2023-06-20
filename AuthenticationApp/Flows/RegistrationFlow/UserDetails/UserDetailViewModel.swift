//
//  UserDetailViewModel.swift
//  AuthenticationApp
//
//  Created by poskreepta on 05.06.23.
//

import Foundation

protocol UserDetailViewModelType {
    func goToCreatePassword()
    func createProfile(firstName: String, lastName: String, birthDate: String, email: String)
    var showAlertMessageClosure: ((String) -> Void)? { get set }
    func goBack()
    
}

class UserDetailViewModel: UserDetailViewModelType {
    
    var showSuccessAlert: Bool = false
    var showAlertMessageClosure: ((String) -> Void)?
    private var user_id: Int?
    init(user_id: Int? = nil) {
        self.user_id = user_id
    }
    
    var coordinator = RegistrationCoordinator(navController: BaseNavigationController())
    
    func goToCreatePassword() {
        if let user_id = user_id {  // Проверяем, что user_id существует
            coordinator.goToCreatePassword(with: user_id)
        } else {
            print("no user_id")
        }
    }
    
    func goBack() {
        coordinator.goBack()
    }
    
    func createProfile(firstName: String, lastName: String, birthDate: String, email: String) {
        if let user_id = user_id {
            let userDetails = AddUserDetailsRequest(first_name: firstName, last_name: lastName, birth_date: birthDate, email: email, user_id: "\(user_id)")
            guard let request = Endpoints.createProfile(user_id: "\(user_id)", userRequest: userDetails).request else { return }
            AuthService.createProfile(request: request) { [weak self] response in
                print(request)
                print(response)
                switch response {
                case .success(_):
                    DispatchQueue.main.async {
                        self?.goToCreatePassword()
                    }
                case .failure(let error):
                    guard let error = error as? ServiceError else { return }
                    switch error {
                    case .serviceError(_):
                        break
                    case .unknown(_):
                        break
                    case .decodingError(let errorMessage):
                        self?.showAlertMassege(errorMessage)
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
