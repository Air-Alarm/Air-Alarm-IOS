//
//  ContentView.swift
//  Air-Alarm
///Users/gibeom/git/Air-Alarm/Air-Alarm/ContentView.swift
//  Created by byungwoo on 2021/08/06.
//

import SwiftUI

let restApi = RestAPI()

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
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding()
                  TextField("아이디", text: $userName)
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
    // 로그인 성공 여부에 따라 화면 전환
    func verity(userName: String, pwd: String) -> AnyView {
        let db: LoginSuccess = restApi.GET_Login(member: Login.init(id: userName, pwd: pwd))
        print(db)
        // 로그인 성공 시 메인 뷰로 넘어가기
        if (!db.success) {
            return AnyView(MainTabView()
                .navigationBarHidden(false)
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle(Text("Air Alarm"), displayMode: .inline) // tab 이름
                .navigationBarItems(leading: ChangeleadingItem(), trailing: ChangetrailingItem()))
        }else{ // 로그인 성공 실패 시 다시 로그인 뷰
            return AnyView(ContentView())
        }
    }
    
    var login: some View {
        VStack{
            Spacer()
            
            NavigationLink(
                destination: verity(userName: self.userName, pwd: self.password)
            ){
//             아이디 비밀번호 확인하는 버튼 + 시간 표시 돌아가는 효과
                Button(
                    action: {}
                ) {
                    Text("로그인")
                    }
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
