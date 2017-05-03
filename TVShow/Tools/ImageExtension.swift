//
//  ImageExtension.swift
//  TVShow
//
//  Created by Alienchang on 2017/5/3.
//  Copyright © 2017年 imeng. All rights reserved.
//

import UIKit
extension UIColor {
    
    func mostColor() ->UIColor{
        let image:UIImage = UIImage();
        let bitmapInfo:CGImageAlphaInfo? = CGImageAlphaInfo.premultipliedLast;
        let thumbSize:CGSize? = CGSize(width: 50,height: 50);

        let colorSpace:CGColorSpace = CGColorSpaceCreateDeviceRGB();
        let context = CGContext.init(data: nil, width: Int(thumbSize!.width), height: Int(thumbSize!.height), bitsPerComponent: 8, bytesPerRow: Int(thumbSize!.width*4), space: colorSpace, bitmapInfo: bitmapInfo!.rawValue);
        
        let drawRect:CGRect = CGRect(x:0,y:0,width:(thumbSize?.width)!,height:(thumbSize?.height)!);
        
        context?.draw(image.cgImage!, in: drawRect);
        
        let data = context!.data;
        
        if data == nil {
            return UIColor.white;
        }
        
        let cls:NSCountedSet = NSCountedSet.init(capacity: Int((thumbSize?.width)! * (thumbSize?.height)!));
        for x in 0 ..< Int((thumbSize?.width)!) {
            for y in 0 ..< Int((thumbSize?.height)!){
                let offset:Int = 4 * x * y;
                let int4Ptr = data.bin
                
            }
        }
        var color:UIColor? = UIColor();
        return color!;
    }
    
    
}
