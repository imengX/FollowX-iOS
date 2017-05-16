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
import WebKit

import Kanna

private let reuseIdentifier = "Cell"
private let emptyReuseIdentifier = "EmptyCell"

//let DiscoverSectionURL0 = "http://api.douban.com/v2/movie/in_theaters"
//let DiscoverSectionURL1 = "http://api.douban.com/v2/movie/coming_soon"
//let DiscoverSectionURL2 = "http://api.douban.com/v2/movie/top250"
//
//let SearchURL = "http://api.douban.com/v2/movie/search"
//
//let DiscoverAPI = [DiscoverSectionURL0, DiscoverSectionURL1, DiscoverSectionURL2];

let DiscoverAPI = "https://m.douban.com/tv/"

class TSDiscoverViewController: UIViewController,UISearchBarDelegate,WKNavigationDelegate {
    var subjects = [String:DBSubjects]()
    var contentObjects = [String:TSDiscoverSectionController]()
    var bannerObjects = [JSON]()
    
    var webView = WKWebView(frame:UIScreen.main.bounds)
    var htmlRenderView = WKWebView(frame:UIScreen.main.bounds)
    
    
    // MARK: - Left Cycle
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title:"reload", style: .plain, target:self , action:#selector(self.fetchData))
        
        self.htmlRenderView.navigationDelegate = self
        self.webView.navigationDelegate = self
        
        self.view.addSubview(webView)
        
        self.fetchData()
    }
    
    // MARK: -
    
    func fetchData() {
        self.htmlRenderView.load(URLRequest(url:URL(string: DiscoverAPI)!))
    }
    
    
    // MARK: - WKNavigationDelegate
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if webView == htmlRenderView {
            htmlRenderView.evaluateJavaScript("document.documentElement.outerHTML.toString()",
                                              completionHandler: { (html: Any?, error: Error?) in
                                                let string = html as? String ?? "error"
                                                print(string)
                                                self.webView.loadHTMLString(self.filterHTML(string: string), baseURL: URL(string: self.htmlRenderView.url?.absoluteString ?? DiscoverAPI))
            })
        }
    }
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Swift.Void) {
        print(navigationAction.request.url ?? "nil request.url")
        print(htmlRenderView.url ?? "nil url")
        
        if navigationAction.navigationType != .linkActivated {
            decisionHandler(.allow)
            return
        }
        
        if webView == self.webView {
            if (htmlRenderView.url?.absoluteString ?? "") == (navigationAction.request.url?.absoluteString ?? "") {
                decisionHandler(.allow)
            } else {
                decisionHandler(.cancel)
                self.htmlRenderView.load(navigationAction.request)
            }
        } else {
            decisionHandler(.allow)
        }
    }
    
    // MARK: - Helper
    
    func filterHTML(string:String) -> String {
        
        if let doc = HTML(html: string, encoding: .utf8){
            /**
            if let card = doc.at_css(".card") {
//                doc.body = card
                
                let html = doc.head
                
                html?.addNextSibling(card)
                return html?.innerHTML ?? ""
            }
            **/
            
            //home
            if let talionNav = doc.at_css("#TalionNav") {
                doc.body?.removeChild(talionNav)
            }
            
            if let downloadApp = doc.at_css(".download-app") {
                doc.body?.removeChild(downloadApp)
            }
            
            if var page = doc.at_css(".page") {
                page["style"] = "padding-top:0px"
            }
            //list
            if var app = doc.at_css("#app") {
                app["style"] = "padding-top:0px"
            }

            
            return doc.innerHTML ?? ""
        }
        return ""
    }
}
