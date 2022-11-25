//
//  LoginViewModel.swift
//  Mintyn
//
//  Created by Sharon Omoyeni Babatunde on 23/11/2022.
//

import UIKit

protocol LoginViewModelProtocol {
    func createLoginModel() -> [LoginDisplayModel]
    func invalidPhoneNumber(_ phoneNumber: String) -> String?
    func invalidPassword(_ password: String) -> String?
}

final class LoginViewModel: LoginViewModelProtocol {
    
    var saveThemeState = false {
        didSet {
            themeState()
        }
    }
    var darkLightThemeControl = false
    func themeState() {
        UserDefaults.standard.set(saveThemeState, forKey: "themeState")
    }
    
    func createLoginModel() -> [LoginDisplayModel] {
        return [LoginDisplayModel(image: "shield", label: "Insurance", labelStatus: "Coming soon..."),
                LoginDisplayModel(image: "shield", label: "Open an Account", labelStatus: nil),
                LoginDisplayModel(image: "card", label: "CAC Business Registeration", labelStatus: nil),
                LoginDisplayModel(image: "support", label: "Contact Support", labelStatus: nil)
                
        ]
    }
    
    func invalidPhoneNumber(_ phoneNumber: String) -> String? {
        let set = CharacterSet(charactersIn: phoneNumber)
        if !CharacterSet.decimalDigits.isSuperset(of: set) {
            return "Phone number must contain only digits"
        }
        if phoneNumber.count != 10 || phoneNumber.count >= 11 {
            return "Phone number must be more than 10 digit and less than 11 digits"
        }
        return nil
    }
    
    func invalidPassword(_ password: String) -> String? {
        if password.count < 8 {
            return "Password must be at least 8 characters"
        }
        if containsDigit(password) {
            return "Password must contain at least 1 digit"
        }
        if containsLowerCase(password) {
            return "Password must contain at least 1 lowercase character"
        }
        if containsUpperCase(password) {
            return "Password must contain at least 1 uppercase character"
        }
        return nil
    }
    
    func textField(phoneNumberTextField: UITextField, passwordTextfield: UITextField) -> String? {
        if let phoneNumber = phoneNumberTextField.text, let password = passwordTextfield.text {
            if phoneNumber.isEmpty && password.isEmpty {
                return "Ooops.. Phone Number & Password is required"
            }
            if phoneNumber.isEmpty {
                return "Ooops.. Phone Number is required"
            }
            if password.isEmpty {
                return "Ooops.. Password is required"
            }
        }
        
        return nil
    }
    
    func containsDigit(_ value: String) -> Bool {
        let reqularExpression = ".*[0-9]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        return !predicate.evaluate(with: value)
    }
    
    func containsLowerCase(_ value: String) -> Bool {
        let reqularExpression = ".*[a-z]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        return !predicate.evaluate(with: value)
    }
    
    func containsUpperCase(_ value: String) -> Bool {
        let reqularExpression = ".*[A-Z]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        return !predicate.evaluate(with: value)
    }
    
    func resetForm(_ passwordTextField: UITextField, _ phoneNumberTextField: UITextField, _ errorMessage: UILabel) {
        passwordTextField.text = ""
        phoneNumberTextField.text = ""
        errorMessage.isHidden = true
    }
}
