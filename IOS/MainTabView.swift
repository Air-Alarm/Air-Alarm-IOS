//
//  MainTabView.swift
//  IOS
//
//  Created by Jinhee on 2021/08/09.
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
                .statusBar(hidden: selectedTab == .BList)
                .statusBar(hidden: selectedTab == .CList)
            }

        }
    }
}

private extension MainTabView {
    var AListUI: some View {
        AListView() // Tab 1의 화면
        .tag(1)
        .tabItem {Label("Tab 1", systemImage: "1.square")}
        .navigationBarHidden(false)
        .onAppear {
            self.TitleOfNavi = AppMenu.AList.rawValue
        }
    }
    var BListUI: some View {
        BList() // Tab 2의 화면
        .tag(1)
        .tabItem {Label("Tab 3", systemImage: "2.square")}
        .navigationBarHidden(false)
        .onAppear {
            self.TitleOfNavi = AppMenu.BList.rawValue
        }
    }
    var CListUI: some View {
        CList() // Tab 3의 화면
        .tag(1)
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
