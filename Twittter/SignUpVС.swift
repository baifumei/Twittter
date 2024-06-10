//
//  SignUpVС.swift
//  Twittter
//
//  Created by Екатерина К on 5/30/24.
//

import UIKit


class SignUpVС: UIViewController {
    let logo = UIImageView()
    
    let welcomeText = UILabel()
    
    let signUp = UILabel()
    let loginTextField = UITextField()
    let emailTextField = UITextField()
    let passwordTextField1 = UITextField()
    var password1: String?
    let passwordTextField2 = UITextField()
    var password2: String?
    
    let signUpButton = UIButton(type: .custom)
    
    let divider1 = UIView()
    let divider2 = UIView()
    
    let signUpWith = UILabel()
    let googleButton = UIButton()
    let appleButton = UIButton()
    
    let terms = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        setLogo()
        setWelcomeText()
        setSignUp()
        createConfirmButton()
        addHorizontalDivider()
        createAppleSignInButton()
        createGoogleSignInButton()
        addTerms()
    }
    
    func setLogo() {
        logo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logo)
        
        // Установка logo
        logo.image = UIImage(named: "blueLogo")
        logo.contentMode = .scaleAspectFill
        
        logo.widthAnchor.constraint(equalToConstant: 35).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 25).isActive = true
        logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
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
    
    func setSignUp() {
        signUp.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signUp)
        
        signUp.text = "Sign Up"
        signUp.font = .systemFont(ofSize: 28, weight: .bold)
        signUp.textAlignment = .center
        
        signUp.topAnchor.constraint(equalTo: welcomeText.bottomAnchor, constant: 60).isActive = true
        signUp.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        signUp.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
    
        //login
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginTextField)
        
        loginTextField.placeholder = "Enter your login"
        loginTextField.borderStyle = .roundedRect
        
        loginTextField.topAnchor.constraint(equalTo: signUp.bottomAnchor, constant: 15).isActive = true
        loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        //email
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailTextField)
        
        emailTextField.placeholder = "Enter your email"
        emailTextField.borderStyle = .roundedRect
        
        emailTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 15).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        //Password
        passwordTextField1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField1)
        
        passwordTextField1.placeholder = "Enter your password"
        passwordTextField1.textContentType = .none // Отключение автоматического создания сильных паролей
        passwordTextField1.isSecureTextEntry = true
        passwordTextField1.borderStyle = .roundedRect
        
        passwordTextField1.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15).isActive = true
        passwordTextField1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        passwordTextField1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        //Re enter password
        passwordTextField2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField2)
        
        passwordTextField2.placeholder = "Enter your password"
        passwordTextField2.textContentType = .none
        passwordTextField2.isSecureTextEntry = true
        passwordTextField2.borderStyle = .roundedRect
        
        passwordTextField2.topAnchor.constraint(equalTo: passwordTextField1.bottomAnchor, constant: 15).isActive = true
        passwordTextField2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        passwordTextField2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        

        let toggleVisibilityButton1 = createVisibilityButton()
        passwordTextField1.rightView = toggleVisibilityButton1
        passwordTextField1.rightViewMode = .always
        
        let toggleVisibilityButton2 = createVisibilityButton()
        passwordTextField2.rightView = toggleVisibilityButton2
        passwordTextField2.rightViewMode = .always
    }
    
    func createVisibilityButton() -> UIButton {
        //password visibility button
        let toggleVisibilityButton = UIButton(type: .custom)
        toggleVisibilityButton.setImage(UIImage(systemName: "eye"), for: .normal)
        toggleVisibilityButton.setImage(UIImage(systemName: "eye.slash"), for: .selected)
        toggleVisibilityButton.tintColor = UIColor.lightGray
        toggleVisibilityButton.addTarget(self, action: #selector(togglePasswordVisibility(_:)), for: .touchUpInside)
        return toggleVisibilityButton
    }
    
    @objc func togglePasswordVisibility(_ sender: UIButton) {
        if let textField = sender.superview as? UITextField {
            textField.isSecureTextEntry.toggle()
            sender.isSelected.toggle()
        }
    }
    
    //confirmation button
    func createConfirmButton() {
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signUpButton)
        
        signUpButton.setTitle("Create an account", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .regular)
        signUpButton.backgroundColor = UIColor(named: "mainColor")
        signUpButton.layer.cornerRadius = 15
        
        signUpButton.topAnchor.constraint(equalTo: passwordTextField2.bottomAnchor, constant: 15).isActive = true
        signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        signUpButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        
        signUpButton.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
    }
    
    @objc func signUpAction() {
        guard let email = emailTextField.text, !email.isEmpty, let login = loginTextField.text, !login.isEmpty else { return }
        
        
        if let password1 = passwordTextField1.text, !password1.isEmpty,
           let password2 = passwordTextField2.text, !password2.isEmpty,
            password1 == password2 {
            print("create an account")
        } else {
            let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
            animation.duration = 0.6
            animation.values = [-10, 10, -10, 10, -5, 5, -2.5, 2.5, 0]
            signUpButton.layer.add(animation, forKey: "shake2")
        }
    }
    
    //Add horizontal divider
    func addHorizontalDivider() {
        //Enter with
        signUpWith.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signUpWith)
        
        signUpWith.text = "Register with:"
        signUpWith.textColor = .black
        signUpWith.font = .systemFont(ofSize: 15, weight: .light)
        
        signUpWith.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 20).isActive = true
        signUpWith.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        divider1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(divider1)
        
        divider1.backgroundColor = .lightGray
        
        divider1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        divider1.trailingAnchor.constraint(equalTo: signUpWith.leadingAnchor, constant: -5).isActive = true
        divider1.heightAnchor.constraint(equalToConstant: 1).isActive = true
        divider1.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 30).isActive = true
        
        
        divider2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(divider2)
        
        divider2.backgroundColor = .lightGray
        
        divider2.leadingAnchor.constraint(equalTo: signUpWith.trailingAnchor, constant: 5).isActive = true
        divider2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        divider2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        divider2.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 30).isActive = true
    }
    
    //Another way to sign up
    func createGoogleSignInButton() {
        googleButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(googleButton)
        
        googleButton.setImage(UIImage(named: "googleLogo"), for: .normal)
        googleButton.imageView?.contentMode = .scaleAspectFit
                
        googleButton.layer.cornerRadius = 20
        googleButton.backgroundColor = UIColor.white
        googleButton.clipsToBounds = true
        
        googleButton.topAnchor.constraint(equalTo: signUpWith.bottomAnchor, constant: 15).isActive = true
        googleButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        googleButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        googleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width / 2 - 50).isActive = true
        
        //add target
    }
    
    func createAppleSignInButton() {
        appleButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(appleButton)
        
        appleButton.setImage(UIImage(named: "appleLogo"), for: .normal)
        appleButton.imageView?.contentMode = .scaleAspectFit
        appleButton.backgroundColor = .blue
                
        appleButton.layer.cornerRadius = 20
        appleButton.backgroundColor = UIColor.white
        appleButton.clipsToBounds = true
        
        appleButton.topAnchor.constraint(equalTo: signUpWith.bottomAnchor, constant: 13).isActive = true
        appleButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        appleButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        appleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -view.frame.width / 2 + 50).isActive = true
        
        //add target
    }
    
    func addTerms() {
        terms.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(terms)
        
        terms.text = """
By signing up, you agree to the Terms of Service and
Privacy Policy, including Cookie Use.
"""
        terms.numberOfLines = 2
        terms.textAlignment = .left
        terms.font = .systemFont(ofSize: 15, weight: .medium)
        terms.textColor = .lightGray
        
        terms.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        terms.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        
        //need add url
    }
}
