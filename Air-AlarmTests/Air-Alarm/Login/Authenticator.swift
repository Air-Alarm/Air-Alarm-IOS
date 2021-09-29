//
//  Authenticator.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/08/15.
//

import Foundation


class Api {
    struct User: Codable {
        var userId: String = ""
        var password: String = ""
        var email: String = ""
        var snKey: String = ""
    }
    
    var signDB = User()
    
    // 객체에 데이터 저장하기
    func GET(signUp: User) -> User {
        if let url = URL(string: "http://mirsv.com:4999/signup_confirm?user=%22" + signUp.userId +
                            "%22&pwd=%22" + signUp.password +
                            "%22&email=%22" + signUp.email +
                            "%22&SN=%22" + signUp.snKey + "%22") {
            var request = URLRequest.init(url: url)

            request.httpMethod = "GET"

//            URLSession.shared.dataTask(with: request) { (data, response, error) in
//                guard let data = data else { return }
//
//                // data
//                let decoder = JSONDecoder()
//                if let json = try? decoder.decode(User.self, from: data) {
//                    self.signDB = json
//                }
//            }.resume()
        }
        return self.signDB
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