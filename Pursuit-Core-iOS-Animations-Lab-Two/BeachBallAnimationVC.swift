//
//  ViewController.swift
//  Pursuit-Core-iOS-Animations-Lab-Two
//
//  Created by Mr Wonderful on 10/15/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

class BeachBallAnimationVC: UIViewController {
    
    enum  BallName:String{
        case beachBall
    }
    
    var onOrOffArray:[Bool] = [true,true,true,true]
    
    //MARK: -- ball Images
    lazy var firstBallImage:UIImageView = {
        let image = UIImageView(imageName: BallName.beachBall.rawValue)
        return image
    }()
    
    lazy var secondBallImage:UIImageView = {
        let image = UIImageView(imageName:  BallName.beachBall.rawValue)
        return image
    }()
    
    lazy var thirdBallImage:UIImageView = {
        let image = UIImageView(imageName:  BallName.beachBall.rawValue)
        return image
    }()
    
    lazy var fourthBallImage:UIImageView = {
        let image = UIImageView(imageName:  BallName.beachBall.rawValue)
        return image
    }()
    //MARK: -- Buttons
    
    lazy var linearButton:UIButton = {
        let button = UIButton(buttonName: "Linear")
        button.addTarget(self, action: #selector(handleLinearButton), for: .touchUpInside)
        return button
    }()
    
    lazy var easeInButton:UIButton = {
        let button = UIButton(buttonName: "easeIn")
        button.addTarget(self, action: #selector(handleEaseInButton), for: .touchUpInside)
        return button
    }()
    
    lazy var easeOutButton:UIButton = {
        let button = UIButton(buttonName: "easeOut")
        button.addTarget(self, action: #selector(handleEaseOutButton), for: .touchUpInside)
        return button
    }()
    
    lazy var easeInEaseOutButton:UIButton = {
        let button = UIButton(buttonName: "easeInEaseOut")
        button.addTarget(self, action: #selector(handleEaseInEaseOutButton), for: .touchUpInside)
        return button
    }()
    
    lazy var resetButton:UIButton = {
        let button = UIButton(buttonName: "Reset")
        button.addTarget(self, action: #selector(handleResetButton), for: .touchUpInside)
        return button
    }()
    
    lazy var animateButton:UIButton = {
        let button = UIButton(buttonName: "Animate")
        button.addTarget(self, action: #selector(handleAnimateButton), for: .touchUpInside)
        return button
    }()
    
    lazy var topButtonStackView:UIStackView = {
            let stackview = UIStackView(arrangedSubviews: [linearButton,easeInButton,easeOutButton,easeInEaseOutButton])
            stackview.axis = .horizontal
            stackview.distribution = .fillProportionally
            stackview.alignment = .fill
            stackview.spacing = 5
            stackview.translatesAutoresizingMaskIntoConstraints = false
            return stackview
    }()
    
    lazy var buttomButtonStackView:UIStackView = {
            let stackview = UIStackView(arrangedSubviews: [resetButton, animateButton])
            stackview.axis = .horizontal
            stackview.distribution = .fillProportionally
            stackview.alignment = .fill
            stackview.spacing = 5
            stackview.translatesAutoresizingMaskIntoConstraints = false
            return stackview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addToSubView()
        constrainTopButtonStackView()
        constrainButtomButtonStackView()
        imageConstraints()
    }
    
    private func turnOnOrOff(index:Int){
        onOrOffArray[index] = onOrOffArray[index] ? false : true
    }
    
    
    @objc func handleLinearButton(){
        turnOnOrOff(index: 0)
        if onOrOffArray[0] == false{
            firstBallImage.isHidden = true
        }else{
            firstBallImage.isHidden = false
        }
    }
    
    @objc func handleEaseInButton(){
        turnOnOrOff(index: 1)
     secondBallImage.isHidden =  !onOrOffArray[1]
    }
    
    @objc func handleEaseOutButton(){
        turnOnOrOff(index: 2)
     thirdBallImage.isHidden =  onOrOffArray[2] == false
    }
    
    @objc func handleEaseInEaseOutButton(){
        turnOnOrOff(index: 3)
        fourthBallImage.isHidden =  !onOrOffArray[3] ? true : false
    
    }
    
    @objc func handleResetButton(){
        UIView.animate(withDuration: 1.2) {
            self.firstBallImage.center.y = 131.0
            self.secondBallImage.center.y = 131.0
            self.thirdBallImage.center.y = 131.0
            self.fourthBallImage.center.y = 131.0
        }
      
    }
    
    @objc func handleAnimateButton(){
        if onOrOffArray[0] == true{
            UIView.animate(withDuration: 2.0, delay: 0, options: .curveLinear, animations: {
                self.firstBallImage.center = CGPoint(x: self.firstBallImage.center.x , y: self.firstBallImage.center.y + 700)
                print(self.firstBallImage.center.y)
            }, completion: nil)
        }
         if onOrOffArray[1] == true{
            UIView.animate(withDuration: 2.0, delay: 0, options: .curveEaseIn, animations: {
                self.secondBallImage.center = CGPoint(x: self.secondBallImage.center.x , y: self.secondBallImage.center.y + 700)
                print(self.secondBallImage.center.y)
            }, completion: nil)
        }
         if onOrOffArray[2] == true{
            UIView.animate(withDuration: 2.0, delay: 0, options: .curveEaseOut, animations: {
                self.thirdBallImage.center = CGPoint(x: self.thirdBallImage.center.x , y: self.thirdBallImage.center.y + 700)
                print(self.thirdBallImage.center.y)
            }, completion: nil)
        }
        
         if onOrOffArray[3] == true{
            UIView.animate(withDuration: 2.0, delay: 0, options: .curveEaseInOut, animations: {
                self.fourthBallImage.center = CGPoint(x: self.fourthBallImage.center.x , y: self.fourthBallImage.center.y + 700)
                print(self.fourthBallImage.center.y)
            }, completion: nil)
        }
    }
    
   private func addToSubView() {
        self.view.addSubview(topButtonStackView)
        self.view.addSubview(buttomButtonStackView)
        self.view.addSubview(firstBallImage)
        self.view.addSubview(secondBallImage)
        self.view.addSubview(thirdBallImage)
        self.view.addSubview(fourthBallImage)
    }
    private func constrainTopButtonStackView() {
        topButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([topButtonStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),topButtonStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),topButtonStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)])
    }
    
   private func constrainButtomButtonStackView(){
        buttomButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([buttomButtonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20),buttomButtonStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),buttomButtonStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)])
    }
    
   private func imageConstraints() {
        firstBallImage.centerXAnchor.constraint(equalTo: linearButton.centerXAnchor).isActive = true
        firstBallImage.centerYAnchor.constraint(equalTo: linearButton.centerYAnchor, constant: 50).isActive = true
        secondBallImage.centerXAnchor.constraint(equalTo: easeInButton.centerXAnchor).isActive = true
        secondBallImage.centerYAnchor.constraint(equalTo: easeInButton.centerYAnchor, constant: 50).isActive = true
        thirdBallImage.centerXAnchor.constraint(equalTo: easeOutButton.centerXAnchor).isActive = true
        thirdBallImage.centerYAnchor.constraint(equalTo: easeOutButton.centerYAnchor, constant: 50).isActive = true
        fourthBallImage.centerXAnchor.constraint(equalTo: easeInEaseOutButton.centerXAnchor).isActive = true
        fourthBallImage.centerYAnchor.constraint(equalTo: easeInEaseOutButton.centerYAnchor, constant: 50).isActive = true
    }
}



