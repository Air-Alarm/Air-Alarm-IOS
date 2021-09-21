//
//  HourAll.swift
//  Air-Alarm
//
//  Created by gibeom on 2021/09/21.
//

import Foundation

struct HourAll {
    /*
     id: DB 키값
     time:
     CO2:
     dust:
     humidity:
     temperature: 
     */
    
    init(id: Int, time: String, CO2: Float, dust: Float, humidity: Float, temperature: Float) {
        self.id = id
        self.time = time
        self.CO2 = CO2
        self.dust = dust
        self.humidity = humidity
        self.temperature = temperature
    }
    
    var id: Int
    var time: String
    var CO2: Float
    var dust: Float
    var humidity: Float
    var temperature: Float
    
}
