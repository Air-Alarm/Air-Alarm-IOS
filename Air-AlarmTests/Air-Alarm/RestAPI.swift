//
//  RestAPI.swift
//  Air-Alarm
//
//  Created by gibeom on 2021/08/14.
//

import Foundation

class RestAPI {
    struct Database: Codable {
        var CO2: Double = 0.0
        var dust: Double = 0.0
        var humidity: Double = 0.0
        var id: Int = 0
        var temperature: Double = 0.0
        var time: String = ""
    }
    var db = Database()
    
    // 객체에 데이터 저장하기
    func GET() -> Database {
        if let url = URL(string: "http://mirsv.com:5000/get") {
            var request = URLRequest.init(url: url)

            request.httpMethod = "GET"

            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else { return }

                // data
                let decoder = JSONDecoder()
                if let json = try? decoder.decode(Database.self, from: data) {
                    self.db = json
                }
            }.resume()
        }
        
        return self.db
    }
    
    // 변수에 데이터 직접 저장하긴
//    func GET1(){
//        if let url = URL(string: "http://mirsv.com:5000/get") {
//            var request = URLRequest.init(url: url)
//
//            request.httpMethod = "GET"
//
//            URLSession.shared.dataTask(with: request) { (data, response, error) in
//                guard let data = data else { return }
//
//                // data
//                if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] {
//                    print("json에 데이터 들어감")
//                    print(json["CO2"]!)
//                    self.textView = json["CO2"]! as! Int
//                }
//            }.resume()
//        }
//    }
}
