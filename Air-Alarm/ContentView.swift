//
//  ContentView.swift
//  Air-Alarm
//
//  Created by byungwoo on 2021/08/06.
//

import SwiftUI

struct ContentView: View {
    
    private enum Tabs {
        case AList, BList, CList
    }
    
    @EnvironmentObject var authenticator: Authenticator
    @State private var userName: String = ""
    @State private var password: String = ""

    var body: some View {
        
        return NavigationView {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all) //전체화면 색상
                
                VStack{
                    Image("icon")
                        .resizable()
                        .frame(width: 100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center)
                        .padding()
                    TextField("아이디/Email", text: $userName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    SecureField("비밀번호", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    HStack{
                        login //로그인 버튼
                        SignUpView //회원가입 창
                    }
                }
                .frame(maxWidth: 320)
                .padding(.horizontal)
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
}

  private var isLoginDisabled: Bool {
    authenticator.isAuthenticating || userName.isEmpty || password.isEmpty
  }
}

private extension ContentView {
    
    var login: some View {
        VStack{
            Spacer()
            
            NavigationLink(
                destination: MainTabView()
                    .navigationBarHidden(false)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarTitle(Text("Air Alarm"), displayMode: .inline)    // tab 이름
                    .navigationBarItems(leading: ChangeleadingItem(), trailing: ChangetrailingItem())
                    .navigationBarColor(.white)
                    
            ){
//                Button (action:{}){
//                    Text("로그인")
//                }
//             아이디 비밀번호 확인하는 버튼 + 시간 표시 돌아가는 효과
                Button(
                    authenticator.isAuthenticating ? "Please wait" : "로그인"
                ) {
                    authenticator.login(username: userName, password: password)
                    }
                .disabled(isLoginDisabled)
                .font(.headline)
                .foregroundColor(.blue)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.blue, lineWidth: 1)
                        .frame(width: 90, height: 50)
                )
    //            ProgressView() // 시간 표시 돌아가는 것
    //                .progressViewStyle(CircularProgressViewStyle())
    //                .opacity(authenticator.isAuthenticating ? 1.0 : 0.0)
            }
            Spacer()
        }.padding()
    }
    
    var SignUpView: some View {
        VStack{
            Spacer()
            NavigationLink(
                destination: Signup()
            ){
                Text("회원가입")
                    .font(.headline)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(40)
            }
            Spacer()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Authenticator())
    }
}
