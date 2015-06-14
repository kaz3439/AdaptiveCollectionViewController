//
//  AdaptiveCollectionViewController.swift
//  AdaptiveCollectionView
//
//  Created by Kazuhiro Hayashi on 6/15/15.
//  Copyright © 2015 Kazuhiro Hayashi. All rights reserved.
//

import UIKit

private let reuseIdentifier = "AdaptiveCollectionViewCell"

class AdaptiveCollectionViewController: UICollectionViewController {

    let gridLayout = AdaptiveCollectionViewGridLayout()
    let tableLayout = AdaptiveCollectionViewTableLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
    }

    @IBAction func didTapSwitchingDisplay(sender: UIBarButtonItem) {
        var layout : UICollectionViewFlowLayout
        switch self.collectionView?.collectionViewLayout {
        case  _ as AdaptiveCollectionViewTableLayout:
            layout = self.gridLayout
        case  _ as AdaptiveCollectionViewGridLayout:
            fallthrough
        default:
            layout = self.tableLayout
        }
        
        self.collectionView?.setCollectionViewLayout(layout, animated: false) { (completion) -> Void in
            if !completion {
                return
            }
            
            self.collectionView?.reloadData()
        }
    }
}
