//
//  EmailLoginViewController.swift
//  Makers
//
//  Created by Chinara on 7/12/23.
//

import UIKit
import SnapKit

class EmailLoginViewController: UIViewController {
    
    private let logoImage: UIImageView = {
        let view = UIImageView()
        let logoImage = UIImage(named: "Makers-logo")
        view.image = logoImage
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .black
        return view
    } ()
    
    private let emailTextField: UITextField = {
        let view = UITextField()
        view.layer.cornerRadius = 10
        view.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.blue])
        view.backgroundColor = .white
        view.keyboardType = .emailAddress
        view.autocorrectionType = .no
        return view
    } ()
    
    private let passwordTextField: UITextField = {
        let view = UITextField()
        view.layer.cornerRadius = 10
        view.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.blue])
        view.backgroundColor = .white
        view.isSecureTextEntry = true
        return view
    } ()
    
    private let eyeButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        view.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        view.addTarget(self, action: #selector(eyeButtonTapped), for: .touchUpInside)
        return view
    } ()
    
    private let forgotPasswordButton: UIButton = {
        let view = UIButton()
        view.setTitle("Забыл пароль", for: .normal)
        view.setTitleColor(.blue, for: .normal)
        view.backgroundColor = .clear
        return view
    } ()
    
    private let loginButton: UIButton = {
        let view = UIButton()
        view.setTitle("Войти", for: .normal)
        view.setTitleColor(.blue, for: .normal)
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        //    view.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        return view
    } ()
    
    private let lineImage: UIImageView = {
        let view = UIImageView()
        let lineImage = UIImage(named: "Lines")
        view.image = lineImage
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .black
        return view
    } ()
    
    private let googleButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.setTitle("Войти через Google", for: .normal)
        view.setImage(UIImage(named: "ButtonGoogle"), for: .normal)
        view.setTitleColor(.blue, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        view.contentHorizontalAlignment = .left
        view.imageEdgeInsets = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 0)
        view.titleEdgeInsets = UIEdgeInsets(top: 0, left: 80, bottom: 0, right: 0)
        view.contentVerticalAlignment = .center
        //  view.addTarget(self, action: #selector(googleButtonPressed), for: .touchUpInside)
        return view
    } ()
    
    private let registerGoogleButton: UIButton = {
        let view = UIButton()
        view.setTitle("Зарегистрироваться", for: .normal)
        view.setTitleColor(.blue, for: .normal)
        view.backgroundColor = .clear
        return view
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUpConstraints()
        
    }
    
    private func setUpConstraints() {
        
        view.addSubview(logoImage)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(eyeButton)
        view.addSubview(forgotPasswordButton)
        view.addSubview(loginButton)
        view.addSubview(lineImage)
        view.addSubview(googleButton)
        
        let topOffset: CGFloat = 0.2
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(topOffset / view.bounds.height)
            make.centerX.equalToSuperview()
            let logoWidthMultiplier: CGFloat = 0.8
            make.width.equalToSuperview().multipliedBy(logoWidthMultiplier)
            let logoAspectRatio: CGFloat = 92.0 / 68.93
            make.height.equalTo(logoImage.snp.width).multipliedBy(logoAspectRatio)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            let logoWidthMultiplier: CGFloat = 0.8
            make.width.equalToSuperview().multipliedBy(logoWidthMultiplier)
            let logoAspectRatio: CGFloat = 50.0 / 308.0
            make.height.equalTo(emailTextField.snp.width).multipliedBy(logoAspectRatio)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            let logoWidthMultiplier: CGFloat = 0.8
            make.width.equalToSuperview().multipliedBy(logoWidthMultiplier)
            let logoAspectRatio: CGFloat = 50.0 / 308.0
            make.height.equalTo(passwordTextField.snp.width).multipliedBy(logoAspectRatio)
            passwordTextField.rightView = eyeButton
            passwordTextField.rightViewMode = .always
        }
        
//        forgotPasswordButton.snp.makeConstraints { make in
//            make.top.equalTo(passwordTextField.snp.bottom).offset(5)
//            make.trailing.equalToSuperview()
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(logoImage.snp.width).multipliedBy(0.8)
            make.height.equalTo(loginButton.snp.width).multipliedBy(50.0 / 212.0)
        }
        
        lineImage.snp.makeConstraints { make in
            make.top.equalTo(forgotPasswordButton.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            let logoWidthMultiplier: CGFloat = 0.8
            make.width.equalToSuperview().multipliedBy(logoWidthMultiplier)
            let logoAspectRatio: CGFloat = 22.0 / 308.0
            make.height.equalTo(logoImage.snp.width).multipliedBy(logoAspectRatio)
        }
        
        googleButton.snp.makeConstraints { make in
            make.top.equalTo(lineImage.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            let widthMultiplier: CGFloat = 0.8
            make.width.equalToSuperview().multipliedBy(widthMultiplier)
            make.height.equalTo(googleButton.snp.width).multipliedBy(50.0 / 308.0)
        }
        
        forgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(5)
            make.trailing.equalToSuperview()
        }
        
    }
    
    @objc private func eyeButtonTapped() {
        passwordTextField.isSecureTextEntry.toggle()
        eyeButton.isSelected = !passwordTextField.isSecureTextEntry
    }
    
}
