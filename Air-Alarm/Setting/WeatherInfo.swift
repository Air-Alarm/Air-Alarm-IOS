//
//  WeatherInfo.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/09/28.
//

import SwiftUI

struct WeatherInfo: View {
    
    var body: some View {
            VStack {
              Text("지역 날씨 API 정보")
            }
            .background(Color.white)
            .navigationBarHidden(false)
            .navigationBarBackButtonHidden(false)
    }
}
struct WeatherInfo_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInfo()
    }
}
