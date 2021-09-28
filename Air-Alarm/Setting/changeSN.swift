//
//  changeSN.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/09/14.
//

import SwiftUI

class RestAPI_SN {
    struct SNInfo: Codable {
        var email: String = ""
        var SN: String = ""
}
    
    var sndb = SNInfo()
    
    // 객체에 데이터 저장하기
    func GET() -> SNInfo {
        if let url = URL(string: "http://mirsv.com:4999/get") {
            var request = URLRequest.init(url: url)

            request.httpMethod = "GET"

            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else { return }

                // data
                let decoder = JSONDecoder()
                if let json = try? decoder.decode(SNInfo.self, from: data) {
                    self.sndb = json
                }
            }.resume()
        }
        
        return self.sndb
    }
}

struct changeSN: View {
    let restAPI = RestAPI_SN()
    @State var sndb = RestAPI_SN.SNInfo()
    
    func update() {
        self.sndb = restAPI.GET()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                ProfileImage(imageName: "icon")
                        .padding()
                Form {
                    Section(header: Text("User Info")) {
                        Text("SN :  " + String(sndb.SN))
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


struct changeSN_Previews: PreviewProvider {
    static var previews: some View {
        changeSN()
    }
}
