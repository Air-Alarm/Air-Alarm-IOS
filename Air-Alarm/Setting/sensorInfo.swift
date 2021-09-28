//
//  sensorInfo.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/09/14.
//

import SwiftUI

struct sensorInfo: View {
    let restAPI = RestSignAPI()
    @State var sensor_db = RestSignAPI.SignInfo()
    
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
