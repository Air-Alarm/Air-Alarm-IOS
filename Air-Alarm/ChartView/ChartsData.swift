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
func data() -> [Double] {
//        ForEach(keys.indices) { index in
//            dt.append(values[index])
   // }
    
    var dt:[Double] = []
    var dict: [String: Double] = ["CO2": 44, "CO3": 99, "CP": 11]
    var keys = dict.map {$0.key}
    var values = dict.map {$0.value}
    
    for index in keys.indices {
        dt.append(values[index])
    }
    return dt
}

var db = [DustInfo]()
let restAPI = RestAPI()
// 온도 일 그래프
func temhour() -> [Double]{
    var tem:[Double] = []
    db = restAPI.GET_HourAll()
    for index in db {
        tem.append(index.temperature)
    }
    return tem
}
// 습도 일 그래프
func humhour() -> [Double]{
    var hum:[Double] = []
    db = restAPI.GET_HourAll()
    for index in db {
        hum.append(index.humidity)
    }
    return hum
}
// 미세먼지 일 그래프
func dusthour() -> [Double]{
    var dust:[Double] = []
    db = restAPI.GET_HourAll()
    for index in db {
        dust.append(index.dust)
    }
    return dust
}
// 미세먼지 일 그래프
func co2hour() -> [Double]{
    var co2:[Double] = []
    db = restAPI.GET_HourAll()
    for index in db {
        co2.append(index.CO2)
    }
    return co2
}

// 주 그래프
// 월 그래프
//func temday() -> [Double]{
//    var tem:[Double] = []
//    db = restAPI.GET_DayAll()
//    for index in db {
//        tem.append(index.temperature)
//    }
//    return tem
//}
