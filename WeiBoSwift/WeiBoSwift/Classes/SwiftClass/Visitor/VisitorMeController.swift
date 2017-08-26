//
//  VisitorMeController.swift
//  WeiBoSwift
//
//  Created by itogame on 2017/8/24.
//  Copyright © 2017年 itogame. All rights reserved.
//

import UIKit

class VisitorMeController: UIViewController {
    
    lazy var panGesture: UIPanGestureRecognizer = {
        let panG :UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panning(pan:)))
        
        return panG
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addGestureRecognizer(panGesture)
    }

    @objc private func panning(pan : UIPanGestureRecognizer) {
        // Dispose of any resources that can be recreated.
        ASLog(t: pan.translation(in: view).y)
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
