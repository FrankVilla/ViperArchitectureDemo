//
//  LoginPresenter.swift
//  Viper Demo Architecture
//
//  Created by KOVIGROUP on 27/02/2023.
//

import Foundation

protocol LoginPresenterProtocol: AnyObject {
    func login(username: String, password: String)
}

class LoginPresenter {
    
    weak var view: LoginViewProtocol?
    var interactor: LoginInteractorProtocol?
    var router: LoginRouterProtocol?
    
}

func login(username: String, password: String) {
       // Perform the login process here
       // You might use a network library like Alamofire to send a login request to a server
       // Once the request is complete, you can update the view with the result
       // For example, you might call the view's showLoginResult(message:) method with a success or error message
   }

extension LoginPresenter: LoginPresenterProtocol {
    func login(username: String, password: String) {
        interactor?.login(username: username, password: password)
    }
}

extension LoginPresenter: LoginInteractorOutputProtocol {
    func loginDidFinish(success: Bool, message: String) {
        if success {
            router?.showHomeScreen()
        } else {
            view?.showLoginResult(message: message)
        }
    }
}
