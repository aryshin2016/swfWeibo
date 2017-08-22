//
//  WeiboTableViewController.swift
//  WeiBoSwift
//
//  Created by itogame on 2017/8/15.
//  Copyright © 2017年 itogame. All rights reserved.
//

import UIKit

class WeiboTableViewController: BaseTableViewController {
    
    lazy var navCenterView : NavCenterView = {
        
        return NavCenterView(names : ["关注", "热门"])
    }()
    
    lazy var menuViewController : MenuViewController = {
        return MenuViewController()
    }()
    
    lazy var coverWindow: UIWindow = {
       let frameT = CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
       let coverWindow = UIWindow(frame: frameT)
        coverWindow.backgroundColor = UIColor(white: 0.0, alpha: 0.05)
       let tap = UITapGestureRecognizer(target: self, action: #selector(coverClose))
        coverWindow.addGestureRecognizer(tap)
        return coverWindow
    }()
    
    var isPresent : Bool?
    let duringP : Double = 0.2

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        UIApplication.shared.keyWindow?.addSubview(coverWindow)
        
        addChildViewController(menuViewController)
        view.addSubview(menuViewController.view)
        
    }
    
    override func loadView() {
        super.loadView()
        // 添加导航栏按钮
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: UIBarButtonItemStyle.plain, target: self, action: #selector(regist))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: UIBarButtonItemStyle.plain, target: self, action: #selector(login))
        
        // 添加标题view 和设置代理
        navigationItem.titleView = navCenterView
        navCenterView.delegate = self
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        menuViewController.view.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height)
        menuViewController.view.frame.origin.y = -(menuViewController.view.bounds.size.height)
        
    }
    
    @objc private func coverClose(tapG:UITapGestureRecognizer) -> (){
        coverWindow.isHidden = true
        UIView.animate(withDuration: duringP, animations: {
            self.menuViewController.view.frame.origin.y = -(self.menuViewController.view.bounds.size.height)
            self.navCenterView.arrowImage.layer.transform = CATransform3DIdentity
        }, completion: { (finish) in
            self.navCenterView.isShowMenu = false
        })
    }
    
    @objc private func regist(){
        
        let registVC = RootNavController(rootViewController: RegistViewController(nibName: "RegistViewController", bundle: nil))
        present(registVC, animated: true, completion: {
            
        })
        
    }
    
    @objc private func login(){
        let loginVC = RootNavController(rootViewController: LoginViewController(nibName: "LoginViewController", bundle: nil))
        present(loginVC, animated: true, completion: {
            
        })
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}

/// MARK: - NavCenterViewDelegate
extension WeiboTableViewController : NavCenterViewDelegate {
    
    func arrowRotation(navCenterView: NavCenterView, selectedBtn: UIButton, isShowMenu: Bool) {
        self.isPresent = isShowMenu
        ASLog(t: isShowMenu)
        
        if isShowMenu == false {
            coverWindow.isHidden = true
            let textS = selectedBtn.titleLabel?.text
            if (textS?.isEqual("关注"))! {
                UIView.animate(withDuration: 0.0, animations: {
                    self.menuViewController.view.frame.origin.y = -(self.menuViewController.view.bounds.size.height)
                }, completion: { (finish) in
                    
                    self.navCenterView.exchangeSelectedBtn(button :selectedBtn)
                })
               
            }else {
                UIView.animate(withDuration: duringP, animations: {
                    self.menuViewController.view.frame.origin.y = -(self.menuViewController.view.bounds.size.height)
                }, completion: { (finish) in
                    
                })
            }
            
        }else {
            UIView.animate(withDuration: duringP, animations: {
                self.coverWindow.frame.origin.y = self.menuViewController.view.bounds.size.height + 64
                self.menuViewController.view.frame.origin.y = 0
            }, completion: { (finish) in
                self.coverWindow.isHidden = false
                
            })
        }
    }

}


