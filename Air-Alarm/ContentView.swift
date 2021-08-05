//
//  ContentView.swift
//  Air-Alarm
//
//  Created by gibeom on 2021/08/06.
//

import SwiftUI

struct ContentView: View {
    
    @State var TitleOfTab = AppMenu.AList.rawValue
    
    var body: some View {
        return NavigationView {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                //전체화면 색상
                
                VStack{
                    LoginAction
                }
            }
            // navigation option
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

private extension ContentView {
    var LoginAction: some View {
        HStack{
            Spacer()
            NavigationLink( destination: MainTabView(TitleOfNavi: $TitleOfTab)
                    .navigationBarHidden(false)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarTitle(Text(TitleOfTab), displayMode: .inline)
                    .navigationBarItems(leading: ChangeleadingItem(TitleOfTab), trailing: ChangetrailingItem(TitleOfTab))
){
                Text("App Main Login View")
            }
            Spacer()
        }.padding()
    }
}

private extension ContentView {
    func ChangeleadingItem(_ TitleName:String ) -> AnyView {
        switch TitleName {
        case AppMenu.AList.rawValue: do {
            return AnyView(HStack{
                Button(action: {print("Button 2")}) {
                    Image(systemName: "square.and.arrow.up")
                    }
                })
            }
        case AppMenu.BList.rawValue: do {
                return AnyView(HStack{
                    Button(action: { print("Button 2")}) {
                        Image(systemName: "square.and.arrow.up")
                        }
                    Button(action: { print("Button 3")}){
                        Image(systemName: "gear")
                    }
                    .imageScale(.large)
                })
            }
        case AppMenu.CList.rawValue: do {
                return AnyView(HStack{
                    Button(action: { print("Button 1")}) {
                        Image(systemName: "bell")
                    }
                })
            }
        default:do {
                return AnyView(HStack{
                    Button(action: { print("Button 1")}) {
                        Image(systemName: "bell")
                    }
                })
            }
        }
    }
}

private extension ContentView {
    func ChangetrailingItem(_ TitleName:String ) -> AnyView {
        switch TitleName {
        case AppMenu.AList.rawValue: do {
            return AnyView(HStack{
                Button(action: {print("Button 2")}) {
                    Image(systemName: "square.and.arrow.up")
                    }
                })
            }
        case AppMenu.BList.rawValue: do {
                return AnyView(HStack{
                    Button(action: { print("Button 2")}) {
                        Image(systemName: "square.and.arrow.up")
                        }
                    Button(action: { print("Button 3")}){
                        Image(systemName: "gear")
                    }
                    .imageScale(.large)
                })
            }
        case AppMenu.CList.rawValue: do {
                return AnyView(HStack{
                    Button(action: { print("Button 1")}) {
                        Image(systemName: "bell")
                    }
                })
            }
        default:do {
                return AnyView(HStack{
                    Button(action: { print("Button 1")}) {
                        Image(systemName: "bell")
                    }
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
