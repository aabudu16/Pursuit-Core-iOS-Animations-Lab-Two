//
//  Extention-UIImage.swift
//  Pursuit-Core-iOS-Animations-Lab-Two
//
//  Created by Mr Wonderful on 10/15/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import Foundation

import UIKit

extension UIImageView{
    public convenience init(imageName:String){
        self.init()
        self.image = UIImage(named: imageName)
        self.contentMode = .scaleAspectFit
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 80).isActive = true
        self.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
}
