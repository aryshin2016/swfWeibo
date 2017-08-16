//
//  RootNavController.swift
//  WeiBoSwift
//
//  Created by itogame on 2017/8/15.
//  Copyright © 2017年 itogame. All rights reserved.
//

import UIKit

class RootNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置导航栏默认橙色主题.
        UINavigationBar.appearance().tintColor = UIColor.orange
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
