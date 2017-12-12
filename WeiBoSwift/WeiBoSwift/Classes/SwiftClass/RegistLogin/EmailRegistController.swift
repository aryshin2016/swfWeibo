//
//  EmailRegistController.swift
//  WeiBoSwift
//
//  Created by zhouhavey on 2017/8/22.
//  Copyright © 2017年 itogame. All rights reserved.
//

import UIKit
import WebKit

class EmailRegistController: UIViewController {
    
    @objc lazy var progressV: UIProgressView = {
        let proView : UIProgressView = UIProgressView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 1))
        proView.isHidden = true
        proView.progressTintColor = UIColor.blue
        return proView
    }()
    
    @objc lazy var wkWebView: WKWebView = {
        let config = WKWebViewConfiguration()
        
        let web : WKWebView = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height), configuration: config)
        return web
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        setNavBackUI()
        
        setWebViewUI()
        
        view.addSubview(progressV)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard  let url = URL(string: "https://www.baidu.com/") else {
            ASLog("url地址错误！！！")
            return
        }
        let request = NSMutableURLRequest(url: url, cachePolicy: NSURLRequest.CachePolicy.reloadRevalidatingCacheData, timeoutInterval: 30)
        wkWebView.load(request as URLRequest)
    }
    
    deinit {
        ASLog("")
        wkWebView.removeObserver(self, forKeyPath: "estimatedProgress", context: nil)
    }
    
    private func setWebViewUI() -> Void {
        view.addSubview(wkWebView)
        
        wkWebView.addObserver(self, forKeyPath: "estimatedProgress", options: NSKeyValueObservingOptions.new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        guard let progressT = change?[NSKeyValueChangeKey.newKey] else { return  }
        
        if progressT as! Float == 1 {
            progressV.setProgress(0.0, animated: false)
            progressV.isHidden = true
        }else {
            
            progressV.isHidden = false
            progressV.setProgress(progressT as! Float, animated: true)
        }
        
    }

    private func setNavBackUI() -> Void {
        navigationItem.title = "注册"
        
        let backBtn = UIButton(text: "返回")
        backBtn?.setImage(UIImage(named: "navigationbar_back_withtext"), for: UIControlState.normal)
        backBtn?.addTarget(self, action: #selector(backNav), for: UIControlEvents.touchUpInside)
        backBtn?.adjustsImageWhenHighlighted = false
        backBtn?.setTitleColor(UIColor.black, for: UIControlState.normal)
        backBtn?.sizeToFit()
        backBtn?.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn!)
        
    }
    
    @objc private func backNav() -> (){
        navigationController?.popViewController(animated: true)
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
