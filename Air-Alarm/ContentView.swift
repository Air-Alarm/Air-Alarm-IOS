//
//  ContentView.swift
//  Air-Alarm
//
//  Created by gibeom on 2021/08/06.
//

import SwiftUI

struct ContentView: View {
    struct Database: Codable {
        var CO2: Double = 0.0
        var dust: Double = 0.0
        var humidity: Double = 0.0
        var id: Int = 0
        var temperature: Double = 0.0
        var time: String = ""
    }
    @State var db = Database()
    
    // 객체에 데이터 저장하기
    func GET(){
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
    
    var body: some View {
        VStack {
            Button(action: GET){
                Text("버튼")
            }
            Text("CO2: " + String(db.CO2))
            Text("Dust: " + String(db.dust))
            Text("Humidity: " + String(db.humidity))
            Text("ID: " + String(db.id))
            Text("Temperature: " + String(db.temperature))
            Text("Time: " + db.time)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
