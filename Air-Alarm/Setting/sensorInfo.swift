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
            VStack {
                
                Text("센서 측정 주기")
                Text("매 10초마다 측정")
                Text("단위 정보")
                Text("미세먼지(㎍/㎥), Co2(ppm), 온도('C), 습도(%)")
                
            }
            .background(Color.white)
            .navigationBarHidden(false)
            .navigationBarBackButtonHidden(false)
    }
}

struct sensorInfo_Previews: PreviewProvider {
    static var previews: some View {
        sensorInfo()
    }
}
