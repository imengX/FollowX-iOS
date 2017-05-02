//
//	ImageResource.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class DBImageURL : NSObject, NSCoding, Mappable{
    //影人头像，分别提供420px x 600px(大)，140px x 200px(中) 70px x 100px(小)尺寸	dict	Y	Y	Y	-
    
	var large : String?
	var medium : String?
	var small : String?


	class func newInstance(map: Map) -> Mappable?{
		return DBImageURL()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		large <- map["large"]
		medium <- map["medium"]
		small <- map["small"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         large = aDecoder.decodeObject(forKey: "large") as? String
         medium = aDecoder.decodeObject(forKey: "medium") as? String
         small = aDecoder.decodeObject(forKey: "small") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if large != nil{
			aCoder.encode(large, forKey: "large")
		}
		if medium != nil{
			aCoder.encode(medium, forKey: "medium")
		}
		if small != nil{
			aCoder.encode(small, forKey: "small")
		}

	}

}
