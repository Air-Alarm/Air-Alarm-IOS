//
//  RestSignAPI.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/09/28.
//

import Foundation

class RestSignAPI {
    struct SignInfo: Codable {
        var email: String = ""
        var SN: String = ""
}
    
    var sndb = SignInfo()
    
    // 객체에 데이터 저장하기
    func GET() -> SignInfo {
        if let url = URL(string: "http://mirsv.com:4999/get") {
            var request = URLRequest.init(url: url)

            request.httpMethod = "GET"

            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else { return }

                // data
                let decoder = JSONDecoder()
                if let json = try? decoder.decode(SignInfo.self, from: data) {
                    self.sndb = json
                }
            }.resume()
        }
        
        return self.sndb
    }
}
