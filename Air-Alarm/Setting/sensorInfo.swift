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
