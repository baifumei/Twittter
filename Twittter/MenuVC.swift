//
//  MenuVC.swift
//  Twittter
//
//  Created by Екатерина К on 8/17/24.
//

import UIKit

class MenuViewController: UIViewController {
    
    var userImage = UIImageView()
    var name = UILabel()
    var userName = "@kateBlok"
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupUserImage()
        setProfile()
    }
    
    func setupUserImage() {
        view.addSubview(userImage)
        userImage.translatesAutoresizingMaskIntoConstraints = false
        userImage.frame = CGRect(x: 0, y: 0, width: 55, height: 55)
        userImage.layer.cornerRadius = 27
        
        
        if let image = UIImage(named: "me") {
            userImage.image = image
            userImage.contentMode = .scaleAspectFill
        }
        
        userImage.clipsToBounds = true
        
        userImage.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: -10).isActive = true
        userImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        userImage.widthAnchor.constraint(equalToConstant: 55).isActive = true
        userImage.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
    }
    
    func setProfile() {
        name.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(name)
        
        name.text = "Katerina"
        name.font = .systemFont(ofSize: 18, weight: .bold)
        name.textColor = UIColor.black
        name.textAlignment = .left
        
        NSLayoutConstraint.activate([
            name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            name.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 10)
        ])
    }
}
