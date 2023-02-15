//
//  Extensions.swift
//  Site Matic iOS
//
//  Created by Rachit Prajapati on 10/02/23.
//

import UIKit


//Extension for simplifying constraint call.
// MARK: - UIView

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func center(inView view: UIView, yConstant: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yConstant!).isActive = true
    }
    
    func centerX(inView view: UIView, topAnchor: NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        if let topAnchor = topAnchor {
            self.topAnchor.constraint(equalTo: topAnchor, constant: paddingTop!).isActive = true
        }
    }
    
    func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil, paddingLeft: CGFloat? = nil, constant: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant!).isActive = true
        
        if let leftAnchor = leftAnchor, let padding = paddingLeft {
            self.leftAnchor.constraint(equalTo: leftAnchor, constant: padding).isActive = true
        }
    }
    
    func setDimensions(width: CGFloat, height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func addConstraintsToFillView(_ view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        anchor(top: view.topAnchor, left: view.leftAnchor,
               bottom: view.bottomAnchor, right: view.rightAnchor)
    }
    
    //blur on LoginController
    func addBlurToView() {
        var blurEffect: UIBlurEffect!
        blurEffect = UIBlurEffect(style: .dark)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.frame = self.bounds
        blurredEffectView.alpha = 0.7
        blurredEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurredEffectView)
    }
    
    
    func createContainer(image: UIImage?, textField: UITextField) -> UIView {
        
        let view = UIView()
        
        let backgroundImageView = UIImageView()
        backgroundImageView.image = UIImage(named: "white")
        backgroundImageView.layer.opacity = 0.1

        view.addSubview(backgroundImageView)
        backgroundImageView.anchor(top: view.topAnchor,left: view.leftAnchor,bottom: view.bottomAnchor, right: view.rightAnchor)
        
        let imageView = UIImageView()
        imageView.image = image
        view.addSubview(imageView)
        imageView.centerY(inView: view)
        imageView.anchor(right: view.rightAnchor,paddingRight: 20,width: 30,height: 30)
        
        view.addSubview(textField)
        textField.centerY(inView: view)
        textField.anchor(left: view.leftAnchor,bottom: view.bottomAnchor,right: imageView.leftAnchor,paddingLeft: 20,paddingRight: 3)
      

        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 25
        view.clipsToBounds = true

        
        return view
    }
    
}

// MARK: - UITextField


extension UITextField  {
    
    func createTextField(placeholder: String) -> UITextField {
        let tf = UITextField()
        tf.font = UIFont.systemFont(ofSize: 17)
        tf.textColor = .white
        tf.keyboardAppearance = .light
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.tintColor = .white
        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        tf.clipsToBounds = true
        return tf
    }
}

// MARK: - UIColor

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static let mobaGray = UIColor.rgb(red: 32, green: 32, blue: 32)
}

// MARK: - UIButton

extension UIView {
    func createDashboardButton(image: UIImage!, textColor: UIColor, iconDimension: CGFloat, text: String?, labelFont: UIFont) -> UIView {
        
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 26, green: 26, blue: 26)
        
        let iconView = UIImageView()
        iconView.contentMode = .scaleToFill
        iconView.setDimensions(width: iconDimension, height: iconDimension)
        iconView.image = image
        iconView.clipsToBounds = true
        
        view.addSubview(iconView)
        iconView.centerY(inView: view)
        iconView.anchor(left: view.leftAnchor, paddingLeft: 5)
        
        let label = UILabel()
        label.text = "1234"
        label.textColor = textColor
        label.font = labelFont
        
        view.addSubview(label)
        label.centerY(inView: view)
        label.anchor(left: iconView.rightAnchor, paddingLeft: 5)
        
        view.layer.cornerRadius = 4.0
        return view
    }
}
