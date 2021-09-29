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
        TabView {
            AListView()
                .tabItem{ Label("Tab 1", systemImage: "1.square") }
                .navigationBarHidden(false)

            BList()
                .tabItem{ Label("Tab 2", systemImage: "2.square") }
                .navigationBarHidden(false)
            CList()
                .tabItem{ Label("Tab 3", systemImage: "3.square") }
                .navigationBarHidden(false)
        }
    }
}

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
//                    Button(action: { Settings() }
//                    ){
//                        Image(systemName: "gearshape")
//                    }
                }
            )
        }
