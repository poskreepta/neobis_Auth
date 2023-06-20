//
//  LoginViewController.swift
//  AuthenticationApp
//
//  Created by poskreepta on 06.06.23.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var viewModel: LoginViewModelType
    private var loginView = LoginView()
    
    init(viewModel: LoginViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        loginView.loginEnterButton.addTarget(self, action: #selector(loginEnterButtonTapped), for: .touchUpInside)
        loginView.forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
        loginView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        loginView.passwordTextField.addTarget(self, action: #selector(passwordTextFieldDidChange), for: .editingChanged)
    }
    
    func setupViews() {
        view.addSubview(loginView)
        loginView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        loginView.invalidCredentialsLabel.isHidden = true
    }
    
    @objc func loginEnterButtonTapped() {
        viewModel.logIn(email: loginView.emailTextField.text ?? "", password: loginView.passwordTextField.text ?? "")
        viewModel.showErrorToUser = { [weak self] in
            DispatchQueue.main.async {
                self?.loginView.passwordTextField.textColor = .red
                self?.loginView.emailTextField.textColor = .red
                self?.loginView.invalidCredentialsLabel.isHidden = false
            }
        }
    }
    
    @objc func forgotPasswordButtonTapped() {
        viewModel.goToResetPassword()
    }
    
    @objc func backButtonTapped() {
        viewModel.goBack()
    }
    
    @objc func passwordTextFieldDidChange() {
        loginView.passwordTextField.textColor = .black
        loginView.emailTextField.textColor = .black
        loginView.invalidCredentialsLabel.isHidden = true
    }
    

}
