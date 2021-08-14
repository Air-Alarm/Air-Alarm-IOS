//
//  RootView.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/08/14.
//

import SwiftUI

struct RootView: View {
  @EnvironmentObject var authenticator: Authenticator

  var body: some View {
    ContentView()
      .fullScreenCover(isPresented: $authenticator.needsAuthentication) {
        LoginView()
          .environmentObject(authenticator) // see note
      }
  }
}
struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(Authenticator())
    }
}
