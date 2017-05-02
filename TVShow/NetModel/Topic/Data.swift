//
//	Data.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper

class Data{

	var createdAt : String?
	var id : Int?
	var newsArray : [NewsArray]?
	var order : Int?
	var publishDate : AnyObject?
	var publishUserId : Int?
	var relatedTopicArray : AnyObject?
	var summary : String?
	var title : String?
	var updatedAt : String?
	var wechatArray : AnyObject?
	var weiboArray : AnyObject?


	class func newInstance(map: Map) -> Mappable?{
		return Data()
	}
	required init?(map: Map){}
	private override init(){}

}