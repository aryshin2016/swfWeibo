//
//  PluseViewController.swift
//  WeiBoSwift
//
//  Created by itogame on 2017/8/15.
//  Copyright © 2017年 itogame. All rights reserved.
//

import UIKit

class PluseViewController: UIViewController {
    
    var scrollView : UIScrollView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.scrollView = UIScrollView(frame: CGRect(x: 0, y: 280, width: view.bounds.width, height: 300))
        self.scrollView?.isPagingEnabled = true
        self.scrollView?.contentSize.width = view.bounds.width * 2.0
        self.scrollView?.bounces = false
        view.addSubview(self.scrollView!)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.removeFromSuperview()
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
