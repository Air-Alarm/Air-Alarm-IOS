//
//  changeSN.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/09/14.
//

import SwiftUI

struct changeSN: View {
    let restAPI = RestAPI()
    @State var db = getSNSuccess.init()
    @State private var SNmember = getSN.init()
    
    
    var body: some View {
            VStack {
                
                ProfileImage(imageName: "icon")
                        .padding()
                Form {
                    Section(header: Text("User Info")) {
                        Text("SN :  " + String(db.SN))
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
