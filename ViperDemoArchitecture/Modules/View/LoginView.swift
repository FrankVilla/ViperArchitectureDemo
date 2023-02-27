//
//  LoginView.swift
//  Viper Demo Architecture
//
//  Created by KOVIGROUP on 27/02/2023.
//

import UIKit

protocol LoginViewProtocol: AnyObject {
    func showLoginResult(message: String)
}

class LoginView: UIViewController {
    
    var presenter: LoginPresenterProtocol?
    
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        
        // Configure usernameTextField
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.placeholder = "Username"
        view.addSubview(usernameTextField)
        
        // Configure passwordTextField
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        view.addSubview(passwordTextField)
        
        // Configure loginButton
        loginButton.backgroundColor = .blue
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 5
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        view.addSubview(loginButton)
        
        // Add layout constraints
        let stackView = UIStackView(arrangedSubviews: [usernameTextField, passwordTextField, loginButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            usernameTextField.heightAnchor.constraint(equalToConstant: 40),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            loginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc private func loginButtonTapped() {
        presenter?.login(username: usernameTextField.text ?? "", password: passwordTextField.text ?? "")
    }
}

extension LoginView: LoginViewProtocol {
    func showLoginResult(message: String) {
        // Show a message to the user
    }
}
