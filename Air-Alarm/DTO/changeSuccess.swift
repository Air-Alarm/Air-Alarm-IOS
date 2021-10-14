//
//  changeSuccess.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/10/14.
//

import Foundation

struct changeSuccess: Codable {
    
    init(preSN: String = "", nowSN: String = "", success: Bool = false) {
        self.preSN = preSN
        self.success = success
        self.nowSN = nowSN
    }
    
    var preSN: String
    var success: Bool
    var nowSN: String
}
