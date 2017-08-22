//
//  RLButton.swift
//  WeiBoSwift
//
//  Created by itogame on 2017/8/22.
//  Copyright © 2017年 itogame. All rights reserved.
//

import UIKit

class RLButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        sizeToFit()
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView?.frame.origin.y = -8
        imageView?.center.x = bounds.size.width * 0.5
        
        titleLabel?.center.x = (imageView?.center.x)!
        titleLabel?.frame.origin.y = bounds.size.height - 5
        sizeToFit()
    }

}
