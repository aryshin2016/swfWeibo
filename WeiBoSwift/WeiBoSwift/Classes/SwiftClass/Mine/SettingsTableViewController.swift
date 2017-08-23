//
//  SettingsTableViewController.swift
//  WeiBoSwift
//
//  Created by itogame on 2017/8/17.
//  Copyright © 2017年 itogame. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置导航栏返回样式
        setNavBackUI()
    }
    
    private func setNavBackUI() -> Void {
        navigationItem.title = "设置"
        let backBtn = UIButton(text: "我")
        backBtn?.setImage(UIImage(named: "navigationbar_back_withtext"), for: UIControlState.normal)
        backBtn?.addTarget(self, action: #selector(backNav), for: UIControlEvents.touchUpInside)
        backBtn?.adjustsImageWhenHighlighted = false
        backBtn?.setTitleColor(UIColor.black, for: UIControlState.normal)
        backBtn?.sizeToFit()
        backBtn?.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn!)
        
    }
    
    @objc private func backNav() -> (){
        navigationController?.popViewController(animated: true)
    }
    
    
}
// MARK: - UIAlertViewDelegate
extension SettingsTableViewController : UIAlertViewDelegate
{
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 取消点击cell的默认选中效果
        tableView.cellForRow(at: indexPath)?.isSelected = false
        
    }
}
