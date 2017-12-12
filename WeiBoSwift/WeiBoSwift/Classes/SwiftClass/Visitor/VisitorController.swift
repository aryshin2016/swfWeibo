//
//  VisitorController.swift
//  WeiBoSwift
//
//  Created by itogame on 2017/8/23.
//  Copyright © 2017年 itogame. All rights reserved.
//

import UIKit

class VisitorController: UIViewController {
    
    @objc lazy var gradientLayer: CAGradientLayer = {
        let layT : CAGradientLayer = CAGradientLayer()
        layT.frame = self.gradientView.bounds
        layT.colors = [UIColor(white: 1, alpha: 1).cgColor, UIColor(white: 1, alpha: 0).cgColor]
        layT.startPoint = CGPoint(x: 0, y: 0.6)
        layT.endPoint = CGPoint(x: 0, y: 0)
        return layT
    }()

    // 旋转图
    @IBOutlet weak var rotaIcon: UIImageView!
    // 渐变图
    @IBOutlet weak var gradientView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
gradientView.backgroundColor = UIColor.clear
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let ani = CABasicAnimation(keyPath: "transform.rotation")
        ani.toValue = Double.pi * 2
        ani.duration = 8.0
        ani.repeatCount = Float(CGFloat.greatestFiniteMagnitude)
        ani.autoreverses = false
        ani.isRemovedOnCompletion = false
        ani.fillMode = kCAFillModeForwards
        rotaIcon.layer.add(ani, forKey: "rotation")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // ASLog(t: gradientView.frame)
        gradientView.layer.addSublayer(gradientLayer)
        //gradientView.layer.mask = gradientLayer
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        rotaIcon.layer.removeAllAnimations()
    }

    // 找感兴趣的人
    @IBAction func findInterests(_ sender: UIButton) {
        ASLog("")
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
