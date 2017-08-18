//
//  WeiboTableViewController.swift
//  WeiBoSwift
//
//  Created by itogame on 2017/8/15.
//  Copyright © 2017年 itogame. All rights reserved.
//

import UIKit

class WeiboTableViewController: BaseTableViewController {
    
    lazy var navCenterView :NavCenterView = {
        
        return NavCenterView(names : ["关注", "热门"])
    }() 

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    }
    
    override func loadView() {
        super.loadView()
        // 添加导航栏按钮
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        // 添加标题view 和设置代理
        navigationItem.titleView = navCenterView
        navCenterView.delegate = self
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

// MARK: - NavCenterViewDelegate
extension WeiboTableViewController : NavCenterViewDelegate {
    func arrowRotation(navCenterView: NavCenterView) {
        ASLog(t: "")
    }
}
