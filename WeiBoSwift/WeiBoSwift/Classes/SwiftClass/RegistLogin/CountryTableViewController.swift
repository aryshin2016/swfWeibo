//
//  CountryTableViewController.swift
//  WeiBoSwift
//
//  Created by itogame on 2017/8/22.
//  Copyright © 2017年 itogame. All rights reserved.
//

import UIKit

class CountryTableViewController: UIViewController {
    
    @objc lazy var countryTable: UITableView = {
        let tab = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: self.view.bounds.size.height), style: UITableViewStyle.plain)
        return tab
    }()
    
    @objc lazy var bottomEmailView: UIView = {
        let emailView :UIView = UIView(frame: CGRect(x: 0, y: self.view.bounds.size.height - 49 - 64, width: UIScreen.main.bounds.size.width, height: 49))
        emailView.backgroundColor = UIColor(white: 1.0, alpha: 0.98)
        
        let line = UIView(frame: CGRect(x: 0, y: 0, width: emailView.bounds.size.width, height: 0.5))
        line.backgroundColor = UIColor.lightGray
        emailView.addSubview(line)
        
        let textv = UILabel()
        textv.text = "不在以上区域，请尝试邮箱注册"
        textv.font = UIFont.systemFont(ofSize: 14)
        textv.textColor = UIColor.gray
        textv.sizeToFit()
        emailView.addSubview(textv)
        textv.center = CGPoint(x: emailView.center.x, y: emailView.bounds.size.height * 0.5)
        
        let arrow = UIImageView(image: UIImage(named: "compose_weather_guide_anim_1"))
        emailView.addSubview(arrow)
        arrow.center = CGPoint(x: textv.frame.maxX + 10, y: emailView.bounds.size.height * 0.5)
        
        return emailView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置导航栏返回样式
        setNavBackUI()
        // 添加tableView
        setCountryTable()
        // 添加底部邮箱注册提示
        setBottomEmail()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.setBackgroundImage(
            UIImage(named:"navigationbar_background"),
            for: UIBarPosition.topAttached,
            barMetrics: UIBarMetrics.default)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBar.setBackgroundImage(
            UIImage(),
            for: UIBarPosition.topAttached,
            barMetrics: UIBarMetrics.default)
    }
    
    deinit {
        
    }
    
    private func setCountryTable() -> Void {
        view.addSubview(countryTable)
    }
    
    private func setBottomEmail() -> Void {
        view.addSubview(bottomEmailView)
        let emailTap = UITapGestureRecognizer(target: self, action: #selector(emailRegist))
        bottomEmailView.addGestureRecognizer(emailTap)
    }
    
    @objc private func emailRegist() ->() {
        navigationController?.pushViewController(EmailRegistController(), animated: true)
    }
    
    private func setNavBackUI() -> Void {
        navigationItem.title = "选择国家/地区"
        
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

    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
*/
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
