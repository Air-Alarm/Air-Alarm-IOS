//
//  Weather.swift
//  Air-Alarm
//
//  Created by gibeom on 2021/10/10.
//

import Foundation

struct Weather: Codable {
    init(location: String = "", dust10: Int = 0, dust25: Int = 0, humidity: Double = 0.0, id: Int = 0, temperature: Double = 0, time: String = ""){
        self.location = location
        self.dust10 = dust10
        self.dust25 = dust25
        self.humidity = humidity
        self.id = id
        self.temperature = temperature
        self.time = time
    }
    
    var location: String
    var dust10: Int
    var dust25: Int
    var humidity: Double
    var id: Int
    var temperature: Double
    var time: String
}
