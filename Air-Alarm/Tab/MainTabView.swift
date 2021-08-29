//
//  MainTabView.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/08/06.
//

import SwiftUI

enum AppMenu : String {
    case AList = "Tab 1"
    case BList = "Tab 2"
    case CList = "Tab 3"
}

struct MainTabView: View {
    
    private enum Tabs {
        case AList, BList, CList
    }
    
    @State private var selectedTab: Tabs = .AList
    
    @Binding var TitleOfNavi: String
    
    var body: some View {
        return NavigationView{
            ZStack {
                TabView(selection: $selectedTab) {
                    Group{
                        AListUI
                        BListUI
                        CListUI
                    }
                }
                .statusBar(hidden: selectedTab == .AList)

            }

        }
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(false)
    }
}

// 왼쪽 상단 Tab
func ChangeleadingItem(_ TitleName: String ) -> AnyView {
    switch TitleName {
    case AppMenu.AList.rawValue: do {
        return AnyView(
            HStack{
                Image("icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        })
    }
    case AppMenu.BList.rawValue: do {
        return AnyView(
            HStack{
                Image("icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        })
    }
    case AppMenu.BList.rawValue: do {
        return AnyView(
            HStack{
                Image("icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        })
    }
    default:do {
        return AnyView(
            HStack{
                Image("icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        })
    }
    }
}


// 오른쪽 상단 Tab
    func ChangetrailingItem(_ TitleName:String ) -> AnyView {

        switch TitleName {
        case AppMenu.AList.rawValue: do {
            return AnyView(
                HStack{
                    Button(action: { print("Button 2")}
                    ){
                        Image(systemName: "bell")
                    }
                    Button(action: { print("Button 3")}
                    ){
                        Image(systemName: "gear")
                    }
            })
        }
        case AppMenu.BList.rawValue: do {
            return AnyView(
                HStack{
                    Button(action: { print("Button 2")}
                    ){
                        Image(systemName: "bell")
                    }
                    Button(action: { print("Button 3")}
                    ){
                        Image(systemName: "gear")
                    }
            })
        }
        case AppMenu.CList.rawValue: do {
            return AnyView(
                HStack{
                    Button(action: { print("Button 2")}
                    ){
                        Image(systemName: "bell")
                    }
                    Button(action: { print("Button 3")}
                    ){
                        Image(systemName: "gear")
                    }
            })
        }
        default:do {
            return AnyView(
                HStack{
                    Button(action: { print("Button 2")}
                    ){
                        Image(systemName: "bell")
                    }
                    Button(action: { print("Button 3")}
                    ){
                        Image(systemName: "gear")
                    }
            })
        }
        }
    }

private extension MainTabView {
    
    var AListUI: some View {
        AList() // Tab 1의 화면
        .tag(Tabs.AList)
        .tabItem {Label("Tab 1", systemImage: "1.square")}
        .navigationBarHidden(false)
        .onAppear {
            self.TitleOfNavi = AppMenu.AList.rawValue
        }
    }
    var BListUI: some View {
        BList() // Tab 2의 화면
        .tag(Tabs.BList)
        .tabItem {Label("Tab 2", systemImage: "2.square")}
        .navigationBarHidden(false)
        .onAppear {
            self.TitleOfNavi = AppMenu.BList.rawValue
        }
    }
    var CListUI: some View {
        CList() // Tab 3의 화면
        .tag(Tabs.CList)
        .tabItem {Label("Tab 3", systemImage: "3.square")}
        .navigationBarHidden(false)
        .onAppear {
            self.TitleOfNavi = AppMenu.CList.rawValue
        }
    }
}

//struct MainTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainTabView()
//    }
//}
