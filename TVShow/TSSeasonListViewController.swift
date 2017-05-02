//
//  ViewController.swift
//  TVShow
//
//  Created by imeng on 16/4/6.
//  Copyright © 2016年 imeng. All rights reserved.
//
//学习https://onevcat.com/2014/06/walk-in-swift/
//总结:
//"T?": 表示Optional<T>
//"obj?": 若obj为T?类型，则obj?可以安全使用链式语法，而返回对象仍然为T?类型
//"obj!": 若obj为T?类型，则返回对象为T类型
//"obj as? T": 将任意类型转换为T?类型，失败时返回nil
//"obj as! T": 将任意类型转换为T类型，失败时异常

import UIKit
import Alamofire
import AlamofireObjectMapper
import SwiftyJSON
import Kingfisher

class TSSeasonListViewController: UITableViewController{

    var objects = [DBSubject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.automaticallyAdjustsScrollViewInsets = false
        
        // Do any additional setup after loading the view, typically from a nib.
        let api = "http://api.rrmj.tv/v2/video/search"
        let parameters = ["order": "desc","sort": "createTime","mark": "update","page": "1","rows": "100"]
        TSNetRequestManager.sharedInstance.request(api, parameters: parameters).responseArray(keyPath:"subjects") { (response: DataResponse<[DBSubject]>) in
            switch response.result {
            case .success(let result):
                self.objects += result
                self.tableView?.reloadData()
            case .failure(let errorInfo):
                print(errorInfo)
            }
        }
    }
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row]
                if let controller = segue.destination as? TSSeasonDetailViewController {
                    if let sid = object.id {
                        controller.id = sid
                    }
                    //                    controller.detailItem = object
                    //                    controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                    //                    controller.navigationItem.leftItemsSupplementBackButton = true
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\(object_getClass(self)).viewWillAppear(\(animated))")
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //既然dequeueReusableCellWithIdentifier声明了其optional的可能性，那么就从语法上接受这个假设
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        
        let season = objects[indexPath.row]
        
        cell.textLabel?.text = season.title
//        cell.detailTextLabel?.text = season.brief
//        cell.imageView?.kf.setImage(with: URL(string: season.cover!))
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = TSSeasonDetailViewController()
        let season = objects[indexPath.row]
        viewController.id = season.id!
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

