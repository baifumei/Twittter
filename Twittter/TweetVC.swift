//
//  TweenVC.swift
//  Twittter
//
//  Created by Екатерина К on 7/2/24.
//

import UIKit


class TweetVC: UIViewController, UITextViewDelegate {
    
    let tweetTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.textColor = UIColor.lightGray
        textView.text = "What's happening?"
        return textView
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupCloseButton()
        setupTweetButton()
        setupTweetTextView()
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
    
    // Text area
    func setupTweetTextView() {
        view.addSubview(tweetTextView)
        
        NSLayoutConstraint.activate([
            tweetTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            tweetTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tweetTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tweetTextView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        tweetTextView.delegate = self
    }
    
    // UITextViewDelegate methods
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "What's happening?"
            textView.textColor = UIColor.lightGray
        }
    }
}
