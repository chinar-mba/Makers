//
//  PasswordNotificationViewController.swift
//  Makers
//
//  Created by Chinara on 7/13/23.
//

import UIKit

class PasswordNotificationViewController: UIViewController {
    
    private let logoImage: UIImageView = {
        let view = UIImageView()
        let logoImage = UIImage(named: "Makers-logo")
        view.image = logoImage
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .black
        return view
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUpConstraints()
        
    }
    
    private func setUpConstraints() {
        
        view.addSubview(logoImage)
        
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
    }
}



