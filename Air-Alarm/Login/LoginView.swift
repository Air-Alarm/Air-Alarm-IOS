//
//  LoginView.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/08/14.
//

import SwiftUI

class Authenticator: ObservableObject {
  @Published var needsAuthentication: Bool
  @Published var isAuthenticating: Bool

  init() {
    self.needsAuthentication = true
    self.isAuthenticating = false
  }

  func login(username: String, password: String) {
    self.isAuthenticating = true
    // emulate a short delay when authenticating
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
      self.isAuthenticating = false
      self.needsAuthentication = false
    }
  }

  func logout() {
    self.needsAuthentication = true
  }
}

struct LoginView: View {
  @EnvironmentObject var authenticator: Authenticator

  @State private var userName: String = ""
  @State private var password: String = ""

  var body: some View {
    ZStack {
      Color.white
        .ignoresSafeArea(.all)
      VStack {
        Text("Please log in")
          .font(.title2)
        TextField("User name", text: $userName)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .autocapitalization(.none)
          .disableAutocorrection(true)
        SecureField("Password", text: $password)
          .textFieldStyle(RoundedBorderTextFieldStyle())
        Button(authenticator.isAuthenticating ? "Please wait" : "Log in"
) {
          authenticator.login(username: userName, password: password)
        }
        .disabled(isLoginDisabled)
        ProgressView()
          .progressViewStyle(CircularProgressViewStyle())
          .opacity(authenticator.isAuthenticating ? 1.0 : 0.0)
      }
      .frame(maxWidth: 320)
      .padding(.horizontal)
    }
  }

  private var isLoginDisabled: Bool {
    authenticator.isAuthenticating || userName.isEmpty || password.isEmpty
  }
}

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

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
      .environmentObject(Authenticator())
  }
}
