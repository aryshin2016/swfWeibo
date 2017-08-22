//
//  RegistViewController.swift
//  WeiBoSwift
//
//  Created by itogame on 2017/8/22.
//  Copyright © 2017年 itogame. All rights reserved.
//

import UIKit

class RegistViewController: UIViewController {

    /// 国家区号
    @IBOutlet weak var countryNumber: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// 设置返回按钮的样式
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.plain, target: self, action: #selector(cancelRegist))
        navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.black], for: UIControlState.normal)
        
        /// 去掉默认导航栏底部黑线
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        /// 点击选择对应国家区号
        let countryNumberTap = UITapGestureRecognizer(target: self, action: #selector(countryNumberClick))
        countryNumber.addGestureRecognizer(countryNumberTap)
    }

    @objc private func cancelRegist() {
        // Dispose of any resources that can be recreated.
        navigationController?.dismiss(animated: true, completion: {
            
        })
    }
    
    @objc private func countryNumberClick() -> (){
        navigationController?.pushViewController(CountryTableViewController(), animated: true)
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
