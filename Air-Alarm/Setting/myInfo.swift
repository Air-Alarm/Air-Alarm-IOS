//
//  myInfo.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/09/14.
//

import SwiftUI

struct myInfo: View {
    let restAPI = RestAPI()
    @State var member = Login.init()
    @State var db = LoginSuccess.init()
    @State var signInSuccess = true
    
    var body: some View {
            VStack {
                
                ProfileImage(imageName: "icon")
                        .padding()
                Form {
//                    var trigger_user = restAPI.GET_Login(member: self.member)
                    let contentLogin = ContentLogin(signInSuccess: $signInSuccess)
                    Section(header: Text("User Info")) {
//                        Text("Email :  " + String(userId))
                        Text("Email : \(contentLogin.id)")
                        Text("SN :  \(contentLogin.snkey)")
                    }
                }
            }
            .background(Color.white)
            .navigationBarHidden(false)
            .navigationBarBackButtonHidden(false)
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

//struct myInfo_Previews: PreviewProvider {
//    static var previews: some View {
//        myInfo(userId: $member.id)
//    }
//}
