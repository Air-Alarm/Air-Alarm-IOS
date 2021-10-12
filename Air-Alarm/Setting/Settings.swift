//
//  Settings.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/09/14.
//

import SwiftUI

struct Settings: View {
    @Environment(\.presentationMode) var presentationMode
    let restApi = RestAPI()
    @State private var member = Login.init()
    @State var signInSuccess: Bool
    
    var body: some View {
        NavigationView {
            VStack{
                List {
                    myInfofo
                    changeSNN
                    sensorInfofo
                    weatherInfofo
                    programmerInfofo
//                    NavigationLink(
//                        destination: ContentView(),
//                        label: {
//                            Text("로그아웃")
//                                .font(.headline)
//                                .padding()
//                                .foregroundColor(.red)
//                                .cornerRadius(40)
//                        })
                    Button(action: {
                        
                        var trigger = self.restApi.GET_Login(member: self.member)
                        print("trigger info >> ", trigger)
                        
                        if !trigger.success {
                            self.signInSuccess = false
                            print("trigger info >> ", trigger)
                        }
                    }){
                            Text("로그아웃")
                                .font(.headline)
                                .padding()
                                .foregroundColor(.red)
                                .cornerRadius(40)
                    }
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }){
                        Text("Back")
 //                       navigationBarBackButtonHidden(true)
                    }
                }
            }
       }
        .navigationBarTitle(Text("Setting"), displayMode: .inline)
        .navigationBarColor(.white)
    }
}

private extension Settings {

    var myInfofo: some View {
        NavigationLink(
            destination: myInfo()
                .navigationBarHidden(false)
                .navigationBarBackButtonHidden(false)
        
        ) {
            Text("내 정보")
                .font(.headline)
                .padding()
        }
    }
    
    var changeSNN: some View {
        NavigationLink(
            destination: changeSN()
                .navigationBarHidden(false)
                .navigationBarBackButtonHidden(false)
        
        ) {
            Text("S/N 변경")
                .font(.headline)
                .padding()
        }
    }
    
    var sensorInfofo: some View {
        NavigationLink(
            destination: sensorInfo()
                .navigationBarHidden(false)
                .navigationBarBackButtonHidden(false)
        
        ){
            Text("센서 측정 주기 / 단위 정보")
                .font(.headline)
                .padding()
        }
    }
    
    var weatherInfofo: some View {
        NavigationLink(
            destination: WeatherInfoo()
                .navigationBarHidden(false)
                .navigationBarBackButtonHidden(false)
        
        ){
            Text("지역 날씨 API 정보")
                .font(.headline)
                .padding()
        }
    }
    
    var programmerInfofo: some View {
        NavigationLink(
            destination: programmerInfo()
                .navigationBarHidden(false)
                .navigationBarBackButtonHidden(false)
        
        ){
            Text("개발자 정보")
                .font(.headline)
                .padding()
        }
    }
}

//struct Settings_Previews: PreviewProvider {
//    static var previews: some View {
//        Settings()
//    }
//}
