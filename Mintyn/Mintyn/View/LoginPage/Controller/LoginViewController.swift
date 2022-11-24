//
//  LoginViewController.swift
//  Mintyn
//
//  Created by Sharon Omoyeni Babatunde on 23/11/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    var phoneNumberChecked = false
    var passwordChecked = false
    var currentThemeState = false
    let viewModel = LoginViewModel()
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpLoginForm()
    }
    
    func setUpLoginForm() {
        passwordTextField.becomeFirstResponder()
        phoneNumberTextField.becomeFirstResponder()
        viewModel.resetForm(passwordTextField, phoneNumberTextField, errorMessageLabel)
        phoneNumberTextField.addPadding(.left(15))
        phoneNumberTextField.addPadding(.right(15))
        passwordTextField.addPadding(.left(15))
        passwordTextField.addPadding(.right(15))
    }
    
    @IBAction func phoneNumberTextFieldAction(_ sender: UITextField) {
        if let phoneNumber = sender.text {
            if let errorMessage = viewModel.invalidPhoneNumber(phoneNumber) {
                errorMessageLabel.text = errorMessage
                errorMessageLabel.isHidden = false
                phoneNumberChecked = false
            } else {
                errorMessageLabel.isHidden = true
                phoneNumberChecked = true
            }
        }
    }
    
    @IBAction func passwordTextFieldAction(_ sender: UITextField) {
        if let password = sender.text {
            if let errorMessage = viewModel.invalidPassword(password) {
                errorMessageLabel.text = errorMessage
                errorMessageLabel.isHidden = false
                passwordChecked = false
            } else {
                errorMessageLabel.isHidden = true
                passwordChecked = true
            }
        }
    }
    
    @IBAction func loginButton(_ sender: Any) {
        
        if phoneNumberChecked && passwordChecked {
            let tabbar = CustomTabBarViewController()
            let homeVC = UINavigationController(rootViewController: HomePageViewController())
            let transactionVC =  UINavigationController(rootViewController: TransactionViewController())
            let moreVC =  UINavigationController(rootViewController: MorePageViewController())
            let supportVC =  UINavigationController(rootViewController: SupportViewController())
            let settingsVC =  UINavigationController(rootViewController: SettingsViewController())
            
            supportVC.title = "Support"
            homeVC.title = "Home"
            moreVC.title = "More"
            transactionVC.title = "Transactions"
            settingsVC.title = "Settings"
            
            homeVC.tabBarItem.image = UIImage(systemName: "house.fill")
            transactionVC.tabBarItem.image = UIImage(systemName: "creditcard.fill")
            supportVC.tabBarItem.image = UIImage(systemName: "beats.headphones")
            settingsVC.tabBarItem.image = UIImage(systemName: "gearshape.circle")
            tabbar.setViewControllers([homeVC, transactionVC, moreVC, supportVC, settingsVC], animated: false)
            tabbar.modalPresentationStyle = .fullScreen
            present(tabbar, animated: true)
            setUpLoginForm()
        }
        
    }
    
    func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: LoginCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: LoginCollectionViewCell.identifier)
    }
    
}

extension LoginViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        viewModel.createLoginModel().count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LoginCollectionViewCell.identifier, for: indexPath) as? LoginCollectionViewCell
        cell?.setupcell(with: viewModel.createLoginModel()[indexPath.item])
        return cell ?? UICollectionViewCell()
    }
    
}

extension LoginViewController: UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 10
        let collectionViewSize = collectionView.frame.size.width - padding
        
        return CGSize(width: collectionViewSize/2, height: collectionView.frame.size.width/4)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
    }
    
}
