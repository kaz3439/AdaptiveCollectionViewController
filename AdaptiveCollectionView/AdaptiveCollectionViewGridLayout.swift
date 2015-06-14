//
//  AdaptiveCollectionViewGridLayout.swift
//  AdaptiveCollectionView
//
//  Created by Kazuhiro Hayashi on 6/15/15.
//  Copyright © 2015 Kazuhiro Hayashi. All rights reserved.
//

import UIKit

class AdaptiveCollectionViewGridLayout: UICollectionViewFlowLayout {
    enum DisplayMode {
        case TwoColumns
        case ThreeColumns
        
        func estimatedWidth(width: CGFloat, space: CGFloat) -> CGFloat {
            switch self {
            case TwoColumns: return width / 2.0 - space
            case ThreeColumns: return width / 3.0 - space
            }
        }
    }
    
    let displayMode: DisplayMode = UIDevice.currentDevice().userInterfaceIdiom == .Pad ? .ThreeColumns : .TwoColumns
    let cellSpace = CGFloat(16.0)
    
    override var estimatedItemSize: CGSize {
        get {
            let eistimatedSize = super.estimatedItemSize
            guard let width = collectionView?.frame.size.width else { return eistimatedSize }
            
            let allMargin = self.minimumInteritemSpacing/2 + self.sectionInset.left
            let estimatedWidth = displayMode.estimatedWidth(width, space: allMargin)
            return CGSizeMake(estimatedWidth, eistimatedSize.height)
        }
        
        set {
            super.estimatedItemSize = newValue
        }
    }
    
    override func prepareLayout() {
        super.prepareLayout()
        self.minimumInteritemSpacing = cellSpace
        self.minimumLineSpacing = cellSpace
        self.sectionInset = UIEdgeInsets(top: cellSpace, left: cellSpace, bottom: cellSpace, right: cellSpace)
        self.estimatedItemSize.height = self.estimatedItemSize.width
        
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElementsInRect(rect) ?? [UICollectionViewLayoutAttributes]()
        return attributes
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
        return attributes
    }
}
