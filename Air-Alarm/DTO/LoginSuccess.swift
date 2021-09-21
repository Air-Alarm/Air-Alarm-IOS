//
//  LoginSuccess.swift
//  Air-Alarm
//
//  Created by gibeom on 2021/09/21.
//

import Foundation

struct LoginSuccess { // 로그인 성공 여부 판단
    /*
     id: 아이디
     success: 로그인 성공 여부
     */
    
    init(id: String, success: Bool) {
        self.id = id
        self.success = success
    }
    
    var id: String
    var success: Bool
}
