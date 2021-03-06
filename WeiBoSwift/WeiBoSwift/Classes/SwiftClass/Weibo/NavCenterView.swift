//
//  NavCenterView.swift
//  WeiBoSwift
//
//  Created by itogame on 2017/8/17.
//  Copyright © 2017年 itogame. All rights reserved.
//

import UIKit

protocol NavCenterViewDelegate: NSObjectProtocol {
    func arrowRotation(navCenterView : NavCenterView, selectedBtn :UIButton, isShowMenu : Bool) -> Void
}

class NavCenterView: UIView {
    
    @objc let duringT :Double = 0.2
    
    weak var delegate : NavCenterViewDelegate?
    
    @objc var isShowMenu :Bool = false
    
    /// 选中按钮
    @objc var selBtn : UIButton? = nil
    /// 箭头
    @objc lazy var arrowImage :UIImageView = {
        return UIImageView(image: UIImage(named: "navigationbar_arrow_down_new"))
    }()

    @objc convenience init(names: [String]) {
        self.init()
        addSubview(arrowImage)
        backgroundColor = UIColor.clear
        for i in 0 ..< names.count {
           let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 37, height: 21))
            btn.setTitle(names[i], for: UIControlState.normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            btn.setTitleColor(UIColor.gray, for: UIControlState.normal)
            btn.setTitleColor(UIColor.black, for: UIControlState.selected)
            btn.addTarget(self, action: #selector(btnClicked(button:)), for: UIControlEvents.touchDown)
            addSubview(btn)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        for i in 0 ..< subviews.count {
            let btn = subviews[i]  as? UIButton
            if i > 1 {
                
                /// 第二个开始右移一倍间距
                btn?.frame.origin.x = CGFloat(i) * (btn?.bounds.width)!
                /// 调整自身尺寸为内容大小
                bounds = CGRect(x: 0, y: 0, width: (btn?.frame.maxX)!, height: (btn?.bounds.size.height)!)
                /// 默认选中热门按钮
                btn?.isSelected = true
                selBtn = btn
            }
        }
        arrowImage.center = CGPoint(x: bounds.size.width + 5, y: bounds.size.height * 0.5)
    }
    /// 热门按钮的点击事件
    @objc private func btnClicked(button:UIButton) -> (){
        
        let btnTit = button.titleLabel?.text
        
        if (btnTit?.isEqual("热门"))! && button.isSelected == true {
            self.isShowMenu = !isShowMenu
            // 响应箭头旋转

            UIView.animate(withDuration: duringT, animations: {
                self.arrowImage.layer.transform = CATransform3DRotate(self.arrowImage.layer.transform, CGFloat(Double.pi), 0, 0, 1)
            }, completion: { (finish) in
            })
            // 响应下拉菜单
            delegate?.arrowRotation(navCenterView: self, selectedBtn: button, isShowMenu: isShowMenu)
            
        }else if (btnTit?.isEqual("热门"))! && button.isSelected == false {
            UIView.animate(withDuration: 0.0, animations: { 
                self.arrowImage.layer.transform = CATransform3DIdentity
            }, completion: { (finish) in
                self.isShowMenu = false
                self.arrowImage.isHidden = false
                self.exchangeSelectedBtn(button: button)
            })
            delegate?.arrowRotation(navCenterView: self, selectedBtn: button, isShowMenu: false)
        }else if (btnTit?.isEqual("关注"))! && button.isSelected == false {
            UIView.animate(withDuration: 0.0, animations: { 
                self.arrowImage.layer.transform = CATransform3DIdentity
                
            }, completion: { (finish) in
                
                self.arrowImage.isHidden = true
                self.exchangeSelectedBtn(button: button)
            })
            delegate?.arrowRotation(navCenterView: self, selectedBtn: button, isShowMenu: false)
        }else if (btnTit?.isEqual("关注"))! && button.isSelected == true {
            arrowImage.layer.transform = CATransform3DIdentity
            arrowImage.isHidden = true
            exchangeSelectedBtn(button: button)
            delegate?.arrowRotation(navCenterView: self, selectedBtn: button, isShowMenu: false)
        }
        
    }
    /// 切换选中按钮
    @objc public func exchangeSelectedBtn(button: UIButton) ->(){
        selBtn?.isSelected = false
        selBtn = button
        selBtn?.isSelected = !button.isSelected
        
    }

}
