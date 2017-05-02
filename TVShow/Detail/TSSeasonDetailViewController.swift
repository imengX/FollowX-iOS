//
//  TSSeasonDetailViewController.swift
//  TVShow
//
//  Created by imeng on 16/4/7.
//  Copyright © 2016年 imeng. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

let SeasonDetailURL = "http://api.douban.com/v2/movie/subject/"

class TSSeasonDetailViewController: UIViewController,UIScrollViewDelegate {

    var id = ""
    var subject: DBSubject? {
        didSet {
            if let object = subject {
                if let sidString =  object.id {
                    id = sidString
                }
                if self.isViewLoaded {
                    configView(result: subject)
                }
            }
        }
    }
    
    @IBOutlet weak var containerScrollView: UIScrollView!
    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBOutlet weak var infoCoverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var enTitleLabel: UILabel!
    @IBOutlet weak var catalogLabel: UILabel!
    @IBOutlet weak var viewCountLabel: UILabel!
    @IBOutlet weak var playStatus: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var summaryLabel: UILabel!
    
    @IBOutlet weak var coverContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        let parameters = ["seasonId":, "userId":""]
        
        TSNetRequestManager.sharedInstance.request(SeasonDetailURL+id).responseObject { (response: DataResponse<DBSubject>) in
            switch response.result {
            case.success(let result):
                self.subject = result
            case.failure(let errorInfo):
                print(errorInfo)
            }
        }
        
        self.configView(result: subject)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\(object_getClass(self)).viewWillAppear(\(animated))")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configView(result:DBSubject?) {
        if let aResult = result {
            self.titleLabel.text = aResult.title
            self.enTitleLabel.text = aResult.originalTitle
            self.catalogLabel.text = aResult.genres?.joined(separator: "|")
            self.summaryLabel.text = aResult.summary
            
            if let collectCount = aResult.collectCount {
                self.viewCountLabel.text = "\(collectCount)次"
            }
            if let score = aResult.rating?.average {
                self.scoreLabel.text = "\(score)分"
            }
            if let imageURL = aResult.images?.large {
                self.coverImageView.kf.setImage(with: URL(string: imageURL))
                self.infoCoverImageView.kf.setImage(with: URL(string: imageURL))
            }
        }
    }
    
    func configCoverState() {
        let offset = self.containerScrollView.contentOffset
        let height = self.coverContainerView.bounds.height * 0.7
        
        self.infoCoverImageView.alpha = offset.y / height
        self.coverImageView.alpha = (height - offset.y) / height
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.configCoverState()
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        self.configCoverState()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.configCoverState()
    }
}
