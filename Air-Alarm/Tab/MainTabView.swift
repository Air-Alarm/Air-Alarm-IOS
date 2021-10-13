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
    
    func setNotification() { // 알림
        print("notification start")
        let manager = LocalNotificationManager()
        update()
        print(db.CO2)
        if (db.CO2 > 900){
            manager.requestPermission()
            manager.addNotification(title: "이산화 탄소량이 높습니다.")
            print("notification CO2 success")
        }
        if (db.dust > 100){
            manager.requestPermission()
            manager.addNotification(title: "미세먼지 농도가 높습니다.")
            print("notification Dust success")
        }
        manager.schedule()
        manager.scheduleNotifications()
        self.showingAlarm.toggle()
    }
    
    // settings 관련 필드
    @State var showingSettings = false
    
    var body: some View {
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
            }.fullScreenCover(isPresented: $showingSettings,content: { Settings() })
            Button(action: {
                self.setNotification()
            }
            ){
                Image(systemName: "bell")
            }.sheet(isPresented: $showingAlarm) {
                Alarm()
            }
            .padding(10)
        }
    }
}
