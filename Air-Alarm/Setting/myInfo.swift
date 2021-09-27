//
//  myInfo.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/09/14.
//

import SwiftUI

class RestAPI_myInfo {
    struct UserInfo: Codable {
        var email: String = ""
        var SN: String = ""
        var signup: String = ""
    }
    
    var dbb = UserInfo()
    
    // 객체에 데이터 저장하기
    func GET() -> UserInfo {
        if let url = URL(string: "http://mirsv.com:4999/get") {
            var request = URLRequest.init(url: url)

            request.httpMethod = "GET"

            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else { return }

                // data
                let decoder = JSONDecoder()
                if let json = try? decoder.decode(UserInfo.self, from: data) {
                    self.dbb = json
                }
            }.resume()
        }
        
        return self.dbb
    }
}

struct myInfo: View {
    let restAPI = RestAPI_myInfo()
    @State var dbb = RestAPI_myInfo.UserInfo()
    
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
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
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
