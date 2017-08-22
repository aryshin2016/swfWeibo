//
//  MenuViewController.swift
//  WeiBoSwift
//
//  Created by itogame on 2017/8/21.
//  Copyright © 2017年 itogame. All rights reserved.
//

import UIKit

let IDENTY = "MenuViewControllerCell"
let magin :CGFloat = 15.0


class MenuViewController: UIViewController {
    
    
    lazy var collectionContent :UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.minimumLineSpacing = 10
        flow.minimumInteritemSpacing = magin
        flow.itemSize = CGSize(width: (UIScreen.main.bounds.size.width - magin * CGFloat(5)) * 0.25, height: 30)
        flow.footerReferenceSize = CGSize(width: 0, height: magin)
        flow.headerReferenceSize = CGSize(width: 0, height: magin * CGFloat(2))
        let collectionContent = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 200), collectionViewLayout: flow)
        collectionContent.backgroundColor = UIColor.black
        collectionContent.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: IDENTY)
        collectionContent.register(UICollectionReusableView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: IDENTY)
        collectionContent.contentInset = UIEdgeInsetsMake(magin, magin, magin, magin)
        collectionContent.dataSource = self
        collectionContent.delegate = self
        
        return collectionContent
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionContent)
        collectionContent.isScrollEnabled = false
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionContent.frame.size.width = view.bounds.size.width
        collectionContent.frame.size.height = collectionContent.contentSize.height + magin
        view.frame.size.height = collectionContent.frame.size.height
    }

}

/// MARK: - UICollectionViewDelegateFlowLayout
extension MenuViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
       let her = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: IDENTY, for: indexPath)
        if kind == UICollectionElementKindSectionHeader {
            let tex = UILabel()
            tex.text = "hahahaha"
            tex.textColor = UIColor.white
            tex.sizeToFit()
            her.addSubview(tex)
        }
        return her
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        ASLog(t: indexPath.row)
        if indexPath.row == 11 {
            collectionView.isScrollEnabled = true
            collectionView.reloadData()
        }
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
        switch section {
        case 0:
            return 12
        case 1:
            return 7
        default:
            
            return 7
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
}
