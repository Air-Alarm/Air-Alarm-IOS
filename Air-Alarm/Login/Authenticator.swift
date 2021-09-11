//
//  Authenticator.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/08/15.
//

import Foundation


class Api {
    struct User: Codable {
        var user: String = ""
        var pwd: String = ""
        var email: String = ""
        var SN: String = ""
        var signup: String = ""
    }
    
    struct signDB: Codable {
        var signup: String = ""
        var user: String = ""
    }
    
    // 객체에 데이터 저장하기
    func GET(signUp: User) -> signDB {
        var signDBB = signDB()
        if let url = URL(string: "http://mirsv.com:4999/signup_confirm?user=" + signUp.user +
                            "&pwd=" + signUp.pwd +
                            "&email=" + signUp.email +
                            "SN=" + signUp.SN ) {
            var request = URLRequest.init(url: url)

            request.httpMethod = "GET"

            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else { return }

                // data
                let decoder = JSONDecoder()
                
                if let json = try? decoder.decode(Api.signDB.self, from: data) {
                    signDBB = json
                    print("json")
                    print(json)
                }
            }.resume()
        }
        print(signDBB)
        print("aaaaaa")
        return signDBB
    }
}

class Authenticator: ObservableObject {      // 로그인 판별
    @Published var needsAuthentication: Bool
    @Published var isAuthenticating: Bool

    init() {
        self.needsAuthentication = true
        self.isAuthenticating = false
    }

    func login(username: String, password: String) { //로그인할 때 아이디 비밀번호 받기
        self.isAuthenticating = true
        // emulate a short delay when authenticating
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { //시간차 두기
            self.isAuthenticating = false // 로그인양식이 무엇인지
            self.needsAuthentication = false // 로그아웃 -> ture, 로그인 -> false
        }
    }

    func logout() { //로그아웃일때 needsAuthentication 값을로 다시 뒤집어 true로그인을 다시 확인해야됨.
        self.needsAuthentication = true
    }
}
