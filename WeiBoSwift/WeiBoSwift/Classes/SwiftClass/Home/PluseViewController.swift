//
//  PluseViewController.swift
//  WeiBoSwift
//
//  Created by itogame on 2017/8/15.
//  Copyright © 2017年 itogame. All rights reserved.
//

import UIKit

class PluseViewController: UIViewController {
    
    @objc var scrollView : UIScrollView?
    
    @IBOutlet weak var adView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(white: 1.0, alpha: 0.98)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        ASLog("")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        ASLog("")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        ASLog(#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        ASLog(#function)
    }
    
    @IBAction func closePlus(_ sender: UIButton) {
        dismiss(animated: false, completion: {})
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        closePlus(UIButton())
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
