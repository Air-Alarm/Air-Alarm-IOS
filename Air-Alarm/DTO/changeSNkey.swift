//
//  changeSNkey.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/10/14.
//

import Foundation

struct changeSNkey: Codable {
    
    init(preSN: String = "", nowSN: String = "") {
        self.preSN = preSN
        self.nowSN = nowSN
    }
    
    var preSN: String
    var nowSN: String
}
