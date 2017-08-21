//
//  MenuViewController.swift
//  WeiBoSwift
//
//  Created by itogame on 2017/8/21.
//  Copyright © 2017年 itogame. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    lazy var collectionContent :UICollectionView = {
        let collectionContent = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 200), collectionViewLayout: UICollectionViewFlowLayout())
        collectionContent.backgroundColor = UIColor.black
        return collectionContent
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionContent)
        collectionContent.dataSource = self
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionContent.frame.size.width = view.bounds.size.width
        view.frame.size.height = collectionContent.frame.size.height
    }

}

/// MARK: - 
extension MenuViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 21
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
}
