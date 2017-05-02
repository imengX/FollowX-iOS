//
//  TSDiscoverSectionCell.swift
//  TVShow
//
//  Created by lkx on 16/5/13.
//  Copyright © 2016年 imeng. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

let DiscoverShelfCellReuseIdentifier = "TSDiscoverShelfCollectionViewCell"

class TSDiscoverShelfCollectionView: UICollectionView {
    var section = 0
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.commonInit()
    }
    func commonInit(){
        self.register(UINib.init(nibName: "TSDiscoverCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: DiscoverCellReuseIdentifier)

    }
}

class TSDiscoverShelfCollectionViewCell: UICollectionViewCell{
//    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: TSDiscoverShelfCollectionView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
