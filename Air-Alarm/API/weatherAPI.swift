//
//  weatherAPI.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/09/14.
//

import Foundation

class RestweatherAPI {
    struct WeatherInfo: Codable {
        var Location: String = ""
        var dust10: Int = 0
        var dust25: Int = 0
        var humidity: Double = 0.0
        var id: Int = 0
        var temperature: Double = 0.0
        var time: String = ""
    }
    
    var wdb = WeatherInfo()
    
    // 객체에 데이터 저장하기
    func GET() -> WeatherInfo {
        if let url = URL(string: "http://mirsv.com:5000/weather") {
            var request = URLRequest.init(url: url)

            request.httpMethod = "GET"

            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else { return }

                // data
                let decoder = JSONDecoder()
                if let json = try? decoder.decode(WeatherInfo.self, from: data) {
                    self.wdb = json
                }
            }.resume()
        }
        
        return self.wdb
    }
}
