//
//  WeatherInfo.swift
//  Air-Alarm
//
//  Created by Jinhee on 2021/10/12.
//

import Foundation

struct WeatherInfo: Codable {
    /*
     id: DB 키값
     time: 시간
     dust: 먼지
     humidity: 습도
     temperature: 온도
     */
    
    init(Location: String = "", dust10: Int = 0, dust25: Int = 0, humidity: Double = 0.0, id: Int = 0, temperature: Double = 0.0, time: String = "") {
        self.Location = Location
        self.dust10 = dust10
        self.dust25 = dust25
        self.humidity = humidity
        self.id = id
        self.temperature = temperature
        self.time = time
    }
    
    var Location: String
    var dust10: Int
    var dust25: Int
    var humidity: Double
    var id: Int
    var temperature: Double
    var time: String
}