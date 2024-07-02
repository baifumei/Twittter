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
    }
    
    func setupCloseButton() {
        let closeButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(closeTapped))
        self.navigationItem.leftBarButtonItem = closeButton
    }
    
    @objc func closeTapped() {
        // Закрытие модального представления
        self.dismiss(animated: true, completion: nil)
    }
}
