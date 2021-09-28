//
//  WeatherInfo.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/09/28.
//

import SwiftUI

struct WeatherInfo: View {
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
struct WeatherInfo_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInfo()
    }
}
