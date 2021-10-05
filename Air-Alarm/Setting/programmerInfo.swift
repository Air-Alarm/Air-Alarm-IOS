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
                ProfileImage(imageName: "icon")
                        .padding()
                Form {
                    Section(header: Text("개발자 정보")) {
                        Text("김기범                                                     iOS")
                            .bold()
                        Text("김하은                                                     iOS")
                            .bold()
                        Text("박진희                                                     iOS")
                            .bold()
                        Text("고병우                                       Embedded")
                            .bold()
                        Text("손창하                                          BackEnd")
                            .bold()
                    }.padding(10)
                }
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
