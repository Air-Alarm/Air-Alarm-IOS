//
//  SignUpMember.swift
//  Air-Alarm
//
//  Created by gibeom on 2021/09/21.
//

import Foundation

struct SignUpMember {
    /*
     id: 아이디
     pwd: 패스워드
     SN: 시리얼 넘버
     */
    
    init(id: String, pwd: String, email: String, SN: String, success: Bool) {
        self.id = id
        self.pwd = pwd
        self.SN = SN
        self.success = success
    }
    
    private var id: String
    private var pwd: String
    private var SN: String
    private var success: Bool
}
