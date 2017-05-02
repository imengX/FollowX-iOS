//
//	DBSubject.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper

public enum DBSubjectType: String {
    case Movie = "movie"
    case TV = "tv"
}

class DBSubject : NSObject, NSCoding, Mappable{

	var aka : [String]?//更多中文名
	var alt : String?//条目页URL
	var casts : [DBCast]?//主演，最多可获得4个，数据结构为影人的简化描述
	var collectCount : Int?//看过人数
	var commentsCount : Int?//短评数量
	var countries : [String]?//制片国家/地区
	var currentSeason : Int?//当前季数(tv only)
	var directors : [DBCast]?//导演，数据结构为影人的简化描述
	var doCount : Int?//在看人数，如果是电视剧，默认值为0，如果是电影值为null
	var doubanSite : String?//豆瓣小站
	var episodesCount : Int?//当前季的集数(tv only)
	var genres : [String]?//影片类型，最多提供3个
	var id : String?//条目id
	var images : DBImageURL?//电影海报图，分别提供288px x 465px(大)，96px x 155px(中) 64px x 103px(小)尺寸
	var mobileUrl : String?//移动版条目页URL
	var originalTitle : String?//原名
	var rating : DBRating?//评分
	var ratingsCount : Int?//评分人数
	var reviewsCount : Int?//影评数量
	var scheduleUrl : String?//影讯页URL(movie only)
	var seasonsCount : Int?//总季数(tv only)
	var shareUrl : String?
	var subtype : DBSubjectType?//条目分类, movie或者tv	默认为	movie
	var summary : String?//简介
	var title : String?//中文名
	var wishCount : Int?//想看人数
	var year : String?//年代


	class func newInstance(map: Map) -> Mappable?{
		return DBSubject()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		aka <- map["aka"]
		alt <- map["alt"]
		casts <- map["casts"]
		collectCount <- map["collect_count"]
		commentsCount <- map["comments_count"]
		countries <- map["countries"]
		currentSeason <- map["current_season"]
		directors <- map["directors"]
		doCount <- map["do_count"]
		doubanSite <- map["douban_site"]
		episodesCount <- map["episodes_count"]
		genres <- map["genres"]
		id <- map["id"]
		images <- map["images"]
		mobileUrl <- map["mobile_url"]
		originalTitle <- map["original_title"]
		rating <- map["rating"]
		ratingsCount <- map["ratings_count"]
		reviewsCount <- map["reviews_count"]
		scheduleUrl <- map["schedule_url"]
		seasonsCount <- map["seasons_count"]
		shareUrl <- map["share_url"]
		subtype <- map["subtype"]
		summary <- map["summary"]
		title <- map["title"]
		wishCount <- map["wish_count"]
		year <- map["year"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         aka = aDecoder.decodeObject(forKey: "aka") as? [String]
         alt = aDecoder.decodeObject(forKey: "alt") as? String
         casts = aDecoder.decodeObject(forKey: "casts") as? [DBCast]
         collectCount = aDecoder.decodeObject(forKey: "collect_count") as? Int
         commentsCount = aDecoder.decodeObject(forKey: "comments_count") as? Int
         countries = aDecoder.decodeObject(forKey: "countries") as? [String]
         currentSeason = aDecoder.decodeObject(forKey: "current_season") as? Int
         directors = aDecoder.decodeObject(forKey: "directors") as? [DBCast]
         doCount = aDecoder.decodeObject(forKey: "do_count") as? Int
         doubanSite = aDecoder.decodeObject(forKey: "douban_site") as? String
         episodesCount = aDecoder.decodeObject(forKey: "episodes_count") as? Int
         genres = aDecoder.decodeObject(forKey: "genres") as? [String]
         id = aDecoder.decodeObject(forKey: "id") as? String
         images = aDecoder.decodeObject(forKey: "images") as? DBImageURL
         mobileUrl = aDecoder.decodeObject(forKey: "mobile_url") as? String
         originalTitle = aDecoder.decodeObject(forKey: "original_title") as? String
         rating = aDecoder.decodeObject(forKey: "rating") as? DBRating
         ratingsCount = aDecoder.decodeObject(forKey: "ratings_count") as? Int
         reviewsCount = aDecoder.decodeObject(forKey: "reviews_count") as? Int
         scheduleUrl = aDecoder.decodeObject(forKey: "schedule_url") as? String
         seasonsCount = aDecoder.decodeObject(forKey: "seasons_count") as? Int
         shareUrl = aDecoder.decodeObject(forKey: "share_url") as? String
         subtype = aDecoder.decodeObject(forKey: "subtype") as? DBSubjectType
         summary = aDecoder.decodeObject(forKey: "summary") as? String
         title = aDecoder.decodeObject(forKey: "title") as? String
         wishCount = aDecoder.decodeObject(forKey: "wish_count") as? Int
         year = aDecoder.decodeObject(forKey: "year") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if aka != nil{
			aCoder.encode(aka, forKey: "aka")
		}
		if alt != nil{
			aCoder.encode(alt, forKey: "alt")
		}
		if casts != nil{
			aCoder.encode(casts, forKey: "casts")
		}
		if collectCount != nil{
			aCoder.encode(collectCount, forKey: "collect_count")
		}
		if commentsCount != nil{
			aCoder.encode(commentsCount, forKey: "comments_count")
		}
		if countries != nil{
			aCoder.encode(countries, forKey: "countries")
		}
		if currentSeason != nil{
			aCoder.encode(currentSeason, forKey: "current_season")
		}
		if directors != nil{
			aCoder.encode(directors, forKey: "directors")
		}
		if doCount != nil{
			aCoder.encode(doCount, forKey: "do_count")
		}
		if doubanSite != nil{
			aCoder.encode(doubanSite, forKey: "douban_site")
		}
		if episodesCount != nil{
			aCoder.encode(episodesCount, forKey: "episodes_count")
		}
		if genres != nil{
			aCoder.encode(genres, forKey: "genres")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if images != nil{
			aCoder.encode(images, forKey: "images")
		}
		if mobileUrl != nil{
			aCoder.encode(mobileUrl, forKey: "mobile_url")
		}
		if originalTitle != nil{
			aCoder.encode(originalTitle, forKey: "original_title")
		}
		if rating != nil{
			aCoder.encode(rating, forKey: "rating")
		}
		if ratingsCount != nil{
			aCoder.encode(ratingsCount, forKey: "ratings_count")
		}
		if reviewsCount != nil{
			aCoder.encode(reviewsCount, forKey: "reviews_count")
		}
		if scheduleUrl != nil{
			aCoder.encode(scheduleUrl, forKey: "schedule_url")
		}
		if seasonsCount != nil{
			aCoder.encode(seasonsCount, forKey: "seasons_count")
		}
		if shareUrl != nil{
			aCoder.encode(shareUrl, forKey: "share_url")
		}
		if subtype != nil{
			aCoder.encode(subtype, forKey: "subtype")
		}
		if summary != nil{
			aCoder.encode(summary, forKey: "summary")
		}
		if title != nil{
			aCoder.encode(title, forKey: "title")
		}
		if wishCount != nil{
			aCoder.encode(wishCount, forKey: "wish_count")
		}
		if year != nil{
			aCoder.encode(year, forKey: "year")
		}

	}

}
