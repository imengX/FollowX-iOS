//
//  TSDiscoverBannerHeader.swift
//  TVShow
//
//  Created by lkx on 16/5/12.
//  Copyright © 2016年 imeng. All rights reserved.
//

import UIKit
import MapKit
import SwiftyJSON

class TSDiscoverBannerHeader: UICollectionViewCell, InfiniteCollectionViewDataSource {

    @IBOutlet weak var infiniteView: InfiniteCollectionView!
    // MARK: Public properties

    var objects: [JSON]?{
        didSet{
            self.infiniteView.reloadData()
        }
    }
    
    static let Kind = "StickyHeaderLayoutAttributesKind"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.commonInit()
    }
    
    func commonInit() {
        self.infiniteView?.register(UINib.init(nibName: "TSDiscoverBannerCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier:"TSDiscoverBannerCollectionViewCell")
        self.infiniteView.infiniteDataSource = self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let layout: UICollectionViewFlowLayout = self.infiniteView?.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = bounds.size
        }
    }
    
    func infiniteCollectionView(collectionView: InfiniteCollectionView, numberOfItemsInSection section: Int) -> Int {
        if let aObjects = self.objects {
            return aObjects.count
        }
        return 0
    }
    
    func infiniteCollectionView(collectionView: InfiniteCollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let reusedCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TSDiscoverBannerCollectionViewCell", for: indexPath as IndexPath) as? TSDiscoverBannerCollectionViewCell
        if let aObjects = objects {
            let object = aObjects[indexPath.row]
    
            reusedCell?.titleLabel.text = object["brief"].string
            let url = URL(string: object["coverUrl"].string!)
            reusedCell?.imageView.kf.setImage(with:url)
        }
        return reusedCell!
    }
}
