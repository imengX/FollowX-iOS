//
//	DBSubjects.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class DBSubjects : NSObject, NSCoding, Mappable{
    
	var count : Int?
	var start : Int?
	var subjects : [DBSubject]?
	var title : String?
	var total : Int?


	class func newInstance(map: Map) -> Mappable?{
		return DBSubjects()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		count <- map["count"]
		start <- map["start"]
		subjects <- map["subjects"]
		title <- map["title"]
		total <- map["total"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         count = aDecoder.decodeObject(forKey: "count") as? Int
         start = aDecoder.decodeObject(forKey: "start") as? Int
         subjects = aDecoder.decodeObject(forKey: "subjects") as? [DBSubject]
         title = aDecoder.decodeObject(forKey: "title") as? String
         total = aDecoder.decodeObject(forKey: "total") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if count != nil{
			aCoder.encode(count, forKey: "count")
		}
		if start != nil{
			aCoder.encode(start, forKey: "start")
		}
		if subjects != nil{
			aCoder.encode(subjects, forKey: "subjects")
		}
		if title != nil{
			aCoder.encode(title, forKey: "title")
		}
		if total != nil{
			aCoder.encode(total, forKey: "total")
		}

	}

}
