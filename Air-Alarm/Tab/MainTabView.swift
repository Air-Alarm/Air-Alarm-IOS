//
//  MainTabView.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/08/06.
//

import SwiftUI

// 하단 Tab
//struct MainTabView: View {
//    private enum Tabs {
//        case AList, BList, CList
//    }
//
//    @State private var selectedTab: Tabs = .AList
//    @Binding var TitleOfNavi: String
//
//    var body: some View {
//            ZStack
////                TabView(selection: $selectedTab) {
////                    Group{
////                        AListUI
////                        BListUI
////                        CListUI
////                    }
////                }
//                .statusBar(hidden: selectedTab == .AList)
//            }
//            .navigationBarHidden(false)
//            .navigationBarBackButtonHidden(false)
//    }
//}
//struct MainTabView: View {
//
//    private enum Tabs {
//        case AList, BList, CList
//    }
//
//    @State private var selectedTab: Tabs = .AList
//
//    @Binding var TitleOfNavi: String
//
//
//}

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


//private extension MainTabView {
//
//    var AListUI: some View {
//        AListView() // Tab 1의 화면
//        .tag(Tabs.AList)
//        .tabItem {Label("Tab 1", systemImage: "1.square")}
//        .navigationBarHidden(false)
//        .onAppear {
//            self.TitleOfNavi = AppMenu.AList.rawValue
//        }
//    }
//    var BListUI: some View {
//        BList() // Tab 2의 화면
//        .tag(Tabs.BList)
//        .tabItem {Label("Tab 2", systemImage: "2.square")}
//        .navigationBarHidden(false)
//        .onAppear {
//            self.TitleOfNavi = AppMenu.BList.rawValue
//        }
//    }
//    var CListUI: some View {
//        CList() // Tab 3의 화면
//        .tag(Tabs.CList)
//        .tabItem {Label("Tab 3", systemImage: "3.square")}
//        .navigationBarHidden(false)
//        .onAppear {
//            self.TitleOfNavi = AppMenu.CList.rawValue
//        }
//    }
//}

//struct MainTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainTabView()
//    }
//}

