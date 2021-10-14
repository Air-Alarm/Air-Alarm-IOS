//
//  changeSN.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/09/14.
//

import SwiftUI

struct changeSN: View {
    
    @State private var successText = false
    let restApi = RestAPI()
    @State private var member = changeSNkey.init()
    
    
    var body: some View {
            VStack {
                
                ProfileImage(imageName: "icon")
                        .padding()
                Form {
                    Section(header: Text("SN 변경")) {
                        TextField("기존 SN을 입력해주세요.(SN)", text: $member.preSN)
                        TextField("변경할 SN을 입력해주세요.(SN)", text: $member.nowSN)
                        Button(action:{
                            var SN_trigger = self.restApi.GET_changeSN(member: self.member)
                            print(SN_trigger.success)
                            if !SN_trigger.success {
                                self.successText = true
                            }
                        }
                        ){
                            Text("Change SN")
                                .foregroundColor(.blue)
                                .bold()
                        }
                        if successText {
                            Text("변경되었습니다.")
                        }
                    }
                }

            .background(Color.white)
        }
    }
}


struct changeSN_Previews: PreviewProvider {
    static var previews: some View {
        changeSN()
    }
}
