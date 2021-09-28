//
//  sensorInfo.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/09/14.
//

import SwiftUI

class RestAPI_sensorInfo {
    struct SensorInfo: Codable {
        var SN: String = ""
}

    var sensor_db = SensorInfo()

    // 객체에 데이터 저장하기
    func GET() -> SensorInfo {
        if let url = URL(string: "http://mirsv.com:4999/get") {
            var request = URLRequest.init(url: url)

            request.httpMethod = "GET"

            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else { return }

                // data
                let decoder = JSONDecoder()
                if let json = try? decoder.decode(SensorInfo.self, from: data) {
                    self.sensor_db = json
                }
            }.resume()
        }

        return self.sensor_db
    }
}

struct sensorInfo: View {
    let restAPI = RestAPI_sensorInfo()
    @State var sensor_db = RestAPI_sensorInfo.SensorInfo()
    
    func update() {
        self.sensor_db = restAPI.GET()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                ProfileImage(imageName: "icon")
                        .padding()
                Form {
                    Section(header: Text("Sensor Info")) {
                        Text("SN :  " + String(sensor_db.SN))
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

struct sensorInfo_Previews: PreviewProvider {
    static var previews: some View {
        sensorInfo()
    }
}
