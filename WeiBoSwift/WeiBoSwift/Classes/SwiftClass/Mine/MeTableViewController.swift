//
//  MeTableViewController.swift
//  WeiBoSwift
//
//  Created by itogame on 2017/8/15.
//  Copyright © 2017年 itogame. All rights reserved.
//

import UIKit

class MeTableViewController: BaseTableViewController {
    
    
    @objc lazy var visitorMeController : VisitorMeController = {
        let visitorMeVC :VisitorMeController = VisitorMeController(nibName: "VisitorMeController", bundle: nil)
        return visitorMeVC
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        ///
      navigationController?.automaticallyAdjustsScrollViewInsets = false
        
        /// 设置返回按钮的样式
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "设置", style: UIBarButtonItemStyle.plain, target: self, action: #selector(settings))
        navigationItem.rightBarButtonItem?.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.black], for: UIControlState.normal)
        
        ///
        addChildViewController(visitorMeController)
        view.addSubview(visitorMeController.view)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        visitorMeController.view.frame = CGRect(x: 0, y: -64, width: view.frame.size.width, height: UIScreen.main.bounds.size.height)
    }
    
    @objc private func settings() ->(){
        hidesBottomBarWhenPushed = true // push 过去时隐藏tabbar
        let settingsVC = UIStoryboard(name: "SettingsTableViewController", bundle: nil).instantiateInitialViewController()
        
        navigationController?.pushViewController(settingsVC!, animated: true)
        hidesBottomBarWhenPushed = false // pop 回来时显示tabbar
    }
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
