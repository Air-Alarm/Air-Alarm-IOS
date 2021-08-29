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
        
        var body: some View {
            return NavigationView {
                VStack {
                    
                    UnderlineTextFieldView(text: $userName, textField: textView, placeholder: "")
                        .padding(.top, 50)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                                        
                    UnderlineTextFieldView(text: $password, textField: passwordView, placeholder: "")
                        .padding(.top, 10)
                    UnderlineTextFieldView(text: $password2, textField: password2View, placeholder: "")
                        .padding(.top, 10)
                    UnderlineTextFieldView(text: $email, textField: emailView, placeholder: "")
                        .padding(.top, 10)
                    UnderlineTextFieldView(text: $sN, textField: snView, placeholder: "")
                        .padding(.top, 10)
                    
                    HStack{
                        back
                        login
                    }
            }
                // navigationBar 
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                         HStack {
                             Text("회원가입")
                                .foregroundColor(.blue)
                                .bold()
                         }
                     }
                 }
                .navigationBarColor(.white)
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

private extension Signup {
    // TextField 정보
     var textView: some View {
          TextField("아이디", text: $userName)
            .foregroundColor(.black)
     }

     var passwordView: some View {
          SecureField("비밀번호", text: $password)
            .foregroundColor(.black)
     }
    
    var password2View: some View {
         SecureField("비밀번호확인", text: $password2)
            .foregroundColor(.black)
    }
    var emailView: some View {
         TextField("Email", text: $email)
            .foregroundColor(.black)
            .keyboardType(.emailAddress)
            .autocapitalization(.none)
    }
    var snView: some View {
         TextField("기기 S/N", text: $sN)
            .foregroundColor(.black)
    }
    // 뒤로가기 버튼
    var back: some View {
        VStack{
            Spacer()
            NavigationLink(
                destination: ContentView()
            ){
                Text("뒤로가기")
                    .font(.headline)
                    .foregroundColor(.blue)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.blue, lineWidth: 1)
                            .frame(width: 90, height: 50)
                    )
            }
            Spacer()
        }.padding()
    }
    // 가입하기 버튼
    var login: some View {
        VStack{
            Spacer()
            NavigationLink( destination: ContentView()
            ){
                Text("가입하기")
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

struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        Signup()
    }
}
