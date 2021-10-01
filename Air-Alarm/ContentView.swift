//
//  ContentView.swift
//  Air-Alarm
//
//  Created by byungwoo on 2021/08/06.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var authenticator: Authenticator
    @State var signInSuccess = false
    
    var body: some View {
        // 로그인 조건
        return Group {
            if signInSuccess {
                MainTabView()
            }
            else {
                ContentLogin(signInSuccess: $signInSuccess)
            }
        }
    }
}

//  private var isLoginDisabled: Bool {
//    authenticator.isAuthenticating || userName.isEmpty || password.isEmpty
//  }
//}

  
//struct AppHome: View {
//
//    var body: some View {
//        VStack {
//            Text("Hello freaky world!")
//            Text("You are signed in.")
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Authenticator())
    }
}
