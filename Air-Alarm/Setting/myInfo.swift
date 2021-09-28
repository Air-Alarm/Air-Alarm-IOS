//
//  myInfo.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/09/14.
//

import SwiftUI

struct myInfo: View {
    let restAPI = RestSignAPI()
    @State var dbb = RestSignAPI.SignInfo()
    
    func update() {
        self.dbb = restAPI.GET()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                ProfileImage(imageName: "icon")
                        .padding()
                Form {
                    Section(header: Text("User Info")) {
                        Text("Email :  " + String(dbb.email))
                        Text("SN :  " + String(dbb.SN))
                    }
                }
    //            Text("\(json)")//웹에서 받아온 내용이 여기 저장됨
    //                .padding()
                
            }
            .background(Color.white)
        }
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

struct myInfo_Previews: PreviewProvider {
    static var previews: some View {
        myInfo()
    }
}
