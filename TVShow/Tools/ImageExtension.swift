//
//  ImageExtension.swift
//  TVShow
//
//  Created by Alienchang on 2017/5/3.
//  Copyright © 2017年 imeng. All rights reserved.
//

import UIKit
extension UIImage {
    
    func mostColor() ->UIColor{

        
        let bitmapInfo = CGImageAlphaInfo.premultipliedLast;
        let thumbSize = CGSize(width: 50,height: 50);

        let colorSpace = CGColorSpaceCreateDeviceRGB();
        let context = CGContext(data: nil, width: Int(thumbSize.width), height: Int(thumbSize.height), bitsPerComponent: 8, bytesPerRow: Int(thumbSize.width*4), space: colorSpace, bitmapInfo: bitmapInfo.rawValue);
        
        let drawRect = CGRect(x:0,y:0,width:thumbSize.width,height:thumbSize.height);
        
        context?.draw(self.cgImage!, in: drawRect);
        

        if let uncastedData = context?.data {
            let data = uncastedData
            
            let cls = NSCountedSet(capacity: Int(thumbSize.width * thumbSize.height));
            
            for x in 0 ..< Int(thumbSize.width) {
                for y in 0 ..< Int(thumbSize.height){
                    let offset:Int = 4 * x * y;
                    
                    let alpha = data.load(fromByteOffset: offset, as: UInt8.self)
                    let red = data.load(fromByteOffset: offset+1, as: UInt8.self)
                    let green = data.load(fromByteOffset: offset+2, as: UInt8.self)
                    let blue = data.load(fromByteOffset: offset+3, as: UInt8.self)
                    
                    let clr = [red,green,blue,alpha]
                    cls.add(clr)
                    
                }
            }
            
            let enumerator:NSEnumerator = cls.objectEnumerator();
//            var curColor:NSArray? = nil;
            var maxColor:NSArray? = nil;
            var maxCount:Int = 0;
            
            while let curColor = enumerator.nextObject() as? NSArray {
                print(curColor);
                let tmpCount = cls.count(for: curColor);
                if tmpCount < maxCount {
                    continue;
                }
//
                maxCount = tmpCount;
                maxColor = curColor;
            }
            let r:Float = maxColor?[0] as! Float;
            let g:Float = maxColor?[1] as! Float;
            let b:Float = maxColor?[2] as! Float;
            let a:Float = maxColor?[3] as! Float;
            return UIColor.init(red: CGFloat(r / 255.0), green: CGFloat(g / 255.0), blue: CGFloat(b / 255.0), alpha: CGFloat(a / 255.0));
        } else {
            return UIColor.white;
        }
    }
    
    
}
