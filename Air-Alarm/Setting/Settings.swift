//
//  Settings.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/09/14.
//

import SwiftUI

struct Settings: View {

    var body: some View {
        TabView{
            Settings()
                .tabItem { Label("Setting", systemImage: "gearshape") }
                .navigationBarHidden(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
        }
        NavigationView {
            VStack{
                List {
                    myInfofo
                    changeSNN
                    sensorInfoo
                    weatherAPII
                    programmerInfofo
                }
//                Button(action: ContentView
//                ){
//                        Text("로그아웃")
//                            .font(.headline)
//                            .padding()
//                            .foregroundColor(.red)
//                            .cornerRadius(40)
//                }
            }
       }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(false)
        .navigationBarTitle(Text("Setting"), displayMode: .inline)
        .navigationBarColor(.white)
    }
}

private extension Settings {

    var myInfofo: some View {
        NavigationLink(
            destination: myInfo()
        
        ) {
            Text("내 정보")
                .font(.headline)
                .padding()
        }
    }
    
    var changeSNN: some View {
        NavigationLink(
            destination: changeSN()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        
        ) {
            Text("S/N 변경")
                .font(.headline)
                .padding()
        }
    }
    
    var sensorInfoo: some View {
        NavigationLink(
            destination: sensorInfo()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        
        ){
            Text("센서 측정 주기 / 단위 정보")
                .font(.headline)
                .padding()
        }
    }
    
    var weatherAPII: some View {
        NavigationLink(
            destination: weatherAPI()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        
        ){
            Text("지역 날씨 API 정보")
                .font(.headline)
                .padding()
        }
    }
    
    var programmerInfofo: some View {
        NavigationLink(
            destination: programmerInfo()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        
        ){
            Text("개발자 정보")
                .font(.headline)
                .padding()
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
