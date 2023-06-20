//
//  RegistrationViewController.swift
//  AuthenticationApp
//
//  Created by poskreepta on 31.05.23.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    private var viewModel: RegistrationViewModelType
    private var registrationView = RegistrationView()
    private var emailAlertView = CustomAlertView()
    
    init(viewModel: RegistrationViewModelType) {
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
        registrationView.navigationLabel.text = "Регистрация"
        registrationView.nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        registrationView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        registrationView.emailTextField.addTarget(self, action: #selector(emailTextFieldDidChange), for: .editingChanged)
        emailAlertView.closeAlertButton.addTarget(self, action: #selector(closeAlertButtonTapped), for: .touchUpInside)
        view.addSubview(registrationView)
        registrationView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc func backButtonTapped() {
        viewModel.goBack()
    }
    
    @objc func nextButtonTapped() {
        guard let email = registrationView.emailTextField.text else { return }
        viewModel.checkEmail(email: email)
        viewModel.showEmailSentAlertToUser = { [weak self] in
            DispatchQueue.main.async {
                self?.view.configureBlurView()
                self?.view.addSubview(self?.emailAlertView ?? UIView())
                self?.emailAlertView.snp.makeConstraints { make in
                    make.center.equalToSuperview()
                    make.size.equalTo(self?.resized(width: 343, height: 343) ?? .zero)
                }
                self?.emailAlertView.alertLabel.email = "\(email)"
            }
        }
        viewModel.showAlertMessageClosure = { [weak self] message in
            DispatchQueue.main.async {
                self?.emailAlertView.alertLabel.text = message
                self?.view.configureBlurView()
                self?.view.addSubview(self?.emailAlertView ?? UIView())
                self?.emailAlertView.snp.makeConstraints { make in
                    make.center.equalToSuperview()
                    make.size.equalTo(self?.resized(width: 343, height: 343) ?? .zero)
                }
            }
        }
    }
    
    @objc func closeAlertButtonTapped() {
        view.subviews.forEach { subView in
            if subView != registrationView {
                subView.removeFromSuperview()
            }
        }
        viewModel.goToUserDetails()
//        если нет user_id то не перейдет на details, лучше переделать
    }
    
    @objc func emailTextFieldDidChange() {
        guard let email = registrationView.emailTextField.text else { return }
        if Validation.isValidEmail(for: email) {
            registrationView.nextButton.configurePurpleStyleButton()
        }
    }
}


