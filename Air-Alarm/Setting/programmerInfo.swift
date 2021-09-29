//
//  programmerInfo.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/09/14.
//

import SwiftUI

struct programmerInfo: View {
    var body: some View {
            VStack {
                Text("개발자 정보")
            }
            .background(Color.white)
            .navigationBarHidden(false)
            .navigationBarBackButtonHidden(false)
    }
}

struct programmerInfo_Previews: PreviewProvider {
    static var previews: some View {
        programmerInfo()
    }
}
