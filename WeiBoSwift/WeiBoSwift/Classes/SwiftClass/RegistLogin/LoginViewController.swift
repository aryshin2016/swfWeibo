//
//  LoginViewController.swift
//  WeiBoSwift
//
//  Created by itogame on 2017/8/22.
//  Copyright © 2017年 itogame. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /// 设置导航栏按钮的样式
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", style: UIBarButtonItemStyle.plain, target: self, action: #selector(cancelLogin))
        navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.black], for: UIControlState.normal)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "注册", style: UIBarButtonItemStyle.plain, target: self, action: #selector(regist))
        navigationItem.rightBarButtonItem?.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.black], for: UIControlState.normal)
        /// 去掉默认导航栏底部黑线
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
    }

   @objc private func cancelLogin() {
        navigationController?.dismiss(animated: true, completion: { 
            
        })
    }
    
    
    @objc private func regist(){
        
        let registVC = RootNavController(rootViewController: RegistViewController(nibName: "RegistViewController", bundle: nil))
        present(registVC, animated: true, completion: {
            
        })
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
