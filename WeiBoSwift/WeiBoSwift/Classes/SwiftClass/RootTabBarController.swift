//
//  RootTabBarController.swift
//  WeiBoSwift
//
//  Created by itogame on 2017/8/15.
//  Copyright © 2017年 itogame. All rights reserved.
//

import UIKit

class RootTabBarController: UITabBarController {
    
    lazy var plusBtn:UIButton = {
        
        let plusBtn = UIButton(imageName: "tabbar_compose_icon_add", backgroundImageName: "tabbar_compose_button", titleText: nil)
        plusBtn.addTarget(self, action: #selector(plusClicked(btn:)), for: UIControlEvents.touchUpInside)
        return plusBtn
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置默认的黑色（不变灰）
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.black], for: UIControlState.normal)
        // 初始化UI.
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 禁止中间item的点击-如果写在viewWillAppear中有bug，切换多次后导致"消息"不能点击
        tabBar.subviews[3].isUserInteractionEnabled = false
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBar.tintColor = UIColor.black
        
        // tabbar的中间➕按钮
        self.creatThePlusBtn()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        // 调整中间➕按钮的位置
        self.plusBtn.frame = tabBar.subviews[3].frame // （bug）就算覆盖中间item的位置，却还是在右侧可以点击得到
        //self.plusBtn?.center.x = self.tabBar.bounds.width * CGFloat(0.5)
    }
    
    // MARK: - UI相关
    private func setupUI() -> () {
        //
        let weiboVC = WeiboTableViewController(style: UITableViewStyle.plain)
        self.creatOneChildVC(title: "微博", VC: weiboVC, imageName: "tabbar_home")
        //
        let msgVC = MsgTableViewController(style: UITableViewStyle.plain)
        self.creatOneChildVC(title: "消息", VC: msgVC, imageName: "tabbar_message_center")
        //
        let none = UIViewController()
        none.view.backgroundColor = UIColor.clear
        self.creatOneChildVC(title: "", VC: none, imageName: "")
        //
        let disVC = DisTableViewController(style:UITableViewStyle.plain)
        self.creatOneChildVC(title: "发现", VC: disVC, imageName: "tabbar_discover")
        //
        let meVC = MeTableViewController(style: UITableViewStyle.plain)
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
        
        self.tabBar.addSubview(plusBtn)
    }
    
    @objc private func plusClicked(btn:UIButton) -> (){
        ASLog(t: "ninhao")
        let plusVC = PluseViewController()
        // 这样才能遮住tabbar
        plusVC.view.frame = UIScreen.main.bounds
        present(plusVC, animated: false, completion: {() ->() in
            ASLog(t: "")
        })

    }

}
