//
//  HomeVC.swift
//  Twittter
//
//  Created by Екатерина К on 6/24/24.
//

import UIKit

class HomeVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let logo = UIImageView()
    var logoCenterXConstraint: NSLayoutConstraint?
    
    var tableView: UITableView!
    let menuButton = UIButton()
    var avatarWidthAnchorConstraint: NSLayoutConstraint?
    var avatarHeightAnchorConstraint: NSLayoutConstraint?
    
    var tweetButton = UIButton(type: .custom)
    var tweetButtonTrailingAnchorConstraint: NSLayoutConstraint?
    
    var isMenuOpen = false
    let menuViewController = MenuViewController()
    var menuWidth: CGFloat {
        return view.frame.width * 0.75
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setLogo()
        setupMenuButton()
        createTwitBoard()
        createTweet()
    }
    
    func setLogo() {
        logo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logo)
        
        // Установка logo
        logo.image = UIImage(named: "blueLogo")
        logo.contentMode = .scaleAspectFill
        
        logo.widthAnchor.constraint(equalToConstant: 35).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 25).isActive = true
        logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        
        logoCenterXConstraint = logo.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        logoCenterXConstraint?.isActive = true
    }
    
    func setupMenu() {
        addChild(menuViewController)
        menuViewController.view.frame = CGRect(x: -menuWidth, y: 0, width: menuWidth, height: view.frame.height)
        view.addSubview(menuViewController.view)
        menuViewController.didMove(toParent: self)
    }
    
    func setupMenuButton() {
        view.addSubview(menuButton)
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        menuButton.layer.cornerRadius = 17.5
        if let image = UIImage(named: "defaultImage") {
            menuButton.setImage(image, for: .normal)
            menuButton.imageView?.contentMode = .scaleAspectFill
        }
        menuButton.clipsToBounds = true
        menuButton.addTarget(self, action: #selector(openMenu), for: .touchUpInside)
        
        menuButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        menuButton.centerYAnchor.constraint(equalTo: logo.centerYAnchor).isActive = true
        avatarWidthAnchorConstraint = menuButton.widthAnchor.constraint(equalToConstant: 35)
        avatarWidthAnchorConstraint?.isActive = true
        avatarHeightAnchorConstraint = menuButton.heightAnchor.constraint(equalToConstant: 35)
        avatarHeightAnchorConstraint?.isActive = true
        
    }
   
    @objc func openMenu() {
        //go to menu settings
        
        isMenuOpen.toggle()
        print(isMenuOpen.description)
        
        let targetPosition = isMenuOpen ? menuWidth : 0
        let size: CGFloat = 55
        logoCenterXConstraint?.constant = isMenuOpen ? targetPosition : 0
        tweetButtonTrailingAnchorConstraint?.constant = isMenuOpen ? targetPosition : -20
        avatarHeightAnchorConstraint?.constant = isMenuOpen ? size : 35
        avatarWidthAnchorConstraint?.constant = isMenuOpen ? size : 35
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
            self.tableView.frame.origin.x = targetPosition
            self.menuViewController.view.frame.origin.x = self.isMenuOpen ? 0 : -self.menuWidth
        }
    }
    
    func createTwitBoard() {
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 10),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Tweet: \(indexPath.row)"
        return cell
    }
    
    func createTweet() {
        tweetButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tweetButton)
        
        tweetButton.setImage(UIImage(named: "tweet"), for: .normal)
        tweetButton.imageView?.contentMode = .scaleAspectFit
        tweetButton.backgroundColor = .white
        
        
        tweetButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        tweetButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        tweetButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15).isActive = true
        tweetButtonTrailingAnchorConstraint = tweetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        tweetButtonTrailingAnchorConstraint?.isActive = true
        
        tweetButton.addTarget(self, action: #selector(toggleTweet), for: .touchUpInside)
    }
    
    @objc func toggleTweet() {
        let tweetVC = TweetVC()
        let navigationController = UINavigationController(rootViewController: tweetVC)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
        print("tapped")
    }
}
