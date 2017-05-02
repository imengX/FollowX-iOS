//
//	DBCast.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class DBCast : NSObject, NSCoding, Mappable{
    
	var alt : String?//影人条目URL
	var avatars : DBImageURL?//影人头像
	var id : String?//影人条目id
	var name : String?//中文名


	class func newInstance(map: Map) -> Mappable?{
		return DBCast()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		alt <- map["alt"]
		avatars <- map["avatars"]
		id <- map["id"]
		name <- map["name"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         alt = aDecoder.decodeObject(forKey: "alt") as? String
         avatars = aDecoder.decodeObject(forKey: "avatars") as? DBImageURL
         id = aDecoder.decodeObject(forKey: "id") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if alt != nil{
			aCoder.encode(alt, forKey: "alt")
		}
		if avatars != nil{
			aCoder.encode(avatars, forKey: "avatars")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}

	}

}
