//
//  ResetPasswordViewController.swift
//  AuthenticationApp
//
//  Created by poskreepta on 18.06.23.
//

import UIKit

class ResetPasswordViewController: UIViewController {
    
    private var viewModel: ResetPasswordViewModelType
    private var resetPasswordView = RegistrationView()
    private var resetPasswordAlert = CustomAlertView()

    
    init(viewModel: ResetPasswordViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        resetPasswordView.navigationLabel.text = "Сброс пароля"
        resetPasswordView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        resetPasswordView.nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        view.addSubview(resetPasswordView)
        resetPasswordView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc func backButtonTapped() {
        viewModel.goBackToLogIn()
    }
    
    @objc func nextButtonTapped() {
        viewModel.resetPassword(email: resetPasswordView.emailTextField.text ?? "")
    }

   

}
