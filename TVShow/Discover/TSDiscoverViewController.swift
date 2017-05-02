//
//  TSDiscoverViewController.swift
//  TVShow
//
//  Created by lkx on 16/4/28.
//  Copyright © 2016年 imeng. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire
import SwiftyJSON

private let reuseIdentifier = "Cell"
private let emptyReuseIdentifier = "EmptyCell"

let DiscoverSectionURL0 = "http://api.douban.com/v2/movie/in_theaters"
let DiscoverSectionURL1 = "http://api.douban.com/v2/movie/coming_soon"
let DiscoverSectionURL2 = "http://api.douban.com/v2/movie/top250"

let SearchURL = "http://api.douban.com/v2/movie/search"

let DiscoverAPI = [DiscoverSectionURL0, DiscoverSectionURL1, DiscoverSectionURL2];

class TSDiscoverViewController: UICollectionViewController,UISearchBarDelegate {
    var subjects = [String:DBSubjects]()
    var contentObjects = [String:TSDiscoverSectionController]()
    var bannerObjects = [JSON]()
    
    // MARK: - Left Cycle
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register cell classes
        let headerNib = UINib(nibName: "TSDiscoverBannerHeader", bundle: Bundle.main)
        self.collectionView!.register(headerNib, forSupplementaryViewOfKind: IOStickyHeaderParallaxHeader, withReuseIdentifier: "header")
        
        let screenBounds = UIScreen.main.bounds
        // setup layout
        if let layout: IOStickyHeaderFlowLayout = self.collectionView?.collectionViewLayout as? IOStickyHeaderFlowLayout {
            layout.parallaxHeaderReferenceSize = CGSize(width: screenBounds.width, height:0.54 * screenBounds.width)
            layout.parallaxHeaderMinimumReferenceSize = CGSize(width: screenBounds.width, height: 0)
            layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width, height: layout.itemSize.height)
            layout.parallaxHeaderAlwaysOnTop = true
            layout.disableStickyHeaders = true
        }
        
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: emptyReuseIdentifier)
        
        for i in 0 ..< DiscoverAPI.count {
            let api = DiscoverAPI[i]
            TSNetRequestManager.sharedInstance.request(api).validate().responseObject(completionHandler: { (response: DataResponse<DBSubjects>) in
                switch response.result {
                case .success(let value):
                    self.addSectionSubjects(aSubjects: value, index: i)
//                    self.collectionView?.reloadData()
                case.failure(let error):
                    print(error)
                }
            })
        }
    }
    
    // MARK:
    func addSectionSubjects(aSubjects: DBSubjects, index: Int) {
        let indexKey = String(index)
        
        let sectionModel = TSDiscoverSectionController(subjects:aSubjects.subjects)
        self.collectionView?.register(UINib.init(nibName: "TSDiscoverShelfCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier:sectionModel.sectionReuseIdentifier())
        print(sectionModel.sectionReuseIdentifier())
        
        collectionView?.performBatchUpdates({ 
            self.subjects[indexKey] = aSubjects
            self.contentObjects[indexKey] = sectionModel
            self.collectionView?.reloadSections(IndexSet(integer:index))
        }, completion: nil)
    }
    
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return DiscoverAPI.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = contentObjects[String(indexPath.section)]
        
        if let aModel = model {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: aModel.sectionReuseIdentifier(), for: indexPath) as! TSDiscoverShelfCollectionViewCell
            
            aModel.collectionViewController = self
            cell.collectionView.dataSource = aModel
            cell.collectionView.delegate = aModel
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: emptyReuseIdentifier, for: indexPath)
            
            return cell
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if UICollectionElementKindSectionHeader == kind {
            let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "sectionHeader", for: indexPath) as! TSDiscoverSectionHeader
            
            if let model = subjects[String(indexPath.section)] {
                if let string = model.title {
                    sectionHeader.textLabel.text = string
                } else {
                    sectionHeader.textLabel.text = "暂无"
                }
            } else {
                sectionHeader.textLabel.text = "加载中"
            }
            
            return sectionHeader
        } else {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: IOStickyHeaderParallaxHeader, withReuseIdentifier: "header", for: indexPath) as! TSDiscoverBannerHeader
            header.objects = self.bannerObjects
            
            return header
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            TSNetRequestManager.sharedInstance.request(SearchURL, parameters:["q":text]).validate().responseJSON(completionHandler: { (response:DataResponse<Any>) in
                switch response.result {
                case .success(let value):
                    print(value)
                case .failure(let error):
                    print(error)
                }
                
            })
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
