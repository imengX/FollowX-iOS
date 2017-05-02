//
//  MainSearchCollectionViewController.swift
//  TVShow
//
//  Created by Seth Jin on 16/5/4.
//  Copyright © 2016年 imeng. All rights reserved.
//

import UIKit

class MainSearchCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //在collectionView的collectionViewCell中填写了identifier，这里就不用register了
        /* self.collectionView!.registerClass(MainSearchCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier) */

        // Do any additional setup after loading the view.
        
//        collectionView?.backgroundView?.backgroundColor = UIColor.whiteColor()
//        collectionView?.backgroundColor = UIColor.whiteColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 13
    }
    
    func stringForKeywordLabelTextAt(indexPath: IndexPath) -> String {
        
        let char: String
        if indexPath.section == 0 {
            char = "热"
        } else if indexPath.section == 1 {
            char = "近"
        } else {
            char = "空"
        }
        let value = String(repeating:char, count: indexPath.row + 1)
//        let value = String(count: indexPath.row + 1, repeatedValue: char)
        
        
        return value
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MainSearchCollectionViewCell
        cell.keywordLabel.text = stringForKeywordLabelTextAt(indexPath: indexPath)
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath) as! MainSearchHeaderCollectionReusableView
        switch indexPath.section {
        case 0:
            header.titleLabel.text = "热门搜索"
        case 1:
            header.titleLabel.text = "最近搜索"
        default: break
        }
        return header
        
    }
    
    //设置每个cell大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = stringForKeywordLabelTextAt(indexPath: indexPath) as NSString
        let size = text.boundingRect(with: CGSize(width:300,height:50), options: NSStringDrawingOptions.usesFontLeading, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 17)], context: nil).size
        return CGSize(width: size.width+4, height:size.height+4)
    }


    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
