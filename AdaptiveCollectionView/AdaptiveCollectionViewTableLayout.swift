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
        case Grid
        case List
        
        func estimatedWidth(width: CGFloat, space: CGFloat) -> CGFloat {
            switch self {
            case List: return width
            case Grid: return width / 2.0 - space
            }
        }
    }
    
    let displayMode: DisplayMode = UIDevice.currentDevice().userInterfaceIdiom == .Pad ? .Grid : .List
    let cellSpace = CGFloat(0.5)
    let cellHeight = CGFloat(100.0)
    
    override func prepareLayout() {
        self.minimumLineSpacing = cellSpace
        self.minimumInteritemSpacing = cellSpace
        self.estimatedItemSize.height = cellHeight
    }
    
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
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElementsInRect(rect)
        return attributes
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
        
        return attributes
    }
}
