//
//	RootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper

class RootClass{

	var data : [Data]?
	var pageSize : Int?
	var totalItems : Int?
	var totalPages : Int?


	class func newInstance(map: Map) -> Mappable?{
		return RootClass()
	}
	required init?(map: Map){}
	private override init(){}

}