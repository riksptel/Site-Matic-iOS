//
//  UserProfileController.swift
//  Site Matic iOS
//
//  Created by Rachit Prajapati on 23/02/23.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let stackHeaderView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray2
        
        let icon = UIImageView().createIcon(dimension: 50, imageName: "")
        icon.backgroundColor = .red
        
        let headerLabel = UILabel()
        headerLabel.text = "User Details"
        headerLabel.textColor = .white
        headerLabel.font = UIFont.boldSystemFont(ofSize: 17)
    
        view.addSubview(icon)
        icon.centerY(inView: view)
        icon.anchor(left: view.leftAnchor, paddingLeft: 12)
        
        view.addSubview(headerLabel)
        headerLabel.centerY(inView: view)
        headerLabel.anchor(left: icon.rightAnchor, paddingLeft: 8)
        
        view.heightAnchor.constraint(equalToConstant: 65).isActive = true
        
        
        return view
    }()
    
    let emailContainerView: UIView = {
        let view = UIView().createCredentialsContainerView(iconDimension: 40, iconImageName: "", credentialTitle: "Email", credential: "app_user@email.com")
        return view
    }()
    
    let phoneContainerView: UIView = {
        let view = UIView().createCredentialsContainerView(iconDimension: 40, iconImageName: "", credentialTitle: "Mobile Number", credential: "987653210")
        return view
    }()
    
    let companyNameContainerView: UIView = {
        let view = UIView().createCredentialsContainerView(iconDimension: 40, iconImageName: "", credentialTitle: "Company Name", credential: "ASHOKA BUILDCON LTD.")
        return view
    }()
    
    lazy var credentialsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [stackHeaderView, emailContainerView, phoneContainerView, companyNameContainerView])
        stackView.axis = .vertical
        return stackView
    }()
    
    private let userStatusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "Director Operations"
        label.textColor = .white
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "App User"
        label.textColor = .white
        return label
    }()
    
    private let companyLogoView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .red
        return iv
    }()
    
    @objc func backButtonPressed() {
        self.navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()
    }
    
    private func setupUI() {
        addSubViews()
        
        companyLogoView.centerX(inView: view)
        companyLogoView.anchor(top: view.topAnchor, paddingTop: 50, width: 200, height: 125)
        
        statusLabel.centerX(inView: view)
        statusLabel.anchor(top: companyLogoView.bottomAnchor, paddingTop: 8)
        
        userStatusLabel.centerX(inView: view)
        userStatusLabel.anchor(top: statusLabel.bottomAnchor, paddingTop: 4)
        
        credentialsStackView.anchor(top: userStatusLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, height: 280)
        
        
        
        //customizing navigation bar
        let backButton = UIBarButtonItem(image: UIImage(named: "ProfileController_arrrow_left"), style: .plain, target: self, action: #selector(backButtonPressed))
        self.navigationItem.leftBarButtonItem = backButton
        self.navigationItem.title = "Profile"
        
        
    }

    func addSubViews() {
        view.addSubview(companyLogoView)
        view.addSubview(statusLabel)
        view.addSubview(userStatusLabel)
        view.addSubview(emailContainerView)
        view.addSubview(credentialsStackView)
    }
}

extension UIView {
    func createCredentialsContainerView(iconDimension: CGFloat, iconImageName: String, credentialTitle: String, credential: String) -> UIView {
        let view = UIView()
        view.backgroundColor = .mobaGray
        
        let icon = UIImageView().createIcon(dimension: iconDimension, imageName: iconImageName)
        icon.backgroundColor = .red
        
        let credentialTitleLabel = UILabel()
        credentialTitleLabel.text = credentialTitle
        credentialTitleLabel.textColor = .gray
        credentialTitleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        let credentialLabel = UILabel()
        credentialLabel.text = credential
        credentialLabel.textColor = .white
        credentialLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        let seperatorView = UIView()
        seperatorView.backgroundColor = .lightGray
        
        view.addSubview(icon)
        icon.centerY(inView: view)
        icon.anchor(left: view.leftAnchor, paddingLeft: 12)
        
        view.addSubview(credentialTitleLabel)
        credentialTitleLabel.anchor(top: view.topAnchor, left: icon.rightAnchor, paddingTop: 8, paddingLeft: 8)
        
        view.addSubview(credentialLabel)
        credentialLabel.anchor(top: credentialTitleLabel.bottomAnchor, left: icon.rightAnchor, paddingTop: 4, paddingLeft: 8)
        
        view.addSubview(seperatorView)
        seperatorView.anchor(top: credentialLabel.bottomAnchor, left: icon.rightAnchor, right: view.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingRight: 25, height: 0.5)
        
        view.heightAnchor.constraint(equalToConstant: 65).isActive = true
        
        return view
    }
}
