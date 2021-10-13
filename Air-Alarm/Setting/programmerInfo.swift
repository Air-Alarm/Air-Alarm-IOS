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
                        Link(destination: URL(string: "https://www.naver.com")!){
                            HStack {
                                Text("김하은")
                                    .bold()
                                Spacer()
                                Text("iOS")
                                    .bold()
                                 }
                        }
                        HStack {
                            Text("박진희")
                                .bold()
                            Spacer()
                            Text("iOS")
                                .bold()
                        }
                        HStack {
                            Text("고병우")
                                .bold()
                            Spacer()
                            Text("Embedded")
                                .bold()
                        }
                        HStack {
                            Text("손창하")
                                .bold()
                            Spacer()
                            Text("Backend")
                                .bold()
                        }
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
