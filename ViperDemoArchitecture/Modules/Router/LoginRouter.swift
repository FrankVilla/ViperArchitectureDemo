//
//  LoginRouter.swift
//  Viper Demo Architecture
//
//  Created by KOVIGROUP on 27/02/2023.
//

import UIKit

protocol LoginRouterProtocol: AnyObject {
    func showHomeScreen()
}

class LoginRouter {
    
    weak var view: UIViewController?
    
}

extension LoginRouter: LoginRouterProtocol {
    func showHomeScreen() {
        let homeViewController = UIViewController() // Replace with your own home screen view controller
        view?.navigationController?.pushViewController(homeViewController, animated: true)
    }
}
