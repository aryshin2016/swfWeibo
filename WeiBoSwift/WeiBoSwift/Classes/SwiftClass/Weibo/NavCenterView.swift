//
//  NavCenterView.swift
//  WeiBoSwift
//
//  Created by itogame on 2017/8/17.
//  Copyright © 2017年 itogame. All rights reserved.
//

import UIKit

class NavCenterView: UIView {

    convenience init(names: [String]) {
        self.init()
        backgroundColor = UIColor.clear
        for i in 0 ..< names.count {
           let btn = UIButton(text: names[i])
            addSubview(btn!)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        for i in 0 ..< subviews.count {
            let btn = subviews[i]
            if i > 0 {
                /// 第二个开始右移一倍间距
                btn.frame.origin.x = CGFloat(i + 1) * btn.bounds.width
                /// 调整自身尺寸为内容大小
                bounds = CGRect(x: 0, y: 0, width: btn.frame.maxX, height: btn.bounds.size.height)
            }
        }
    }
    
    

}
