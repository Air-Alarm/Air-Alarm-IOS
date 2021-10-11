//
//  getSNSuccess.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/10/12.
//

import Foundation

struct getSNSuccess: Codable { // 로그인 성공 여부 판단
    /*
     id: 아이디
     success: get sn 성공 여부
     */
    
    init(id: String = "", SN: String = "") {
        self.id = id
        self.SN = SN
    }
    
    var id: String
    var SN: String
}
