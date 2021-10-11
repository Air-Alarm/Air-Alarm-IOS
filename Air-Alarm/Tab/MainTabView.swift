//
//  MainTabView.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/08/06.
//

import SwiftUI

// 하단 Tab2
struct MainTabView: View {
    var body: some View {
        HeaderTabView()
        TabView {
            AListView()
                .tabItem{ Label( "", systemImage: "thermometer")  }
                .navigationBarHidden(false)
            BList()
                .tabItem{ Label( "", systemImage: "thermometer") }
                .navigationBarHidden(false)
            CList()
                .tabItem{ Label( "", systemImage: "thermometer") }
                .navigationBarHidden(false)
        }
    }
}

struct HeaderTabView: View {
    // notification 관련 필드, 메소드
    @State var showingAlarm = false
    let restAPI = RestAPI()
    @State var db = DustInfo.init()
    
    func update() {
        self.db = restAPI.GET_Dust()
    }
    
    func setNotification() {             // 알림
        let manager = LocalNotificationManager()
        if (db.CO2 > 1000){
            manager.addNotification(title: "이산화 탄소량이 높습니다.")
        }
        if (db.dust > 100){
            manager.addNotification(title: "미세먼지 농도가 높습니다.")
        }
        manager.schedule()
        self.showingAlarm.toggle()
    }
    // settings 관련 필드
    @State var showingSettings = false
    
    var body: some View {
//        NavigationView{
            HStack {
                Image("icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .padding(10)
                Spacer()
                Text("Air Alarm")
                    .foregroundColor(Color.blue)
                Spacer()
                Button(action: {
                    self.showingSettings.toggle()
                })
                {
                    Image(systemName: "gearshape")
                }.fullScreenCover(isPresented: $showingSettings,content: { Settings( signInSuccess: false) })
//                .sheet(isPresented: $showingSettings) {
//                    Settings()
//                }
                Button(action: {
                    self.setNotification()
                }
                ){
                    Image(systemName: "bell")
                }.sheet(isPresented: $showingAlarm) {
                    Alarm()
                }
                .padding(10)
            }//.frame(height: Header.navigationBarHeight)
 //       }
    }
}

//                NavigationLink(
//                    destination: Settings()
//                        .navigationBarHidden(false)
//                        .navigationBarBackButtonHidden(false)
//
//                ) {
//                    Image(systemName: "gearshape")
//                        .padding()
//                }

//.navigationBarHidden(false)
//.navigationBarBackButtonHidden(true)
//.navigationBarTitle(Text("Air Alarm"), displayMode: .inline)    // tab 이름
//.navigationBarItems(leading: ChangeleadingItem(), trailing: ChangetrailingItem())
//.navigationBarColor(.white)


// @State var showingSignUp = false
//Button(action: {
//    self.showingSignUp.toggle()
//}) {
//    Text("회원가입")
//        .font(.headline)
//        .padding()
//        .foregroundColor(.white)
//        .background(Color.blue)
//        .cornerRadius(40)
//}.sheet(isPresented: $showingSignUp) {
//    Signup()
//}

// 왼쪽 상단 Tab
//func ChangeleadingItem() -> AnyView {
//        return AnyView(
//            HStack{
//                Image("icon")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//    })
//}
//
//
//
// 오른쪽 상단 Tab
//    func ChangetrailingItem() -> AnyView {
//            return AnyView(
//                HStack{
//                    NavigationLink(
//                        destination: Settings(),
//                        label: {
//                            Image(systemName: "gearshape")
//                        }
//                    )
//                    NavigationLink(
//
//                        destination: Alarm(),
//                        label: {
//                            Image(systemName: "bell")
//                        }
//                    )
//                    .navigationBarHidden(true)
//                    .navigationBarBackButtonHidden(true)
//                }
//            )
//        }
