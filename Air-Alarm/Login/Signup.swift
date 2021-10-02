//
//  Signup.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/08/15.
//

import SwiftUI


struct Signup: View {
    let signAPI = Api()
    @State private var action: Int? = 0
    @State var signUp = Api.User()
    @State var actionn: Int? = nil
    @Binding var showingSignUp: Bool
        
    func signUpup() {
        signAPI.GET(signUp: self.signUp)
            print("ffff")
        }
    
        var body: some View {

            return NavigationView {
                VStack {
                    
                    UnderlineTextFieldView(text: $signUp.email, textField: emailView, placeholder: "")
                        .padding(.top, 50)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
//                    UnderlineTextFieldView(text: $signUp.user, textField: textView, placeholder: "")
//                        .padding(.top, 50)
//                        .autocapitalization(.none)
//                        .disableAutocorrection(true)
//
                    UnderlineTextFieldView(text: $signUp.pwd, textField: passwordView, placeholder: "")
                        .padding(.top, 10)
                    UnderlineTextFieldView(text: $signUp.SN, textField: snView, placeholder: "")
                        .padding(.top, 10)
                    
                    HStack{
//                        back
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
    var emailView: some View {
        TextField("Email", text: $signUp.email)
            .foregroundColor(.black)
            .keyboardType(.emailAddress)
            .autocapitalization(.none)
    }
//     var textView: some View {
//          TextField("아이디", text: $signUp.user)
//            .foregroundColor(.black)
//     }

     var passwordView: some View {
          SecureField("비밀번호", text: $signUp.pwd)
            .foregroundColor(.black)
     }
    var snView: some View {
        TextField("기기 S/N", text: $signUp.SN)
            .foregroundColor(.black)
    }
    // 뒤로가기 버튼
//    var back: some View {
//        VStack{
//            Spacer()
//            NavigationLink(
//                destination: ContentView()
//            ){
//                Text("뒤로가기")
//                    .font(.headline)
//                    .foregroundColor(.blue)
//                    .padding()
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 30)
//                            .stroke(Color.blue, lineWidth: 1)
//                            .frame(width: 90, height: 50)
//                    )
//            }
//            Spacer()
//        }.padding()
//    }
    // 가입하기 버튼
    var login: some View {
        VStack{
            Spacer()
            
//            NavigationLink(destination: ContentView(), tag: 10, selection: $actionn) {
//                EmptyView()
//            }
//
//            Button ( action: {
//                signUpup()
//                self.actionn = 10
//            }
//            ){
//                Text("가입하기")
//                    .font(.headline)
//                    .foregroundColor(.blue)
//                    .padding()
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 30)
//                            .stroke(Color.blue, lineWidth: 1)
//                            .frame(width: 90, height: 50)
//                    )
//            }
            
            Button(
                action: {self.showingSignUp = false}
            ){
                Text("가입하기")
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
}

//struct ModalPopup : View {
//    @Binding var showing:Bool
//
//    var body: some View {
//        Button(action: {
//            self.showing = false
//        }) {
//            Text("Dismiss").frame(height: 60)
//        }
//    }
//}

//struct Signup_Previews: PreviewProvider {
//    static var previews: some View {
//        Signup()
//    }
//}
