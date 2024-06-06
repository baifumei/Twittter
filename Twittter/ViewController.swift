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
    var password: String?
    let toggleVisibilityButton = UIButton(type: .custom)
    
    let signInButton = UIButton(type: .custom)
    let question = UILabel()
    let signUpButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        // Настройка
        setLogo()
        setWelcomeText()
        setSignIn()
        createConfirmButton()
        createSignUpButton()
    }
    
    func setLogo() {
        logo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logo)
        
        // Установка logo
        logo.image = UIImage(named: "blueLogo")
        logo.contentMode = .scaleAspectFill
        
        logo.widthAnchor.constraint(equalToConstant: 35).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 25).isActive = true
        logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -10).isActive = true
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
        
        signIn.topAnchor.constraint(equalTo: welcomeText.bottomAnchor, constant: 60).isActive = true
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
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signInButton)
        
        signInButton.setTitle("Sign in", for: .normal)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .regular)
        signInButton.backgroundColor = UIColor(named: "mainColor")
        signInButton.layer.cornerRadius = 15
        
        signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15).isActive = true
        signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        signInButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        
        signInButton.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
    }
    
    @objc func signInAction() {
        if let password = passwordTextField.text, !password.isEmpty,
           let login = loginTextField.text, !login.isEmpty {
            // Вывод сообщения об ошибке
            print(password)
            print(login)
        } else {
            let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
            animation.duration = 0.6
            animation.values = [-10, 10, -10, 10, -5, 5, -2.5, 2.5, 0]
            signInButton.layer.add(animation, forKey: "shake")
        }
    }
    
    
    func createSignUpButton() {
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        question.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signUpButton)
        view.addSubview(question)
        
        question.text = "Don't have an account?"
        question.font = .systemFont(ofSize: 15, weight: .regular)
        question.textColor = UIColor.lightGray
        
        question.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 10).isActive = true
        question.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        question.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(UIColor(named: "mainColor"), for: .normal)
        signUpButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .regular)
        signUpButton.trailingAnchor.constraint(equalTo: question.trailingAnchor).isActive = true
        signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 5).isActive = true
        
        signUpButton.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
        }
    
    @objc func signUpAction() {
        let registerVC = SignUpVС()
        registerVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(registerVC, animated: true) //add navigation
        print("Push")
    }
}


