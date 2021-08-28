//
//  Signup.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/08/15.
//

import SwiftUI

struct Signup: View {
    
        @State private var action: Int? = 0
        @State private var userName: String = ""
        @State private var password: String = ""
        @State private var password2: String = ""
        @State private var email: String = ""
        @State private var sN: String = ""
        @State var TitleOfTab = AppMenu.AList.rawValue
        
        var body: some View {
            return NavigationView {
                VStack {
                    Text("회원가입")
                    
                    TextField("아이디", text: $userName)
                      .textFieldStyle(PlainTextFieldStyle())
                      .autocapitalization(.none)
                      .disableAutocorrection(true)
                    
                    SecureField("비밀번호", text: $password)
                      .textFieldStyle(PlainTextFieldStyle())
                    
                    SecureField("비밀번호확인", text: $password2)
                      .textFieldStyle(PlainTextFieldStyle())
                    
                    TextField("이메일", text: $email)
                      .textFieldStyle(PlainTextFieldStyle())
                    
                    TextField("기기S/N", text: $sN)
                      .textFieldStyle(PlainTextFieldStyle())
                    
                    back
                    login

            }
        }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

private extension Signup {
    
    var back: some View {
        HStack{
            Spacer()
            NavigationLink(
                destination: LoginView()
            ){
                Text("뒤로가기")
            }
            Spacer()
        }.padding()
    }
    
    var login: some View {
        HStack{
            Spacer()
            NavigationLink( destination: MainTabView(TitleOfNavi: $TitleOfTab)
                                .navigationBarHidden(false)
                                .navigationBarBackButtonHidden(true)
                                .navigationBarTitle(Text(TitleOfTab), displayMode: .inline)
                                .navigationBarItems(leading: ChangeleadingItem(TitleOfTab), trailing: ChangetrailingItem(TitleOfTab))
            ){
                Text("가입하기")
            }
            Spacer()
        }.padding()
    }
}

extension UINavigationController {

  open override func viewWillLayoutSubviews() {
    navigationBar.topItem?.backButtonDisplayMode = .minimal
  }

}

struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        Signup()
    }
}
