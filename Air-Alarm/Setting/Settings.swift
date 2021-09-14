//
//  Settings.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/09/14.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        NavigationView {
            VStack{
                List {
                    Button(action: { myInfo() }
                    ){
                        Text("내 정보")
                            .font(.headline)
                            .padding()
                    }
                    Button(action: { myInfo() }
                    ){
                        Text("S/N 변경")
                            .font(.headline)
                            .padding()
                    }
                    Button(action: { myInfo() }
                    ){
                        Text("센서 측정 주기 / 단위 정보")
                            .font(.headline)
                            .padding()
                    }
                    Button(action: { myInfo() }
                    ){
                        Text("지역 날씨 API 정보")
                            .font(.headline)
                            .padding()
                    }
                    Button(action: { myInfo() }
                    ){
                        Text("개발자 정보")
                            .font(.headline)
                            .padding()
                    }
                }
                    Button(action: { myInfo() }
                    ){
                        Text("로그아웃")
                            .font(.headline)
                            .padding()
                            .foregroundColor(.red)
                            .cornerRadius(40)
                    }
            }
            .navigationBarHidden(false)
            .navigationBarTitle(Text("Setting"), displayMode: .inline)
            .navigationBarColor(.white)
        }
            
                
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
