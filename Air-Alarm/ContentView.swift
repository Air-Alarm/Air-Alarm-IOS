//
//  ContentView.swift
//  Air-Alarm
//
//  Created by byungwoo on 2021/08/06.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var authenticator: Authenticator
    
    var body: some View {
        
        return NavigationView {
            ZStack {

                Color.white.edgesIgnoringSafeArea(.all)
                //전체화면 색상
                VStack{
                    HStack{
                        Spacer()
                        // 로그인 뷰로 이동
                        NavigationLink( destination: LoginView()
                        ){
                            Image(systemName: "alarm")
                        }
                        Spacer()
                    }.padding()
                }
           }
        }
        //navigation option
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Authenticator())
    }
}
