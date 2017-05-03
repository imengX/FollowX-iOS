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
            
            let enumerator = cls.objectEnumerator();
//            var curColor:NSArray? = nil;
            var maxColor:Array<UInt8>! = nil;
            var maxCount = 0;
            
            while let curColor = enumerator.nextObject() as? Array<UInt8> {
                print(curColor);
                let tmpCount = cls.count(for: curColor);
                if tmpCount < maxCount {
                    continue;
                }
//
                maxCount = tmpCount;
                maxColor = curColor;
            }
            let r = CGFloat(Float(maxColor[0])/255.0);
            let g = CGFloat(Float(maxColor[1])/255.0);
            let b = CGFloat(Float(maxColor[2])/255.0);
            let a = CGFloat(Float(maxColor[3])/255.0);
            return UIColor(red: r, green: g, blue: b, alpha: a);
        } else {
            return UIColor.white;
        }
    }
    
    
}
