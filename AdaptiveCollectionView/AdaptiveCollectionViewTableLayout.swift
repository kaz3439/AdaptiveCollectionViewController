//
//  AdaptiveCollectionViewTableLayout.swift
//  AdaptiveCollectionView
//
//  Created by Kazuhiro Hayashi on 6/15/15.
//  Copyright © 2015 Kazuhiro Hayashi. All rights reserved.
//

import UIKit

class AdaptiveCollectionViewTableLayout: UICollectionViewFlowLayout {
    enum DisplayMode {
        case OneColumn
        case TwoCloumns
        
        func estimatedWidth(width: CGFloat, space: CGFloat) -> CGFloat {
            switch self {
            case OneColumn: return width
            case TwoCloumns: return width / 2.0 - space
            }
        }
    }
    
    let displayMode: DisplayMode = UIDevice.currentDevice().userInterfaceIdiom == .Pad ? .TwoCloumns : .OneColumn
    let cellSpace = CGFloat(0.5)
    let cellHeight = CGFloat(100.0)
    
    override var estimatedItemSize: CGSize {
        get {
            let eistimatedSize = super.estimatedItemSize
            guard let width = collectionView?.frame.size.width else { return eistimatedSize }
            
            let estimatedWidth = displayMode.estimatedWidth(width, space: self.minimumInteritemSpacing)
            return CGSizeMake(estimatedWidth, eistimatedSize.height)
        }
        
        set {
            super.estimatedItemSize = newValue
        }
    }
    
    override func prepareLayout() {
        self.minimumLineSpacing = cellSpace
        self.minimumInteritemSpacing = cellSpace
        self.estimatedItemSize.height = cellHeight
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElementsInRect(rect)
        return attributes
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
        
        return attributes
    }
}
