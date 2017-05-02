//
//  TSDiscoverSectionModel.swift
//  TVShow
//
//  Created by lkx on 16/5/13.
//  Copyright © 2016年 imeng. All rights reserved.
//

import UIKit

import AlamofireObjectMapper
import Alamofire
import SwiftyJSON
import ObjectMapper

let DiscoverListURL = "http://api.rrmj.tv/v2/video/search"

class TSDiscoverSectionController: NSObject,UICollectionViewDataSource, UICollectionViewDelegate {
    var subjects = [DBSubject]()
    
    var collectionViewController: UICollectionViewController?
    
    init(subjects:[DBSubject]?) {
        super.init()
        if let aSubjects = subjects {
            self.subjects = aSubjects
        }
    }
    
    func sectionReuseIdentifier() -> String {
        return"\(DiscoverShelfCellReuseIdentifier)&\(self.subjects.count)"
    }
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subjects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscoverCellReuseIdentifier, for: indexPath) as! TSDiscoverCollectionViewCell
        
        // Configure the cell
        let subject = subjects[indexPath.item]
        
        cell.titleLabel.text = subject.title
        cell.catalogLabel.text = subject.genres?.joined(separator: "|")
        if let imageURL = subject.images?.medium {
            cell.coverImageView.kf.setImage(with: URL(string: imageURL))
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let detailViewController = UIStoryboard(name: "Detail", bundle: Bundle.main).instantiateInitialViewController() as? TSSeasonDetailViewController {
            detailViewController.subject = subjects[indexPath.item]
            collectionViewController?.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
