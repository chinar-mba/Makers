//
//  SplashViewController.swift
//  Makers
//
//  Created by Chinara on 7/11/23.
//

import UIKit
import SnapKit

class SplashViewController: UIViewController {
    
    private let progressView = UIProgressView(progressViewStyle: .default)
    
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
    
    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
           configureProgressView()
           startProgress()
       }
    
    private func configureProgressView() {
            progressView.progressTintColor = .blue
            progressView.trackTintColor = .white
            progressView.progress = 0.5
        }
    
    private func setUpConstraints() {
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoImage)
        
        let topOffSet: CGFloat = 0.2
        logoImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(topOffSet * view.bounds.height)
            make.centerX.equalToSuperview()
            let logoWidthMultiplier: CGFloat = 0.8
            make.width.equalToSuperview().multipliedBy(logoWidthMultiplier)
            let logoAspectRatio: CGFloat = 92.0 / 68.93
            make.height.equalTo(logoImage.snp.width).multipliedBy(logoAspectRatio)
        }
        
        view.addSubview(progressView)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(1)
            make.centerX.equalToSuperview()
            let progressWidthMultiplier: CGFloat = 0.8
            let progressHeightMultiplier: CGFloat = 6.0 / 302.0
            make.width.equalToSuperview().multipliedBy(progressWidthMultiplier)
            make.height.equalTo(progressView.snp.width).multipliedBy(progressHeightMultiplier)
        }
    
    }
    
    
    func startProgress() {
           progressView.progress = 0.0
           UIView.animate(withDuration: 3.0, animations: {
               self.progressView.progress = 1.0
           }) { _ in
               self.navigateToNextScreen()
           }
       }
       
       func navigateToNextScreen() {
           let nextVC = LoginViewController()
           self.present(nextVC, animated: true, completion: nil)
           
        }

}
