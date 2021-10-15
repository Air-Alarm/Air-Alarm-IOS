//
//  myInfo.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/09/14.
//

import SwiftUI

struct myInfo: View {
    @ObservedObject var getUser = getUserInfo()
    @State private var successText:Bool = false
    
    let restApi = RestAPI()
    @State private var member = getSN.init()
    
    
    var body: some View {
        VStack {
            ProfileImage(imageName: "icon")
                .padding()
            Form {
                Section(header: Text("2단계 인증")) {
                    TextField("아이디를 입력해주세요.(Email) ", text: $member.id)
                }
                Section(){
                    Button(action:{
                        var trigger = self.restApi.GET_SN(member: self.member)
                        self.getUser.userSN += trigger.SN
                        print("user info >> ", getUser.userSN)
                        
                        self.successText = true
                    }){
                        HStack{
                            Spacer()
                            Text("SN 확인")
                            Spacer()
                        }
                    }
                }
                if successText {
                    Section(header: Text("SN 정보")) {
                        Text("SN : \(self.getUser.userSN)")
                    }
                }
            }
            .background(Color.white)
            .navigationBarHidden(false)
            .navigationBarBackButtonHidden(false)
        }
    }
}

struct ProfileImage: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
    }
}

//                Section(header: Text("SN 변경")) {
//                    TextField("변경할 SN을 입력해주세요.(SN)", text: $member.SN)
//                    Button(action:{
//                        var SN_trigger = self.restApi.GET_changeSN(member: self.member)
//                        print(SN_trigger.success)
//                        if !SN_trigger.success {
//                            self.successText = true
//                        }
//                    }
//                    ){
//                        Text("Change SN")
//                            .foregroundColor(.blue)
//                            .bold()
//                    }
//                    if successText {
//                        Text("변경되었습니다.")
//                    }
//                }
