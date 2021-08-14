//
//  LoginView.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/08/14.
//

import SwiftUI

struct LoginView: View {
  @EnvironmentObject var authenticator: Authenticator

  @State private var userName: String = ""
  @State private var password: String = ""
    @State private var action: Int? = 0

  var body: some View {
    ZStack {
      Color.white
        .ignoresSafeArea(.all)
      VStack {
        TextField("아이디", text: $userName)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .autocapitalization(.none)
          .disableAutocorrection(true)
        SecureField("비밀번호", text: $password)
          .textFieldStyle(RoundedBorderTextFieldStyle())
        
        NavigationView { // 수정필요
            NavigationLink(
                destination: Signup(), tag: 1, selection: $action
            ){
                Text("회원가입")
            }
        }
        Button(authenticator.isAuthenticating ? "Please wait" : "로그인"
) {
          authenticator.login(username: userName, password: password)

        }
        .disabled(isLoginDisabled)
        ProgressView() // 시간 표시 돌아가는 것
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

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
      .environmentObject(Authenticator())
  }
}
