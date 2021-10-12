//
//  getSN.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/10/12.
//

import Foundation

struct getSN: Codable {
    /*
     id: 아이디
     SN: SN키
     */
    
    init(id: String = "") {
        self.id = id
    }
    
    var id: String
}
