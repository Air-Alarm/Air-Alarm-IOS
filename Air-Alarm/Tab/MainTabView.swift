//
//  MainTabView.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/08/06.
//

import SwiftUI

// 하단 Tab2
struct MainTabView: View {
    var body: some View {
        HeaderTabView()
        TabView {
            AListView()
                .tabItem{ Label( "", systemImage: "thermometer")  }
                .navigationBarHidden(false)
            BList()
                .tabItem{ Label( "", systemImage: "thermometer") }
                .navigationBarHidden(false)
            CList()
                .tabItem{ Label( "", systemImage: "thermometer") }
                .navigationBarHidden(false)
        }
    }
}

//.navigationBarHidden(false)
//.navigationBarBackButtonHidden(true)
//.navigationBarTitle(Text("Air Alarm"), displayMode: .inline)    // tab 이름
//.navigationBarItems(leading: ChangeleadingItem(), trailing: ChangetrailingItem())
//.navigationBarColor(.white)

struct HeaderTabView: View {
    @State var showingAlarm = false
    
    var body: some View {
        HStack {
            Image("icon")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40, alignment: .center)
                .padding(10)
            Spacer()
            Text("Air Alarm")
                .foregroundColor(Color.blue)
            Spacer()
            Button(action: {
                Settings()
            }){
                Image(systemName: "gearshape")
            }
            Button(action: {
                self.showingAlarm.toggle()
            }
            ){
                Image(systemName: "bell")
            }.sheet(isPresented: $showingAlarm) {
                Alarm()
            }
            .padding(5)
        }//.frame(height: Header.navigationBarHeight)
    }
}

// @State var showingSignUp = false
//Button(action: {
//    self.showingSignUp.toggle()
//}) {
//    Text("회원가입")
//        .font(.headline)
//        .padding()
//        .foregroundColor(.white)
//        .background(Color.blue)
//        .cornerRadius(40)
//}.sheet(isPresented: $showingSignUp) {
//    Signup()
//}

// 왼쪽 상단 Tab
func ChangeleadingItem() -> AnyView {
        return AnyView(
            HStack{
                Image("icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    })
}



// 오른쪽 상단 Tab
    func ChangetrailingItem() -> AnyView {
            return AnyView(
                HStack{
                    NavigationLink(
                        destination: Settings(),
                        label: {
                            Image(systemName: "gearshape")
                        }
                    )
                    NavigationLink(
                        
                        destination: Alarm(),
                        label: {
                            Image(systemName: "bell")
                        }
                    )
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                }
            )
        }
