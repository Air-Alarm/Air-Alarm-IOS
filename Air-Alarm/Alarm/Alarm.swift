//
//  Alarm.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/09/22.
//

import SwiftUI

struct Alarm: View {
    var body: some View {
        NavigationView {
            VStack{
                List {
                    Text("1")
                    Text("2")
                    Text("3")
                }
            }
        }
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(false)
        .navigationBarTitle(Text("알림"), displayMode: .inline)
        .navigationBarColor(.white)
    }
}

struct Alarm_Previews: PreviewProvider {
    static var previews: some View {
        Alarm()
    }
}
