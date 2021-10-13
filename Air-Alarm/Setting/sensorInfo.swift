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
        ScrollView{
            Spacer()
            Text("Air-Alarm은 미세먼지(㎍/㎥), Co2(ppm), 온도('C), 습도(%)를 측정하여 제공합니다. ")
            Text("또한 기상청 공기질 데이터를 추가로 제공하고 있어, 우리집 공기질과 우리동네 공기질을 비교하여 볼 수 있게 제공하고 있습니다. ")
                .padding()
            Text("센서 측정 주기 \n Air-Alarm의 센서값은 매 10초마다 갱신되고 있으며, 1시간 평균, 매일 평균 값 또한 제공하고 있습니다.")
                .padding()
            Text("단위 정보")
                .fontWeight(.black)
            Text("Air-Alarm은 환경부 기준을 따르고 있습니다. WHO 기준은 전세계적 권고사항이므로 각 국가에 맞는 기준이라고 보기에는 어렵기 때문에 WHO 기준을 기반으로 환경부에서 만든 환경부 기준을 따르고 있습니다. 우리나라 기준이 너무 높다는 오해와 달리 공기질이 굉장히 깨끗하다고 할 수 있는 국가 기준인 3단계를 따르고 있기 때문에 안심하셔도 좋습니다. 이는 오히려 선진국인 미국 등에 비교했을 경우엔 오히려 훨씬 엄격한 기준입니다.")
                .padding()
            VStack{
                Text("이산화탄소(환경부 기준)")
                    .fontWeight(.black)
                    .padding()
                Text("350~450ppm 정상범주 - 일반 일상 속에서의 실외 공기")
                Text("450~1000ppm 다소 위험 - 공기가 맑고 호흡에 큰 지장은 없는 정도")
                Text("1000~2000ppm 위험 - 공기가 탁하게 느껴지고 잠이 많아짐")
                Text("2000~5000ppm 상당히 위험 - 머리가 아프고 잠이 많아지고 집중력이 떨어지며 심장 박동수가 빨라져 경미한 구토 유발 반응")
                Text("5000~ ppm 매우 위험 - 영구적인 뇌손상 혹은 심각한 경우 사망까지 이름")
            }.padding()
            VStack{
                Text("미세먼지(환경부 기준)")
                    .fontWeight(.black)
                    .padding()
                Text("0~30㎍/㎥ 좋음")
                Text("31~80㎍/㎥ 보통")
                Text("81~120㎍/㎥ 약간나쁨")
                Text("121~200㎍/㎥ 나쁨")
                Text("201~300㎍/㎥ 매우나쁨")
                Text("201~300㎍/㎥ 매우나쁨")
            }.padding()
            VStack{
                Text("초미세먼지(환경부 기준)")
                    .fontWeight(.black)
                    .padding()
                Text("0~15㎍/㎥ 좋음")
                Text("16~35㎍/㎥ 보통")
                Text("36~75㎍/㎥ 나쁨")
                Text("76~㎍/㎥ 매우나쁨")
            }
            .padding()
        }
    }
}

struct sensorInfo_Previews: PreviewProvider {
    static var previews: some View {
        sensorInfo()
    }
}
