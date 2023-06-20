//
//  UserDetailViewController.swift
//  AuthenticationApp
//
//  Created by poskreepta on 05.06.23.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    private var viewModel: UserDetailViewModelType
    private var userDetailView = UserDetailView()
    private var userDetailAlert = CustomAlertView()
    
    init(viewModel: UserDetailViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        userDetailView.registrationButton.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)
    }
    
    func setupViews() {
        view.addSubview(userDetailView)
        userDetailView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        userDetailAlert.closeAlertButton.addTarget(self, action: #selector(closeAlertButtonTapped), for: .touchUpInside)
        userDetailView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    @objc func registrationButtonTapped() {
        let firstName = userDetailView.nameTextField.text ?? ""
        let lastName = userDetailView.surnameTextField.text ?? ""
        let birthDate = userDetailView.birthDateTextField.text ?? ""
        let email = userDetailView.emailTextField.text ?? ""
        viewModel.createProfile(firstName: firstName, lastName: lastName, birthDate: birthDate, email: email)
        viewModel.showAlertMessageClosure = { [weak self] message in
            DispatchQueue.main.async {
                self?.userDetailAlert.alertLabel.text = message
                self?.view.configureBlurView()
                self?.view.addSubview(self?.userDetailAlert ?? UIView())
                self?.userDetailAlert.snp.makeConstraints { make in
                    make.center.equalToSuperview()
                    make.size.equalTo(self?.resized(width: 343, height: 343) ?? .zero)
                }
            }
        }
    }
    
    @objc func closeAlertButtonTapped() {
        userDetailAlert.removeFromSuperview()
        view.removeBlurView()
    }
    
    @objc func backButtonTapped() {
        viewModel.goBack()
    }
    
    

}
