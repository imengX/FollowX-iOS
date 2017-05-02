//
//	NewsArray.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper

class NewsArray{

	var authorName : String?
	var duplicateArray : [String]?
	var id : Int?
	var mobileUrl : String?
	var publishDate : String?
	var siteName : String?
	var title : String?
	var url : String?


	class func newInstance(map: Map) -> Mappable?{
		return NewsArray()
	}
	required init?(map: Map){}
	private override init(){}

}