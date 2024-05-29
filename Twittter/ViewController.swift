//
//  ViewController.swift
//  Twittter
//
//  Created by Екатерина К on 5/28/24.
//

import UIKit

class ViewController: UIViewController {
    let logo = UIImageView()
    
    let welcomeText = UILabel()
    
    let signIn = UILabel()
    let loginTextField = UITextField()
    let passwordTextField = UITextField()
    let toggleVisibilityButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Настройка
        setLogo()
        setWelcomeText()
        setSignIn()
    }

    func setLogo() {
        logo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logo)
        
        // Установка logo
        logo.image = UIImage(named: "blueLogo")
        logo.contentMode = .scaleAspectFill
        
        logo.widthAnchor.constraint(equalToConstant: 35).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 25).isActive = true
        logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        logo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setWelcomeText() {
        welcomeText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcomeText)
        
        welcomeText.text = """
See what's 
happening in the
world right now.
"""
        welcomeText.numberOfLines = 3
        welcomeText.font = .systemFont(ofSize: 30, weight: .heavy)
        welcomeText.textAlignment = .left
        
        welcomeText.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 60).isActive = true
        welcomeText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        welcomeText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
    }
    
    func setSignIn() {
        //SingIn
        signIn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signIn)
        
        signIn.text = "Sign In"
        signIn.font = .systemFont(ofSize: 28, weight: .bold)
        signIn.textAlignment = .center
        
        signIn.topAnchor.constraint(equalTo: welcomeText.bottomAnchor, constant: 80).isActive = true
        signIn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        signIn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        //Login
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginTextField)
        
        loginTextField.placeholder = "Enter your login or email"
        loginTextField.borderStyle = .roundedRect
        
        loginTextField.topAnchor.constraint(equalTo: signIn.bottomAnchor, constant: 15).isActive = true
        loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        //Password
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
        
        passwordTextField.placeholder = "Enter your password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.borderStyle = .roundedRect
        
        passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 15).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        //password visibility button
        toggleVisibilityButton.setImage(UIImage(systemName: "eye"), for: .normal)
        toggleVisibilityButton.setImage(UIImage(systemName: "eye.slash"), for: .selected)
        toggleVisibilityButton.tintColor = UIColor.lightGray
        toggleVisibilityButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)

        passwordTextField.rightView = toggleVisibilityButton
        passwordTextField.rightViewMode = .always
    }
    
    @objc func togglePasswordVisibility() {
        passwordTextField.isSecureTextEntry.toggle()
        toggleVisibilityButton.isSelected.toggle()
        
    }
    
    func createConfirmButton() {
        let signInButton = UIButton()
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signInButton)
        
        signInButton.titleLabel?.text = "Sign in"
        signInButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        signInButton.backgroundColor = UIColor.systemIndigo
        
    }
}


