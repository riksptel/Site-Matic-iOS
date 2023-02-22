//
//  ViewController.swift
//  Site Matic iOS
//
//  Created by Rachit Prajapati on 10/02/23.
//

import UIKit

class LoginController: UIViewController {
    
    private let splashImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "splash_screen")
        imageView.contentMode = .scaleToFill
        imageView.layer.opacity = 0.3
        return imageView
    }()
    
    private let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let usernameTextField: UITextField = {
        let textField = UITextField().createTextField(placeholder: "Username")
        textField.isSecureTextEntry = false
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField().createTextField(placeholder: "Password")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var usernameContainerView: UIView = {
        let view = UIView().createContainer(image: UIImage(named: "user"), textField: usernameTextField)
        
        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        let view = UIView().createContainer(image:  UIImage(named: "lock"), textField: passwordTextField)
        return view
    }()
    
    private let forgotPasswordBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot Password?", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    private let loginBtn: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "arrow_right")
        button.setDimensions(width: 65, height: 65)
        button.layer.cornerRadius = 32.5
        button.backgroundColor = UIColor.rgb(red: 255, green: 204, blue: 0)
        button.setImage(image, for: .normal)
        button.layer.borderWidth = 4.0
        button.layer.borderColor = UIColor.rgb(red: 63, green: 63, blue: 62).cgColor
        button.addTarget(LoginController.self, action: #selector(performAuth), for: .touchUpInside)
        return button
    }()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK:- Selectors
    @objc func performAuth() {
        //TODO:- Solve the keywindow logic
//        let newKeywindow = UIApplication.shared.windows.first { $0.isKeyWindow }
//        guard let vc = newKeywindow?.rootViewController as? SiteOverviewController else { return }

            let nav = UINavigationController(rootViewController: SiteOverviewController())
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true, completion: nil)

    }
    
    
    //Helper methods
    func setupUI() {
        view.addSubview(splashImage)
        splashImage.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        view.addSubview(passwordContainerView)
        passwordContainerView.centerY(inView: view)
        passwordContainerView.anchor(left: view.leftAnchor, right: view.rightAnchor, paddingLeft: view.frame.size.width * 0.1, paddingRight: view.frame.size.width * 0.1, height: 55)
        
        view.addSubview(usernameContainerView)
        usernameContainerView.anchor(left: view.leftAnchor, bottom: passwordContainerView.topAnchor, right: view.rightAnchor, paddingLeft: view.frame.size.width * 0.1, paddingBottom: 20, paddingRight: view.frame.size.width * 0.1, height: 55)
        
        view.addSubview(forgotPasswordBtn)
        forgotPasswordBtn.anchor(top: passwordContainerView.bottomAnchor, right: view.rightAnchor, paddingTop: 15, paddingRight: view.frame.size.width * 0.1)
        
        view.addSubview(loginBtn)
        loginBtn.anchor(top: forgotPasswordBtn.bottomAnchor, right: view.rightAnchor, paddingTop: 25, paddingRight: view.frame.size.width * 0.1)
        
        view.addSubview(logoImage)
        logoImage.centerX(inView: view)
        logoImage.anchor(left: view.leftAnchor, bottom: usernameContainerView.topAnchor, right: view.rightAnchor,paddingLeft: view.frame.size.width * 0.2,paddingBottom: 45,paddingRight: view.frame.size.width * 0.2, height: 90)
    }
    
    
}

