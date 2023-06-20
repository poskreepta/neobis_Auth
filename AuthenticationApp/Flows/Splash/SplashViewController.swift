//
//  SplashViewController.swift
//  AuthenticationApp
//
//  Created by poskreepta on 31.05.23.
//

import UIKit
import SnapKit

class SplashViewController: UIViewController {
    
    private var viewModel: SplashViewModelType
    private var splashView = SplashView()
    
    init(viewModel: SplashViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        splashView.registrationButton.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)
        splashView.logInButton.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
    }
    
    func setupViews() {
        view.addSubview(splashView)
        splashView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc func registrationButtonTapped() {
        viewModel.tapRegistrationButton()
    }
    
    @objc func logInButtonTapped() {
        viewModel.tapLogInButton()
    }
}
