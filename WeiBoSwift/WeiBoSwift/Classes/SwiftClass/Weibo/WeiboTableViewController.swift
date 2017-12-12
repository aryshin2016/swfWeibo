//
//  WeiboTableViewController.swift
//  WeiBoSwift
//
//  Created by itogame on 2017/8/15.
//  Copyright © 2017年 itogame. All rights reserved.
//

import UIKit

class WeiboTableViewController: BaseTableViewController {
    
    @objc lazy var scrollV : UIScrollView = {
        let scrollView : UIScrollView = UIScrollView(frame: self.view.bounds)
        scrollView.backgroundColor = UIColor.red
        scrollView.contentSize = CGSize(width: self.view.frame.size.width * 2, height: self.view.frame.size.height)
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        
        return scrollView
    }()
    
    @objc lazy var navCenterView : NavCenterView = {
        
        return NavCenterView(names : ["关注", "热门"])
    }()
    
    @objc lazy var menuViewController : MenuViewController = {
        return MenuViewController()
    }()
    
    @objc lazy var menuTableController : MenuTableController = {
        
        return MenuTableController(style: UITableViewStyle.plain)
    }()
    
    @objc lazy var coverWindow: UIWindow = {
       let frameT = CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
       let coverWindow = UIWindow(frame: frameT)
        coverWindow.backgroundColor = UIColor(white: 0.0, alpha: 0.05)
       let tap = UITapGestureRecognizer(target: self, action: #selector(coverClose))
        coverWindow.addGestureRecognizer(tap)
        return coverWindow
    }()
    
    @objc var isLogined : Bool = false
    @objc let duringP : Double = 0.2

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        automaticallyAdjustsScrollViewInsets = false
        // 添加scrollView
        view.addSubview(scrollV)
        scrollV.delegate = self
        
        // 添加导航栏按钮
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: UIBarButtonItemStyle.plain, target: self, action: #selector(regist))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: UIBarButtonItemStyle.plain, target: self, action: #selector(login))
        
        // 添加标题view 和设置代理
        navigationItem.titleView = navCenterView
        navCenterView.delegate = self
        
        UIApplication.shared.keyWindow?.addSubview(coverWindow)
        
        addChildViewController(menuViewController)
        view.addSubview(menuViewController.view)
        
        if isLogined {
            
        }else {
            let visitorVC = VisitorController(nibName: "VisitorController", bundle: nil)
            addChildViewController(visitorVC)
            visitorVC.view.frame = scrollV.bounds
            scrollV.addSubview(visitorVC.view)
        }
        
        addChildViewController(menuTableController)
        menuTableController.view.frame = CGRect(x: scrollV.bounds.size.width, y: 0, width: scrollV.bounds.size.width, height: scrollV.bounds.size.height)
        scrollV.addSubview(menuTableController.view)
        /// 设置默认滚动到最后一页，必须在内容添加完毕后设置（在初始化创建时设置不准确）
        scrollV.setContentOffset(CGPoint(x: scrollV.bounds.size.width, y: 0), animated: false)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        //TODO: - 这里若是不加延迟在Xcode9.2会导致Thread 1: signal SIGKILL
        DispatchQueue.main.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: UInt64(0.000001))) {
            
            self.menuViewController.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        }
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
    
}

// MARK: - UIScrollViewDelegate
extension WeiboTableViewController : UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let offX = scrollView.contentOffset.x
        if offX.isEqual(to: 0.0) {
            navCenterView.exchangeSelectedBtn(button :navCenterView.subviews[1] as! UIButton)
            navCenterView.arrowImage.isHidden = true
        }else {
            navCenterView.exchangeSelectedBtn(button :navCenterView.subviews.last as! UIButton)
            navCenterView.arrowImage.isHidden = false
        }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //ASLog(t: scrollView.contentOffset.x)
    }
    
}


/// MARK: - NavCenterViewDelegate
extension WeiboTableViewController : NavCenterViewDelegate {
    
    @objc func arrowRotation(navCenterView: NavCenterView, selectedBtn: UIButton, isShowMenu: Bool) {
        
        if isShowMenu == false {
            coverWindow.isHidden = true
            let textS = selectedBtn.titleLabel?.text
            if (textS?.isEqual("关注"))! {
                UIView.animate(withDuration: 0.0, animations: {
                    self.menuViewController.view.frame.origin.y = -(self.menuViewController.view.bounds.size.height)
                }, completion: { (finish) in
                    // 滚动到关注
                    self.scrollV.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
                    
                    self.navCenterView.exchangeSelectedBtn(button :selectedBtn)
                })
               
            }else {
                UIView.animate(withDuration: duringP, animations: {
                    self.menuViewController.view.frame.origin.y = -(self.menuViewController.view.bounds.size.height)
                }, completion: { (finish) in
                    // 滚动到菜单
                    self.scrollV.setContentOffset(CGPoint(x: self.scrollV.bounds.size.width, y: 0), animated: false)
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


