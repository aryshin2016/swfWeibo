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
        //navigationBar.setBackgroundImage(UIImage(named:"navigationbar_background"), for: UIBarPosition.topAttached, barMetrics: UIBarMetrics.default)
       // navigationBar.barTintColor = UIColor.white
        /// 这个属性强大，可以关闭默认的穿透效果，并且布局时忽略掉自身的64高度
        navigationBar.isTranslucent = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
