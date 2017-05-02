//
//	MSRating.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class DBRating : NSObject, NSCoding, Mappable{

	var average : Float?//评分
	var max : Int?//最高评分
	var min : Int?//最低评分
	var stars : String?//评星数


	class func newInstance(map: Map) -> Mappable?{
		return DBRating()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		average <- map["average"]
		max <- map["max"]
		min <- map["min"]
		stars <- map["stars"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         average = aDecoder.decodeObject(forKey: "average") as? Float
         max = aDecoder.decodeObject(forKey: "max") as? Int
         min = aDecoder.decodeObject(forKey: "min") as? Int
         stars = aDecoder.decodeObject(forKey: "stars") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if average != nil{
			aCoder.encode(average, forKey: "average")
		}
		if max != nil{
			aCoder.encode(max, forKey: "max")
		}
		if min != nil{
			aCoder.encode(min, forKey: "min")
		}
		if stars != nil{
			aCoder.encode(stars, forKey: "stars")
		}

	}

}
