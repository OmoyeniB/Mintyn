//
//  LoginViewModel.swift
//  Mintyn
//
//  Created by Sharon Omoyeni Babatunde on 23/11/2022.
//

import Foundation

protocol LoginViewModelProtocol {
    func createLoginModel() -> [LoginDisplayModel]
  
}

final class LoginViewModel: LoginViewModelProtocol {
    
    func createLoginModel() -> [LoginDisplayModel] {
        return [LoginDisplayModel(image: "shield", label: "Insurance", labelStatus: "Coming soon..."),
                LoginDisplayModel(image: "shield", label: "Open an Account", labelStatus: nil),
                LoginDisplayModel(image: "card", label: "CAC Business Registeration", labelStatus: nil),
                LoginDisplayModel(image: "support", label: "Contact Support", labelStatus: nil)
                
        ]
    }
}
