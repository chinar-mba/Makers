//
//  LoginViewController.swift
//  Makers
//
//  Created by Chinara on 7/11/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let logoImage: UIImageView = {
        let view = UIImageView()
        let logoImage = UIImage(named: "Makers-logo")
        view.image = logoImage
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .black
        return view
    } ()
    
    private let loginButton: UIButton = {
        let view = UIButton()
        view.setTitle("Войти", for: .normal)
        view.setTitleColor(.blue, for: .normal)
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        return view
    } ()
    
    private let loginLabel: UILabel = {
        let view = UILabel()
        view.text = "Зарегистрироваться"
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 22)
        view.textColor = .blue
        let customFont = UIFont(name: "Poppins-Regular", size: 16.0)
        view.font = customFont
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
        view.addTarget(self, action: #selector(googleButtonPressed), for: .touchUpInside)
        return view
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUpConstraints()
        
    }
    
    private func setUpConstraints() {
        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoImage)
        view.addSubview(loginButton)
        view.addSubview(loginLabel)
        view.addSubview(lineImage)
        view.addSubview(googleButton)
        

        let topOffset: CGFloat = 0.2
        
        logoImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(topOffset / view.bounds.height)
            make.centerX.equalToSuperview()
            let logoWidthMultiplier: CGFloat = 0.8
            make.width.equalToSuperview().multipliedBy(logoWidthMultiplier)
            let logoAspectRatio: CGFloat = 92.0 / 68.93
            make.height.equalTo(logoImage.snp.width).multipliedBy(logoAspectRatio)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(logoImage.snp.width).multipliedBy(0.8)
            make.height.equalTo(loginButton.snp.width).multipliedBy(50.0 / 212.0)
        }
        
        loginLabel.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(36)
            make.centerX.equalToSuperview()
        }
        
        lineImage.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).offset(30)
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
    }
    
    @objc private func loginButtonPressed() {
        loginButton.backgroundColor = .blue
        loginButton.setTitleColor(.white, for: .normal)
        let nextVC = EmailLoginViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc private func googleButtonPressed() {
        googleButton.backgroundColor = .blue
        googleButton.setTitleColor(.white, for: .normal)
        let nextVC = GoogleLoginViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
