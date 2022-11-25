//
//  MintynTests.swift
//  MintynTests
//
//  Created by Sharon Omoyeni Babatunde on 25/11/2022.
//

import XCTest
@testable import Mintyn

final class MintynTests: XCTestCase {
    private var validator: CreateValidator!
    
    override func setUp() {
        validator = CreateValidator()
    }
    
    override func tearDown() {
        validator = nil
    }
    
    func test_with_empty_password_error_thrown() {
        let password = ""
        XCTAssertThrowsError(try validator.validatePassword(password), "Error for an empty password")
        do {
            _ = try validator.validatePassword(password)
        } catch {
            guard let passwordError = error as? CreateValidator.CreateValidatorError else {
                XCTFail("Not the error type expected, ...expecting a create validator error")
                return
            }
            XCTAssertEqual(passwordError, CreateValidator.CreateValidatorError.invalidPassword, "Expecting an error of invalid password")
        }
    }
    
    func test_with_empty_phoneNumber_error_thrown() {
        let phoneNumber = ""
        XCTAssertThrowsError(try validator.validatePhoneNumber(phoneNumber), "Error for an empty phoneNumber")
        do {
            _ = try validator.validatePhoneNumber(phoneNumber)
        } catch {
            guard let phoneNumberError = error as? CreateValidator.CreateValidatorError else {
                XCTFail("Not the error type expected, ...expecting a create validator error")
                return
            }
            XCTAssertEqual(phoneNumberError, CreateValidator.CreateValidatorError.invalidPhoneNumber, "Expecting an error of invalid phoneNumber")
        }
    }
    
    func test_with_valid_phoneNumber_error_not_thrown() {
        let phoneNumber = "070123456789"
        do {
            _ = try validator.validatePhoneNumber(phoneNumber)
        } catch {
            XCTFail("No errors should be thrown, since the person should be a valid object")
        }
    }
    
    func test_with_valid_password_error_not_thrown(){
        let password = "Omoyeni"
        do {
            _ = try validator.validatePassword(password)
        } catch {
            XCTFail("No errors should be thrown, since the person should be a valid object")
        }
    }
    
}
