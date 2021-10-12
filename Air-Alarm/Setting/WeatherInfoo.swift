//
//  WeatherInfoo.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/10/12.
//

import SwiftUI

struct WeatherInfoo: View {
    
    var body: some View {
            VStack {
                Text("지역 날씨 API 정보")
                Text("공공데이터포털 미세먼지 API")
            }
            .background(Color.white)
            .navigationBarHidden(false)
            .navigationBarBackButtonHidden(false)
    }
}
struct WeatherInfo_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInfoo()
    }
}
