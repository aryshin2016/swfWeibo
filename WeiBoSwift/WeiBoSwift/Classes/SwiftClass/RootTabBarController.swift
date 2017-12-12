//
//  RootTabBarController.swift
//  WeiBoSwift
//
//  Created by itogame on 2017/8/15.
//  Copyright © 2017年 itogame. All rights reserved.
//

import UIKit

class RootTabBarController: UITabBarController {
    
    @objc lazy var plusBtn:UIButton = {
        
        let plusBtn = UIButton(imageName: "tabbar_compose_icon_add", backgroundImageName: "tabbar_compose_button", titleText: nil)
        plusBtn.addTarget(self, action: #selector(plusClicked(btn:)), for: UIControlEvents.touchUpInside)
        return plusBtn
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundImage = UIImage(named: "tabbar_background")
        tabBar.backgroundColor = UIColor(white: 1.0, alpha: 0.95)
        // 设置默认的黑色（不变灰）
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.black], for: UIControlState.normal)
        // 初始化UI.
        setupUI()
        // 设置代理，监听tabbarItem的点击跳转
        delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        /* 换成了在代理中控制
        // 禁止中间item的点击-如果写在viewWillAppear中有bug，切换多次后导致"消息"不能点击
        //tabBar.subviews[3].isUserInteractionEnabled = false
        */
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBar.tintColor = UIColor.black
        // tabbar的中间➕按钮
        creatThePlusBtn()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        // 调整中间➕按钮的位置
        // （bug）就算覆盖中间item的位置，却还是在右侧可以点击得到
        self.plusBtn.center.x = self.tabBar.bounds.width * CGFloat(0.5)
    }
    
    // MARK: - UI相关
    private func setupUI() -> () {
        //
        let weiboVC = WeiboTableViewController()
        self.creatOneChildVC(title: "微博", VC: weiboVC, imageName: "tabbar_home")
        //
        let msgVC = MsgTableViewController()
        self.creatOneChildVC(title: "消息", VC: msgVC, imageName: "tabbar_message_center")
        //
        let none = UIViewController()
        none.view.backgroundColor = UIColor.clear
        self.creatOneChildVC(title: "", VC: none, imageName: "")
        //
        let disVC = DisTableViewController(style:UITableViewStyle.plain)
        self.creatOneChildVC(title: "发现", VC: disVC, imageName: "tabbar_discover")
        //
        let meVC = MeTableViewController()
        self.creatOneChildVC(title: "我", VC: meVC, imageName: "tabbar_profile")
    }
    
    /// 创建子控制器
    private func creatOneChildVC(title:String, VC:UIViewController, imageName:String) ->(){
        VC.title = title
        // 设置图标不渲染（不变灰）
        VC.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        VC.tabBarItem.selectedImage = UIImage(named: imageName + "_selected")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        self.addChildViewController(RootNavController(rootViewController: VC))
    }

    /// 添加中部➕按钮
    private func creatThePlusBtn() -> (){
        
        tabBar.addSubview(plusBtn)
    }
    
    @objc private func plusClicked(btn:UIButton) -> (){
        
        let plusVC = PluseViewController()
        // 这样才能遮住tabbar
        plusVC.view.frame = UIScreen.main.bounds
        // MARK: 这样设置-主动present控制器的view不消失，有利于实现背景穿透效果
        plusVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        present(plusVC, animated: false, completion: {() ->() in
            ASLog("")
        })

    }
    
}

/// MARK : - UITabBarControllerDelegate
extension RootTabBarController : UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        // 禁止中间item的点击切换
        if viewController.isEqual(tabBarController.childViewControllers[2]) {
            ASLog(viewController)
            return false
        }else {
            return true
        }
    }
}
