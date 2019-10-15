//
//  Extention-Labels.swift
//  Pursuit-Core-iOS-Animations-Lab-Two
//
//  Created by Mr Wonderful on 10/15/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

extension UIButton{
    public convenience init(buttonName:String){
        self.init()
        self.setTitle(buttonName, for: .normal)
        self.setTitleColor(.blue, for: .normal)
    }
}

