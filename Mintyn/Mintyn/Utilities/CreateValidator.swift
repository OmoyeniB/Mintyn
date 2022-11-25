//
//  CreateValidator.swift
//  MintynTests
//
//  Created by Sharon Omoyeni Babatunde on 25/11/2022.
//


import Foundation

protocol CreateValidatorImpl {
    func validatePassword(_ password: String) throws
    func validatePhoneNumber(_ phoneNumber: String) throws
}

struct CreateValidator: CreateValidatorImpl {
    
    func validatePassword(_ password: String) throws {
        if password.isEmpty {
            throw CreateValidatorError.invalidPassword
        }
    }
    
    func validatePhoneNumber(_ phoneNumber: String) throws {
        if phoneNumber.isEmpty {
            throw CreateValidatorError.invalidPhoneNumber
        }
    }
    
    
}

extension CreateValidator {
    enum CreateValidatorError: LocalizedError {
        case invalidPassword
        case invalidPhoneNumber
    }
}

extension CreateValidator.CreateValidatorError {
    
    var errorDescription: String? {
        switch self {
        case .invalidPassword:
            return "First name can't be empty"
        case .invalidPhoneNumber:
            return "Last name can't be empty"
        }
    }
    
}
