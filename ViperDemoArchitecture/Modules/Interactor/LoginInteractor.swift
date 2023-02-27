//
//  LoginInteractor.swift
//  Viper Demo Architecture
//
//  Created by KOVIGROUP on 27/02/2023.
//

import Foundation

protocol LoginInteractorProtocol: AnyObject {
    func login(username: String, password: String)
}

protocol LoginInteractorOutputProtocol: AnyObject {
    func loginDidFinish(success: Bool, message: String)
}

class LoginInteractor {
    
    weak var output: LoginInteractorOutputProtocol?
    
}

extension LoginInteractor: LoginInteractorProtocol {
    func login(username: String, password: String) {
        // Perform login logic here
        let success = true // Replace with your own login logic
        let message = success ? "Login successful" : "Invalid username or password"
        output?.loginDidFinish(success: success, message: message)
    }
}
