//
//  changeSN.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/09/14.
//

import SwiftUI

struct changeSN: View {
    let restAPI = RestAPI()
//    @State var db = getSNSuccess.init()
//    @State private var SNmember = getSN.init()
    
    
    var body: some View {
            VStack {
                
                ProfileImage(imageName: "icon")
                        .padding()
                Form {
                    Section(header: Text("User Info")) {
 //                       Text("SN :  " + String(db.SN))
                    }
                }
    //            Text("\(json)")//웹에서 받아온 내용이 여기 저장됨
    //                .padding()
                
            .background(Color.white)
        }
    }
}


struct changeSN_Previews: PreviewProvider {
    static var previews: some View {
        changeSN()
    }
}

// TextField 작성 
//var snView: some View {
//    TextField("기기 S/N", text: $member.SN)
//        .foregroundColor(.black)
//}

// 변경하기 버튼 만들때 참고하기 (Signup 코드임.)
//Button(
//    action: {
//        var Sign_trigger = self.restApi.GET_Signup(member: self.member)
//        print(Sign_trigger)
//
//        self.showingSignUp = !Sign_trigger.success
//    }
//){
//    Text("가입하기")
//        .font(.headline)
//        .foregroundColor(.blue)
//        .padding()
//        .overlay(
//            RoundedRectangle(cornerRadius: 30)
//                .stroke(Color.blue, lineWidth: 1)
//                .frame(width: 90, height: 50)
//        )
//}
