//
//  ViewController.swift
//  Arduino-Remote
//
//  Created by timofey makhlay on 6/26/19.
//  Copyright © 2019 Timofey Makhlay. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var motorText: UITextView = {
        var title = UITextView()
        title.text = "motor"
        title.font = UIFont(name: "AvenirNext-Bold", size: UIScreen.main.bounds.height / 28) // Size to make it scalable (supposed to be around 33 onn iphone x)
        title.textColor = #colorLiteral(red: 0.0774943307, green: 0.1429743171, blue: 0.290320158, alpha: 1)
        title.backgroundColor = nil
        title.textAlignment = .center
        title.isEditable = false
        title.isScrollEnabled = false
        title.isSelectable = false
        return title
    }()
    
    var rocketshipText: UITextView = {
        var title = UITextView()
        title.text = "🚀"
        title.font = UIFont(name: "AvenirNext-Bold", size: UIScreen.main.bounds.height / 5) // Size to make it scalable (supposed to be around 33 onn iphone x)
        title.textColor = #colorLiteral(red: 0.0774943307, green: 0.1429743171, blue: 0.290320158, alpha: 1)
        title.backgroundColor = nil
        title.textAlignment = .center
        title.isEditable = false
        title.isScrollEnabled = false
        title.isSelectable = false
        return title
    }()
    
    private let forwardButton: UIButton = {
        let button = UIButton()
        button.setTitle("forward", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.9996390939, green: 1, blue: 0.9997561574, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: UIScreen.main.bounds.height / 30)
        button.addTarget(self, action: #selector(forwardButtonDone), for: .touchUpInside)
        button.addTarget(self, action: #selector(forwardButtonPressed), for: .touchDown)
        button.backgroundColor = #colorLiteral(red: 0.0774943307, green: 0.1429743171, blue: 0.290320158, alpha: 1)
        button.layer.shadowColor = #colorLiteral(red: 0.503008008, green: 0.5034076571, blue: 0.5030698776, alpha: 1)
        button.layer.shadowOpacity = 0.8
        button.layer.shadowRadius = 2.5
        button.layer.shadowOffset = CGSize(width: 11, height: 11)
        return button
    }()
    
    private let backwardButton: UIButton = {
        let button = UIButton()
        button.setTitle("backward", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.9996390939, green: 1, blue: 0.9997561574, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: UIScreen.main.bounds.height / 30)
        //        button.addTarget(self, action: #selector(returnButtonPressed), for: .touchUpInside)
        button.backgroundColor = #colorLiteral(red: 0.0774943307, green: 0.1429743171, blue: 0.290320158, alpha: 1)
        button.layer.shadowColor = #colorLiteral(red: 0.503008008, green: 0.5034076571, blue: 0.5030698776, alpha: 1)
        button.layer.shadowOpacity = 0.8
        button.layer.shadowRadius = 2.5
        button.layer.shadowOffset = CGSize(width: 11, height: 11)
        return button
    }()
    
    
    let motorContainer: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9996390939, green: 1, blue: 0.9997561574, alpha: 1)
//        view.layer.cornerRadius = 30
        view.layer.shadowColor = #colorLiteral(red: 0.503008008, green: 0.5034076571, blue: 0.5030698776, alpha: 1)
        view.layer.shadowOpacity = 0.2
        view.layer.shadowRadius = 5
        view.layer.shadowOffset = CGSize(width: 18.0, height: 14.0)
        return view
    }()
    
    let rocketshipShadow: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.503008008, green: 0.5034076571, blue: 0.5030698776, alpha: 1)
        view.layer.cornerRadius = 30
        view.layer.shadowOpacity = 0.0001
        view.layer.shadowRadius = 5
        view.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        return view
    }()
    
    var forwardBeingPressed = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupLayout()
    }
    
    func setupLayout() {
        // TODO: Make this funtion run on main thread and everything else on a separete concurrent thread
        view.backgroundColor = #colorLiteral(red: 0.9074793458, green: 0.9047083855, blue: 0.9075832963, alpha: 1)
        view.addSubview(motorContainer)
        view.addSubview(motorText)
        view.addSubview(rocketshipText)

        
        motorContainer.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(view.bounds.height / 10)
            make.centerX.equalTo(view)
            make.height.equalTo(view.bounds.height / 2.73)
            make.width.equalTo(view.bounds.width / 1.3)
        }

        motorContainer.layer.cornerRadius = view.bounds.height / 14

        motorText.snp.makeConstraints { (make) in
            make.top.equalTo(motorContainer).offset(view.bounds.height / 22.75)
            make.centerX.equalTo(motorContainer)
        }
//        print("Font size: ", motorText.font)
        
        let buttonStack = UIStackView(arrangedSubviews: [forwardButton, backwardButton])
        buttonStack.axis = .vertical
        buttonStack.distribution = .equalSpacing
        
        view.addSubview(buttonStack)
        buttonStack.snp.makeConstraints { (make) in
            make.top.equalTo(motorText.snp.bottom).offset(view.bounds.height / 60)
            make.bottom.equalTo(motorContainer).offset(-1 * (view.bounds.height / 18))
            make.centerX.equalTo(motorContainer)
            make.width.equalTo(motorContainer).multipliedBy(0.7)
        }
        
        forwardButton.snp.makeConstraints { (make) in
            make.height.equalTo(motorContainer).multipliedBy(0.2)
        }
        
        backwardButton.snp.makeConstraints { (make) in
            make.height.equalTo(motorContainer).multipliedBy(0.2)
        }
        forwardButton.layer.cornerRadius = view.bounds.height / 28
        backwardButton.layer.cornerRadius = view.bounds.height / 28

        
        rocketshipText.snp.makeConstraints { (make) in
            make.top.equalTo(motorContainer.snp.bottom).offset(view.bounds.height / 8)
            make.centerX.equalTo(view)
        }
        
        
    }
    
    @objc func forwardButtonDone() {
        print("Button unpressed")
        forwardBeingPressed = false
        rocketshipText.layer.removeAllAnimations()
    }
    
    
    @objc func forwardButtonPressed() {
        print("Button pressed")
        forwardBeingPressed = true
        rocketshipText.rotate360Degrees()
    }


}

extension UIView {
    func rotate360Degrees(duration: CFTimeInterval = 3) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(Double.pi * 2)
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount=Float.infinity
        self.layer.add(rotateAnimation, forKey: nil)
    }
}
