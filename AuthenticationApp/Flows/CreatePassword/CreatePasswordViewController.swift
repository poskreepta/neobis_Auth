//
//  CreatePasswordViewController.swift
//  AuthenticationApp
//
//  Created by poskreepta on 06.06.23.
//

import UIKit

class CreatePasswordViewController: UIViewController {
    
    private var viewModel: CreatePasswordViewModelType
    private var createPasswordView = CreatePasswordView()
    
    init(viewModel: CreatePasswordViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        createPasswordView.nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        createPasswordView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        createPasswordView.passwordTextField.addTarget(self, action: #selector(passwordTextFieldDidChange), for: .editingChanged)
        createPasswordView.againPasswordTextField.addTarget(self, action: #selector(passwordTextFieldDidChange), for: .editingChanged)
    }
    
    func setupViews() {
        view.addSubview(createPasswordView)
        createPasswordView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc func nextButtonTapped() {
        viewModel.createPassword(password: createPasswordView.passwordTextField.text ?? "", passwordRepeat: createPasswordView.againPasswordTextField.text ?? "")
    }
    
    @objc func backButtonTapped() {
        viewModel.goBack()
    }
    
    @objc func passwordTextFieldDidChange() {
        guard let password = createPasswordView.passwordTextField.text else { return }
        guard let passwordAgain = createPasswordView.againPasswordTextField.text else { return }

        if Validation.hasUppercaseLetter(for: password) {
            createPasswordView.capitalLetterLabel.textLabel.textColor = .blue
            createPasswordView.capitalLetterLabel.bulletView.backgroundColor = .blue
        } else {
            createPasswordView.capitalLetterLabel.textLabel.textColor = .gray
            createPasswordView.capitalLetterLabel.bulletView.backgroundColor = .gray
        }
        
        if Validation.hasDigit(for: password) {
            createPasswordView.numberLabel.textLabel.textColor = .blue
            createPasswordView.numberLabel.bulletView.backgroundColor = .blue
        } else {
            createPasswordView.numberLabel.textLabel.textColor = .gray
            createPasswordView.numberLabel.bulletView.backgroundColor = .gray
        }
        
        if Validation.hasSpecialCharacter(for: password) {
            createPasswordView.specialLabel.textLabel.textColor = .blue
            createPasswordView.specialLabel.bulletView.backgroundColor = .blue
        } else {
            createPasswordView.specialLabel.textLabel.textColor = .gray
            createPasswordView.specialLabel.bulletView.backgroundColor = .gray
        }
        
        if Validation.isPasswordMatching(password, confirmPassword: passwordAgain) {
            createPasswordView.matchLabel.textLabel.textColor = .blue
            createPasswordView.matchLabel.bulletView.backgroundColor = .blue
        } else {
            createPasswordView.matchLabel.textLabel.textColor = .gray
            createPasswordView.matchLabel.bulletView.backgroundColor = .gray
        }
    }
}
