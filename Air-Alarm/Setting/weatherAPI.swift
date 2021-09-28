//
//  weatherAPI.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/09/14.
//

import SwiftUI

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
        if let url = URL(string: "mirsv.com:5000/weather") {
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

struct weatherAPI: View {
    let restAPI = RestweatherAPI()
    @State var wdb = RestweatherAPI.WeatherInfo()
    
    func update() {
        self.wdb = restAPI.GET()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
//                ProfileImage(imageName: "icon")
//                        .padding()
                Form {
                    Section(header: Text("Location")) {
                        Text("Location :  " + String(wdb.Location))
                    }
                    Section(header: Text("dust 10")) {
                        Text("dust10 :  " + String(wdb.dust10))
                    }
                    Section(header: Text("dust 25")) {
                        Text("dust25 :  " + String(wdb.dust25))
                    }
                    Section(header: Text("humidity")) {
                        Text("humidity :  " + String(wdb.humidity))
                    }
                    Section(header: Text("id")) {
                        Text("id :  " + String(wdb.id))
                    }
                    Section(header: Text("temperature")) {
                        Text("temperature :  " + String(wdb.temperature))
                    }
                    Section(header: Text("time")) {
                        Text("time :  " + String(wdb.time))
                    }
                }
    //            Text("\(json)")//웹에서 받아온 내용이 여기 저장됨
    //                .padding()
                
            }
            .background(Color.white)
        }
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(false)
    }
}

struct weatherAPI_Previews: PreviewProvider {
    static var previews: some View {
        weatherAPI()
    }
}
