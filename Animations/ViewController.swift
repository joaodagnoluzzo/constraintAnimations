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
    var loginTextField: UITextField!
    var passwordTextField: UITextField!
    var changeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoImageView = UIImageView(frame: CGRect.zero)
        logoImageView.image = UIImage(named: "noLogo")
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.alpha = 0
        self.view.addSubview(logoImageView)
        
        logoImageView.snp.makeConstraints { (make) in
            let top = UIScreen.main.bounds.height / 8
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(top)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide.snp.centerX)
            let width = UIScreen.main.bounds.width - 150
            make.width.equalTo(width)
            make.height.equalTo(120)
        }
        
        loginTextField = UITextField(frame: CGRect.zero)
        loginTextField.placeholder = "login"
        loginTextField.textAlignment = .left
        loginTextField.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        loginTextField.alpha = 0
        loginTextField.layer.cornerRadius = 10
        loginTextField.insetsLayoutMarginsFromSafeArea = true
        loginTextField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
        self.view.addSubview(loginTextField)
        
        
        loginTextField.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view.safeAreaLayoutGuide.snp.centerX).offset(-400)
            make.top.equalTo(logoImageView.snp.bottom).offset(30)
            make.height.equalTo(40)
            let width = UIScreen.main.bounds.width - 80
            make.width.equalTo(width)
        }
        
        passwordTextField = UITextField(frame: CGRect.zero)
        passwordTextField.placeholder = "password"
        passwordTextField.textAlignment = .left
        passwordTextField.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        passwordTextField.alpha = 0
        passwordTextField.isSecureTextEntry = true
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
        self.view.addSubview(passwordTextField)
        
        passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(loginTextField.snp.bottom).offset(10)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide.snp.centerX).offset(-400)
            make.height.equalTo(loginTextField.snp.height)
            make.width.equalTo(loginTextField.snp.width)
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
            make.top.equalTo(passwordTextField.snp.bottom).offset(500)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide.snp.centerX)
            make.height.equalTo(loginTextField.snp.height)
            make.width.equalTo(loginTextField.snp.width)
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
        
        self.loginTextField.snp.updateConstraints { (make) in
            make.centerX.equalTo(self.view.safeAreaLayoutGuide.snp.centerX).offset(labelsOffset)
        }
        self.changeButton.snp.updateConstraints { (make) in
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(buttonOffset)
        }
        
        UIView.animate(withDuration: 1.0, delay: 0.3, options: [.curveEaseOut], animations: {
            self.loginTextField.alpha = alpha
            self.changeButton.alpha = alpha
            self.logoImageView.alpha = alpha
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        self.passwordTextField.snp.updateConstraints { (make) in
            make.centerX.equalTo(self.view.safeAreaLayoutGuide.snp.centerX).offset(labelsOffset)
        }
        
        UIView.animate(withDuration: 1.0, delay: 0.5, options: [.curveEaseOut], animations: {
            self.passwordTextField.alpha = alpha
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

    @objc
    func signIn(){
        print("Trying to sign in")
        if loginTextField.isFirstResponder { loginTextField.resignFirstResponder() }
        if passwordTextField.isFirstResponder { passwordTextField.resignFirstResponder() }
    }
}

