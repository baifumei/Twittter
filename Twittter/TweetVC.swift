//
//  TweenVC.swift
//  Twittter
//
//  Created by Екатерина К on 7/2/24.
//

import UIKit


class TweetVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupCloseButton()
        setupTweetButton()
    }
    
    func setupCloseButton() {
        let closeButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(closeTapped))
        self.navigationItem.leftBarButtonItem = closeButton
    }
    
    @objc func closeTapped() {
        // Закрытие модального представления
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupTweetButton() {
        let button = UIButton()
        button.setTitle("Tweet", for: .normal)
        button.backgroundColor = UIColor(named: "mainColor")
        button.tintColor = .white
        button.frame = CGRect(x: 0, y: 0, width: 70, height: 20)
        button.addTarget(self, action: #selector(postTweet), for: .touchUpInside)
        button.layer.cornerRadius = 16
        
        let tweetButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = tweetButton
    }
    
    @objc func postTweet() {
        //post it!
    }
}
