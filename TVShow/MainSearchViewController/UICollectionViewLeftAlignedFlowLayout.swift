//
//  UICollectionViewLeftAlignedFlowLayout.swift
//  TVShow
//
//  Created by Seth Jin on 16/5/5.
//  Copyright © 2016年 imeng. All rights reserved.
//

import UIKit
//import CGRectExtensions

class UICollectionViewLeftAlignedFlowLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let oldAttributes = super.layoutAttributesForElements(in: rect) else {
            return super.layoutAttributesForElements(in: rect)
        }
        let spacing = minimumInteritemSpacing // REPLACE WITH WHAT SPACING YOU NEED
        var newAttributes = [UICollectionViewLayoutAttributes]()
        var leftMargin = sectionInset.left
        var previousAttributes = UICollectionViewLayoutAttributes()
        for i in 0 ..< oldAttributes.count {
            let attributes = oldAttributes[i]
            
            if i == 0 {
                leftMargin = sectionInset.left
            } else {
                if (abs(attributes.center.y - previousAttributes.center.y) > 0.1) { //换行
                    leftMargin = sectionInset.left
                }
                else { //不换行
                    var newLeftAlignedFrame = attributes.frame
                    newLeftAlignedFrame.origin.x = leftMargin
                    attributes.frame = newLeftAlignedFrame
                }
            }
            
            attributes.frame.origin.x = leftMargin
            newAttributes.append(attributes)
            
            leftMargin += attributes.frame.width + spacing
            
            previousAttributes = attributes
        }
        return newAttributes
    }
}
