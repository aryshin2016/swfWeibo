//
//  UIButton+Image.swift
//  WeiBoSwift
//
//  Created by itogame on 2017/8/16.
//  Copyright © 2017年 itogame. All rights reserved.
//

import UIKit

extension UIButton {
   @objc convenience  init(imageName : String, backgroundImageName : String, titleText : String?){
        self.init()
    
    setImage(UIImage(named: imageName), for: UIControlState.normal)
    setImage(UIImage(named: imageName + "_highlighted"), for: UIControlState.highlighted)
    setImage(UIImage(named: imageName + "_selected"), for: UIControlState.selected)
    
    setBackgroundImage(UIImage(named: backgroundImageName), for: UIControlState.normal)
    setBackgroundImage(UIImage(named: backgroundImageName + "_highlighted"), for: UIControlState.highlighted)
    setBackgroundImage(UIImage(named: backgroundImageName + "_selected"), for: UIControlState.selected)
    
    setTitle(titleText, for: UIControlState.normal)
    
    sizeToFit()
    
    }
}
