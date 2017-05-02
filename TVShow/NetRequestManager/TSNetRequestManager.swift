//
//  TSNetRequestManager.swift
//  TVShow
//
//  Created by imeng on 16/4/7.
//  Copyright © 2016年 imeng. All rights reserved.
//

import Foundation
import Alamofire

class TSNetRequestManager: NSObject {
    static let sharedInstance = TSNetRequestManager.alamofireManager
    static let alamofireManager = SessionManager.default;
    
    static let defaultHTTPHeaders: [String: String] = {
        
        // Accept-Encoding HTTP Header; see https://tools.ietf.org/html/rfc7230#section-4.2.3
        let acceptEncoding: String = "gzip;q=1.0, compress;q=0.5"
        
        // Accept-Language HTTP Header; see https://tools.ietf.org/html/rfc7231#section-5.3.5
        let acceptLanguage = Locale.preferredLanguages.prefix(6).enumerated().map { index, languageCode in
            let quality = 1.0 - (Double(index) * 0.1)
            return "\(languageCode);q=\(quality)"
            }.joined(separator: ", ")
        
        /*
        // User-Agent Header; see https://tools.ietf.org/html/rfc7231#section-5.5.3
        let userAgent: String = {
            if let info = NSBundle.mainBundle().infoDictionary {
                let executable: AnyObject = info[kCFBundleExecutableKey as String] ?? "Unknown"
                let bundle: AnyObject = info[kCFBundleIdentifierKey as String] ?? "Unknown"
                let version: AnyObject = info[kCFBundleVersionKey as String] ?? "Unknown"
                let os: AnyObject = NSProcessInfo.processInfo().operatingSystemVersionString ?? "Unknown"
                
                var mutableUserAgent = NSMutableString(string: "\(executable)/\(bundle) (\(version); OS \(os))") as CFMutableString
                let transform = NSString(string: "Any-Latin; Latin-ASCII; [:^ASCII:] Remove") as CFString
                
                if CFStringTransform(mutableUserAgent, UnsafeMutablePointer<CFRange>(nil), transform, false) {
                    return mutableUserAgent as String
                }
            }
            
            return "Alamofire"
        }()

        return [
            "Accept-Encoding": acceptEncoding,
            "Accept-Language": acceptLanguage,
            "User-Agent": userAgent
        ]
         */
        return ["Accept-Encoding": acceptEncoding,
                //            "Accept-Language": acceptLanguage,
            "User-Agent": "PUClient/2.1.0 (iPhone; iOS 9.3; Scale/3.00)",
            "clientVersion": "2.1.0","clientType": "ios",
            "Accept-Language": "zh-Hans-CN;q=1, en-CN;q=0.9, zh-Hans;q=0.8, en-US;q=0.7",
            "a": "06efb8eb-c798-401b-bb51-1df487b3e5da",
            "b": "/video/search?order=desc&sort=createTime&mark=update",
            "c": "lhy",
            "e": "8e700690d7709575ff85b021f6fbbde9d816f75f"]
    }()
}
