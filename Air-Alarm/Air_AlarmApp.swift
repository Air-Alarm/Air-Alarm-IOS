//
//  Air_AlarmApp.swift
//  Air-Alarm
//
//  Created by gibeom on 2021/08/06.
//

import SwiftUI

@main
struct Air_AlarmApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
              .environmentObject(Authenticator())
        }
    }
}
