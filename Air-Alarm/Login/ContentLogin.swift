//
//  ContentLogin.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/09/29.
//

import SwiftUI

struct ContentLogin: View {
    // 로그인 관련
    @State private var member = Login.init()    // 로그인 관련 member
    @State private var userName: String = ""
    @State private var password: String = ""
    @State private var showError = false        // 로그인 관련 메시지
    @Binding var signInSuccess: Bool
    // 회원가입 관련
    @State var showingSignUp = false
    let restApi = RestAPI()
    
    
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all) //전체화면 색상
            
            VStack{
                Image("icon")
                    .resizable()
                    .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                    .padding()
                TextField("아이디/Email", text: $member.id)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                SecureField("비밀번호", text: $member.pwd)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                HStack{
                    Button(action: {
                        var trigger = self.restApi.GET_Login(member: self.member)
                        print("trigger info >> ", trigger)
                        // Your auth logic
//                        if(self.userName == self.password) {
//                            self.signInSuccess = true
//                        }
//                        else {
//                            self.showError = true
//                        }
                        
                        if trigger.success {
                            self.signInSuccess = true
                        }else{
                            self.showError = true
                        }
                        }) {
                            Text("로그인")
                                .font(.headline)
                                .foregroundColor(.blue)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.blue, lineWidth: 1)
                                        .frame(width: 90, height: 50)
                                )
                        }.padding()

                    Button(action: {
                        self.showingSignUp.toggle()
                    }) {
                        Text("회원가입")
                            .font(.headline)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(40)
                    }.sheet(
                        isPresented: $showingSignUp,
                        content: {
                            Signup(showingSignUp: self.$showingSignUp)
                        }
                    )
                    .padding()
                }
                    if showError {
                        Text("아이디 또는 비밀번호를 잘못 입력했습니다.")
                            .foregroundColor(Color.red)
                    }
            }
            .frame(maxWidth: 320)
            .padding(.horizontal)
        }
    }
}

//private extension ContentLogin {
//
//var login: some View {
//    VStack{
//        Button(action: {
//            MainTabView()
//        }, label: {
//            Text("Button")
//        })
////            Spacer()
////
////            NavigationLink(
////                destination: MainTabView()
////                    .navigationBarHidden(false)
////                    .navigationBarBackButtonHidden(true)
////                    .navigationBarTitle(Text("Air Alarm"), displayMode: .inline)    // tab 이름
////                    .navigationBarItems(leading: ChangeleadingItem(), trailing: ChangetrailingItem())
////                    .navigationBarColor(.white)
////
////            ){
//////                Button (action:{
//////                    self.action()
//////                }){
//////                    Text("로그인")
//////                }
//////             아이디 비밀번호 확인하는 버튼 + 시간 표시 돌아가는 효과
////                Button(
////                    authenticator.isAuthenticating ? "Please wait" : "로그인"
////                ) {
////                    authenticator.login(username: userName, password: password)
////                    }
////                .disabled(isLoginDisabled)
////                .font(.headline)
////                .foregroundColor(.blue)
////                .padding()
////                .overlay(
////                    RoundedRectangle(cornerRadius: 30)
////                        .stroke(Color.blue, lineWidth: 1)
////                        .frame(width: 90, height: 50)
////                )
////    //            ProgressView() // 시간 표시 돌아가는 것
////    //                .progressViewStyle(CircularProgressViewStyle())
////    //                .opacity(authenticator.isAuthenticating ? 1.0 : 0.0)
////            }
////            Spacer()
//        }.padding()
//    }
//
//    var SignUpView: some View {
//        VStack{
//            Spacer()
//            NavigationLink(
//                destination: Signup()
//            ){
//                Text("회원가입")
//                    .font(.headline)
//                    .padding()
//                    .foregroundColor(.white)
//                    .background(Color.blue)
//                    .cornerRadius(40)
//            }
//            Spacer()
//        }.padding()
//    }
//}
