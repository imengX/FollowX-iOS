//
//  SubjectInfoView.swift
//  TVShow
//
//  Created by imeng on 2/19/17.
//  Copyright © 2017 imeng. All rights reserved.
//

import UIKit

class SubjectInfoView: UIView {

    var shapeLayer = CAShapeLayer()
    
    let diagonalHeight: CGFloat = 40

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.mask = shapeLayer
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.mask = shapeLayer
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let diagonalLeftBottomPoint = CGPoint(x: 0, y: diagonalHeight)
        let diagonalRightTopPoint = CGPoint(x: frame.width, y: 0)
        
        let path = UIBezierPath()
        
        path.move(to: diagonalLeftBottomPoint)
        path.addLine(to: diagonalRightTopPoint)
        path.addLine(to: CGPoint(x: frame.width, y: frame.height))
        path.addLine(to: CGPoint(x: 0, y: frame.height))
        path.addLine(to: diagonalLeftBottomPoint)
        
        path.close()
        
        shapeLayer.path = path.cgPath

    }
}
