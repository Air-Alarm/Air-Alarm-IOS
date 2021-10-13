//
//  ChartsData.swift
//  Air-Alarm
//
//  Created by Jinhee on 2021/09/10.
//

import SwiftUI
import SwiftUICharts

struct Data {
    //static let title = "Air-Alarm"
    static let title0 = "온도"
    static let title1 = "습도"
    static let title2 = "미세먼지"
    static let title3 = "이산화탄소"
    
    static let legend0 = "온도"
    static let legend1 = "습도"
    static let legend2 = "미세먼지"
    static let legend3 = "이산화탄소"
    //static let valueSpecifier = "USD"
    
    //static let rateValue = 57
    
    static let data0 = [8.0, 32.0, 11.0, 23.0, 40.0, 28.0]
    static let data1 = [90.0, 99.0, 78.0, 111.0, 70.0, 60.0, 77.0]
    static let data2 = [34.0, 56.0, 72.0, 38.0, 43.0, 100.0, 50.0]
    static let data3 = [21.0, 11.0, 56.0, 29.0, 60.0, 81.0, 33.0]
    
    static let line0 = (data0, GradientColors.blue)
//    static let line1 = (data1, GradientColors.purple)
//    static let line2 = (data2, GradientColors.orngPink)
//
//    static let multiline = [line0, line1, line2]
    
    
}

// 일 그래프
class GetData{
    private var data: [DustInfo]
    init(){
        data = restAPI.GET_HourAll()
    }
    public func temhour() -> [Double]{
        var tem:[Double] = []
    //    db = restAPI.GET_HourAll()
        for index in data {
            tem.append(index.temperature)
        }
        return tem
    }
    
    public func humhour() -> [Double]{
        var hum:[Double] = []
    //    db = restAPI.GET_HourAll()
        for index in data {
            hum.append(index.humidity)
        }
        return hum
    }
    
    public func dusthour() -> [Double]{
        var dust:[Double] = []
    //    db = restAPI.GET_HourAll()
        for index in data {
            dust.append(index.dust)
        }
        return dust
    }
    
    public func co2hour() -> [Double]{
        var co2:[Double] = []
    //    db = restAPI.GET_HourAll()
        for index in data {
            co2.append(index.CO2)
        }
        return co2
    }
}

// 주 그래프
class WeekData{
    private var data: [DustInfo]
    init(){
        data = restAPI.GET_Week()
    }
    public func temweek() -> [Double]{
        var tem:[Double] = []
    //    db = restAPI.GET_HourAll()
        for index in data {
            tem.append(index.temperature)
        }
        return tem
    }
    
    public func humweek() -> [Double]{
        var hum:[Double] = []
    //    db = restAPI.GET_HourAll()
        for index in data {
            hum.append(index.humidity)
        }
        return hum
    }
    
    public func dustweek() -> [Double]{
        var dust:[Double] = []
    //    db = restAPI.GET_HourAll()
        for index in data {
            dust.append(index.dust)
        }
        return dust
    }
    
    public func co2week() -> [Double]{
        var co2:[Double] = []
    //    db = restAPI.GET_HourAll()
        for index in data {
            co2.append(index.CO2)
        }
        return co2
    }
}

// 월 그래프
class DayData{
    private var data: [DustInfo]
    init(){
        data = restAPI.GET_DayAll()
    }
    public func temday() -> [Double]{
        var tem:[Double] = []
    //    db = restAPI.GET_HourAll()
        for index in data {
            tem.append(index.temperature)
        }
        return tem
    }
    
    public func humday() -> [Double]{
        var hum:[Double] = []
    //    db = restAPI.GET_HourAll()
        for index in data {
            hum.append(index.humidity)
        }
        return hum
    }
    
    public func dustday() -> [Double]{
        var dust:[Double] = []
    //    db = restAPI.GET_HourAll()
        for index in data {
            dust.append(index.dust)
        }
        return dust
    }
    
    public func co2day() -> [Double]{
        var co2:[Double] = []
    //    db = restAPI.GET_HourAll()
        for index in data {
            co2.append(index.CO2)
        }
        return co2
    }
}

var db = [DustInfo]()
let restAPI = RestAPI()
// 온도 일 그래프
struct hour: Codable {
    init(tem: [Double] = [0.0], hum: [Double] = [0.0], dust: [Double] = [0.0], co2: [Double] = [0.0]){
        
        self.data = restAPI.GET_HourAll()
        self.tem = tem
        self.hum = hum
        self.dust = dust
        self.co2 = co2
    }
    var tem:[Double]
    var hum:[Double]
    var dust:[Double]
    var co2:[Double]

    var data: [DustInfo]
}
//func temhour(member: hour) -> [hour] {
//    var hourr = hour.init()
//    db = restAPI.GET_HourAll()
//    for index in db {
//        hourr.tem.append(index.temperature)
//        hourr.hum.append(index.humidity)
//        hourr.dust.append(index.dust)
//        hourr.co2.append(index.CO2)
//    }
//    return [hourr]
//}

// 습도 일 그래프
func humhour() -> Void{
    var tem:[Double] = []
    var dust:[Double] = []
    var co2:[Double] = []
    var hum:[Double] = []
    db = restAPI.GET_HourAll()
    for index in db {
        tem.append(index.temperature)
        hum.append(index.humidity)
        dust.append(index.dust)
        co2.append(index.CO2)
    }
}

// 미세먼지 일 그래프
func dusthour() -> [Double]{
    var dust:[Double] = []
//    db = restAPI.GET_HourAll()
    for index in db {
        dust.append(index.dust)
    }
    return dust
}
// 이산화탄소 일 그래프
func co2hour() -> [Double]{
    var co2:[Double] = []
    db = restAPI.GET_HourAll()
    for index in db {
        co2.append(index.CO2)
    }
    return co2
}

// 온도 주 그래프
//func temweek() -> [Double]{
//    var tem:[Double] = []
//    db = restAPI.GET_Week()
//    for index in db {
//        tem.append(index.temperature)
//    }
//    return tem
//}
//// 습도 주 그래프
//func humweek() -> [Double]{
//    var hum:[Double] = []
//    db = restAPI.GET_Week()
//    for index in db {
//        hum.append(index.humidity)
//    }
//    return hum
//}
//// 미세먼지 주 그래프
//func dustweek() -> [Double]{
//    var dust:[Double] = []
//    db = restAPI.GET_Week()
//    for index in db {
//        dust.append(index.dust)
//    }
//    return dust
//}
//// 이산화탄소 주 그래프
//func co2week() -> [Double]{
//    var co2:[Double] = []
//    db = restAPI.GET_Week()
//    for index in db {
//        co2.append(index.CO2)
//    }
//    return co2
//}
//
//// 온도 월 그래프
//func temday() -> [Double]{
//    var tem:[Double] = []
//    db = restAPI.GET_DayAll()
//    for index in db {
//        tem.append(index.temperature)
//    }
//    return tem
//}
//
//// 습도 월 그래프
//func humday() -> [Double]{
//    var hum:[Double] = []
//    db = restAPI.GET_DayAll()
//    for index in db {
//        hum.append(index.humidity)
//    }
//    return hum
//}
//
//// 미세먼지 월 그래프
//func dustday() -> [Double]{
//    var dust:[Double] = []
//    db = restAPI.GET_DayAll()
//    for index in db {
//        dust.append(index.dust)
//    }
//    return dust
//}
//
//// 이산화탄소 월 그래프
//func co2day() -> [Double]{
//    var co2:[Double] = []
//    db = restAPI.GET_DayAll()
//    for index in db {
//        co2.append(index.CO2)
//    }
//    return co2
//}
//
