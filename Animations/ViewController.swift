//
//  ViewController.swift
//  Animations
//
//  Created by João Pedro Cappelletto D'Agnoluzzo on 21/02/20.
//  Copyright © 2020 dbserver. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var logoImageView: UIImageView!
    var loginLabel: UITextField!
    var passwordLabel: UITextField!
    var changeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoImageView = UIImageView(frame: CGRect.zero)
        logoImageView.image = UIImage(named: "noLogo")
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.alpha = 0
        self.view.addSubview(logoImageView)
        
        logoImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(100)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide.snp.centerX)
            let width = UIScreen.main.bounds.width - 150
            make.width.equalTo(width)
            make.height.equalTo(120)
        }
        
        loginLabel = UITextField(frame: CGRect.zero)
        loginLabel.placeholder = "login"
        loginLabel.textAlignment = .left
        loginLabel.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        loginLabel.alpha = 0
        loginLabel.layer.cornerRadius = 10
        loginLabel.insetsLayoutMarginsFromSafeArea = true
        loginLabel.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
        self.view.addSubview(loginLabel)
        
        
        loginLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view.safeAreaLayoutGuide.snp.centerX).offset(-400)
            make.top.equalTo(logoImageView.snp.bottom).offset(30)
            make.height.equalTo(40)
            let width = UIScreen.main.bounds.width - 80
            make.width.equalTo(width)
        }
        
        passwordLabel = UITextField(frame: CGRect.zero)
        passwordLabel.placeholder = "password"
        passwordLabel.textAlignment = .left
        passwordLabel.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        passwordLabel.alpha = 0
        passwordLabel.isSecureTextEntry = true
        passwordLabel.layer.cornerRadius = 10
        passwordLabel.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
        self.view.addSubview(passwordLabel)
        
        passwordLabel.snp.makeConstraints { (make) in
            make.top.equalTo(loginLabel.snp.bottom).offset(10)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide.snp.centerX).offset(-400)
            make.height.equalTo(loginLabel.snp.height)
            make.width.equalTo(loginLabel.snp.width)
        }
        
        
        changeButton = UIButton(type: .system)
        changeButton.setTitle("Sign In", for: .normal)
        changeButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        changeButton.setBackgroundColor(UIColor.systemBlue, for: .normal)
        changeButton.setTitleColor(.white, for: .normal)
        changeButton.clipsToBounds = true
        changeButton.layer.cornerRadius = 10
        changeButton.alpha = 0
        
        self.view.addSubview(changeButton)
        changeButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordLabel.snp.bottom).offset(500)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide.snp.centerX)
            make.height.equalTo(loginLabel.snp.height)
            make.width.equalTo(loginLabel.snp.width)
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }
    
    func animate(){
        let labelsOffset: Int = 0
        let buttonOffset: Int = 20
        let alpha: CGFloat = 1
        
        self.loginLabel.snp.updateConstraints { (make) in
            make.centerX.equalTo(self.view.safeAreaLayoutGuide.snp.centerX).offset(labelsOffset)
        }
        self.changeButton.snp.updateConstraints { (make) in
            make.top.equalTo(self.passwordLabel.snp.bottom).offset(buttonOffset)
        }
        
        UIView.animate(withDuration: 1.0, delay: 0.3, options: [.curveEaseOut], animations: {
            self.loginLabel.alpha = alpha
            self.changeButton.alpha = alpha
            self.logoImageView.alpha = alpha
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        self.passwordLabel.snp.updateConstraints { (make) in
            make.centerX.equalTo(self.view.safeAreaLayoutGuide.snp.centerX).offset(labelsOffset)
        }
        
        UIView.animate(withDuration: 1.0, delay: 0.5, options: [.curveEaseOut], animations: {
            self.passwordLabel.alpha = alpha
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

    @objc
    func signIn(){
        print("Trying to sign in")
    }
}

