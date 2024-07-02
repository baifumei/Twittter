//
//  HomeVC.swift
//  Twittter
//
//  Created by Екатерина К on 6/24/24.
//

import UIKit

class HomeVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let logo = UIImageView()
    var tableView: UITableView!
    
    var tweetButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setLogo()
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
        logo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func upperBar() {
        
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
        tweetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
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
