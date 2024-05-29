//
//  ViewController.swift
//  Twittter
//
//  Created by Екатерина К on 5/28/24.
//

import UIKit

class ViewController: UIViewController {
    let userImage = UIImageView()
    
    let signIn = UILabel()
    let login = UILabel()
    let loginTextField = UITextField()
    let password =  UILabel()
    let passwordTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Настройка userImage
        setUserImage()
        
        // Настройка Sign in
        setSignIn()
    }

    func setUserImage() {
        userImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userImage)
        
        // Установка изображения
        userImage.image = UIImage(named: "defaultImage")
        userImage.contentMode = .scaleAspectFill
        
        userImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
        userImage.heightAnchor.constraint(equalToConstant: 120).isActive = true
        userImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90).isActive = true
        userImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // Делаем userImage круглым
        userImage.layer.cornerRadius = 60
        userImage.layer.masksToBounds = true
        
        // Добавляем рамку
        userImage.layer.borderWidth = 2
        userImage.layer.borderColor = UIColor.systemIndigo.cgColor
    }
    
    func setSignIn() {
        //SingIn
        signIn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signIn)
        
        signIn.text = "Sign In"
        signIn.font = .systemFont(ofSize: 30, weight: .bold)
        signIn.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 20).isActive = true
        signIn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        
        //Login
        login.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(login)
        
        login.text = "Login"
        login.font = .systemFont(ofSize: 18, weight: .regular)
        login.topAnchor.constraint(equalTo: signIn.bottomAnchor, constant: 20).isActive = true
        login.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        
        //Login TextField
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginTextField)
        
        loginTextField.placeholder = "Enter your login or email"
        loginTextField.borderStyle = .roundedRect
        loginTextField.topAnchor.constraint(equalTo: login.bottomAnchor, constant: 15).isActive = true
        loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        
        //Password
        password.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(password)
        
        password.text = "Password"
        password.font = .systemFont(ofSize: 18, weight: .regular)
        password.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20).isActive = true
        password.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        
        //Password TextField
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
        
        passwordTextField.placeholder = "Enter your password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 15).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
    }
}


