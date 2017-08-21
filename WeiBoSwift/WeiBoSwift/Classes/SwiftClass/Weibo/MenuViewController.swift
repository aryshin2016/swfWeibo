//
//  MenuViewController.swift
//  WeiBoSwift
//
//  Created by itogame on 2017/8/21.
//  Copyright © 2017年 itogame. All rights reserved.
//

import UIKit

let IDENTY = "MenuViewControllerCell"


class MenuViewController: UIViewController {
    
    lazy var collectionContent :UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.minimumLineSpacing = 10
        flow.minimumInteritemSpacing = 20
        flow.itemSize = CGSize(width: 55, height: 40)
        flow.headerReferenceSize = CGSize(width: 0, height: 20)
        let collectionContent = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 200), collectionViewLayout: flow)
        collectionContent.backgroundColor = UIColor.black
        
        return collectionContent
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionContent)
        collectionContent.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: IDENTY)
        collectionContent.register(UICollectionReusableView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: IDENTY)
        collectionContent.dataSource = self
        collectionContent.delegate = self
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionContent.frame.size.width = view.bounds.size.width
        view.frame.size.height = collectionContent.frame.size.height
    }

}

/// MARK: - UICollectionViewDelegateFlowLayout
extension MenuViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
       let her = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: IDENTY, for: indexPath)
        if kind == UICollectionElementKindSectionHeader {
            let tex = UILabel()
            tex.text = "hahahah"
            tex.textColor = UIColor.white
            tex.sizeToFit()
            her.addSubview(tex)
        }
        return her
        
    }
}

/// MARK: - UICollectionViewDataSource
extension MenuViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cel = collectionView.dequeueReusableCell(withReuseIdentifier: IDENTY, for: indexPath)
        cel.backgroundColor = UIColor.red
        return cel
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
}
