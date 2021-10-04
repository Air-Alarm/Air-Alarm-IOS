//
//  Alarm.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/09/22.
//

import SwiftUI

struct Alarm: View {
    func setNotification() {
        let manager = LocalNotificationManager()
        manager.addNotification(title: "This is a test reminder")
        manager.schedule()
    }
    
    var body: some View {
//        NavigationView {
//            VStack {
//                Text("Notification Demo")
//            }
//        }
//        .navigationBarHidden(false)
//        .navigationBarBackButtonHidden(false)
//        .navigationBarTitle(Text("알림"), displayMode: .inline)
//        .navigationBarColor(.white)
        VStack{
            Button(action: { self.setNotification() }
            ) {
                    Text("Set Notification!")
            }
        }
    }
}

struct Alarm_Previews: PreviewProvider {
    static var previews: some View {
        Alarm()
    }
}
