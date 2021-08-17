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

  var body: some View {
    return NavigationView {
        ZStack {

            Color.white.edgesIgnoringSafeArea(.all) //전체화면 색상
            
            VStack{
                TextField("아이디", text: $userName)
                  .textFieldStyle(RoundedBorderTextFieldStyle())
                  .autocapitalization(.none)
                  .disableAutocorrection(true)
                SecureField("비밀번호", text: $password)
                  .textFieldStyle(RoundedBorderTextFieldStyle())
                
                //로그인 버튼
                Button(authenticator.isAuthenticating ? "Please wait" : "로그인"
        ) {
                  authenticator.login(username: userName, password: password)

                }
                .disabled(isLoginDisabled)
                ProgressView() // 시간 표시 돌아가는 것
                  .progressViewStyle(CircularProgressViewStyle())
                  .opacity(authenticator.isAuthenticating ? 1.0 : 0.0)
                
                SignUpView //회원가입 창
            }
            .frame(maxWidth: 320)
            .padding(.horizontal)
        }
    }
}

  private var isLoginDisabled: Bool {
    authenticator.isAuthenticating || userName.isEmpty || password.isEmpty
  }
}

private extension LoginView {
    
    var SignUpView: some View {
        HStack{
            Spacer()
            NavigationLink(
                destination: Signup()
            ){
                Text("회원가입")
            }
            Spacer()
        }.padding()
    }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
      .environmentObject(Authenticator())
  }
}
