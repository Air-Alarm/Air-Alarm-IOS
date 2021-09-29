//
//  BList.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/08/06.
//

//import SwiftUI
//import SwiftUICharts
//
//struct BList: View {
//    var body: some View {
//        NavigationView {
//            VStack {
////                HStack {
////                    NavigationLink(destination: BList()) {
////                        Text("일")
////                            .padding(.horizontal, 45.0)
////                            .foregroundColor(.red)
////                    }
////                    NavigationLink(destination: Charts1()) {
////                        Text("주")
////                            .padding(.horizontal, 45.0)
////                    }
////                    NavigationLink(destination: Charts2()) {
////                        Text("월")
////                            .padding(.horizontal, 50.0)
////                    }
////                }
////                .padding(.horizontal,10.0)
////                Divider()
//
//                TabView {
//
//                }
//                Spacer()
////                VStack {
////                    ScrollView {
////                        LineView(data: Data.data0, title: Data.title, legend: Data.legend0, style: Style.metoring)
////                            .padding()
////                            .frame(width: 360, height: 365)
////                        LineView(data: Data.data1, title: Data.title, legend: Data.legend1, style: Style.metoring)
////                            .padding()
////                            .frame(width: 360, height: 365)
////                        LineView(data: Data.data2, title: Data.title, legend: Data.legend2, style: Style.metoring)
////                            .padding()
////                            .frame(width: 360, height: 365)
////                        LineView(data: Data.data3, title: Data.title, legend: Data.legend3, style: Style.metoring)
////                            .padding()
////                            .frame(width: 360, height: 365)
////                        Spacer()
////                    }
////                    .padding()
////                }
//            }
//        }
//        .navigationBarHidden(true)
//        .navigationBarBackButtonHidden(true)
//    }
//}
//struct BList_Previews: PreviewProvider {
//    static var previews: some View {
//        BList()
//    }
//}


// 테스트!!!!!!!!

import SwiftUI
import SwiftUICharts
//import SDWebImageSwiftUI

struct BList: View {
    
    @State var tabIndex = 0
    
    var body: some View {
        VStack{
            CustomTopTabBar(tabIndex: $tabIndex)
            if tabIndex == 0 {
                FirstView()
            }
            else if tabIndex == 1 {
                SecondView()
            }
            else {
                ThirdView()
            }
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width - 24, alignment: .center)
        .padding(.horizontal, 12)
    }
}

struct FirstView: View{
    var body: some View{
        ZStack{
            VStack {
                ScrollView {
                    LineView(data: Data.data0, title: Data.title, legend: Data.legend0, style: Style.metoring)
                        .padding()
                        .frame(width: 360, height: 365)
                    LineView(data: Data.data1, title: Data.title, legend: Data.legend1, style: Style.metoring)
                        .padding()
                        .frame(width: 360, height: 365)
                    LineView(data: Data.data2, title: Data.title, legend: Data.legend2, style: Style.metoring)
                        .padding()
                        .frame(width: 360, height: 365)
                    LineView(data: Data.data3, title: Data.title, legend: Data.legend3, style: Style.metoring)
                        .padding()
                        .frame(width: 360, height: 365)
                    Spacer()
                }
                //.padding()
            }
        }
    }
}

struct SecondView: View{
    var body: some View{
        ZStack{
            VStack {
                ScrollView {
                    LineView(data: Data.data1, title: Data.title, legend: Data.legend0, style: Style.metoring)
                        .padding()
                        .frame(width: 360, height: 365)
                    LineView(data: Data.data3, title: Data.title, legend: Data.legend1, style: Style.metoring)
                        .padding()
                        .frame(width: 360, height: 365)
                    LineView(data: Data.data2, title: Data.title, legend: Data.legend2, style: Style.metoring)
                        .padding()
                        .frame(width: 360, height: 365)
                    LineView(data: Data.data0, title: Data.title, legend: Data.legend3, style: Style.metoring)
                        .padding()
                        .frame(width: 360, height: 365)
                    Spacer()
                }
                //.padding()
            }
        }
    }
}

struct ThirdView: View{
    var body: some View{
        ZStack{
            VStack {
                ScrollView {
                    LineView(data: Data.data2, title: Data.title, legend: Data.legend0, style: Style.metoring)
                        .padding()
                        .frame(width: 360, height: 365)
                    LineView(data: Data.data1, title: Data.title, legend: Data.legend1, style: Style.metoring)
                        .padding()
                        .frame(width: 360, height: 365)
                    LineView(data: Data.data0, title: Data.title, legend: Data.legend2, style: Style.metoring)
                        .padding()
                        .frame(width: 360, height: 365)
                    LineView(data: Data.data3, title: Data.title, legend: Data.legend3, style: Style.metoring)
                        .padding()
                        .frame(width: 360, height: 365)
                    Spacer()
                }
                //.padding()
            }
        }
    }
}

struct CustomTopTabBar: View {
    @Binding var tabIndex: Int
    var body: some View {
        HStack(spacing: 70) {
            Spacer()
            TabBarButton(text: "일", isSelected: .constant(tabIndex == 0))
                .onTapGesture { onButtonTapped(index: 0) }
            TabBarButton(text: "주", isSelected: .constant(tabIndex == 1))
                .onTapGesture { onButtonTapped(index: 1) }
            TabBarButton(text: "월", isSelected: .constant(tabIndex == 2))
                .onTapGesture { onButtonTapped(index: 2) }
            Spacer()
        }
        .border(width: 1, edges: [.bottom], color: .black)
    }
    
    private func onButtonTapped(index: Int) {
        withAnimation { tabIndex = index }
    }
}

struct TabBarButton: View {
    let text: String
    @Binding var isSelected: Bool
    var body: some View {
        Text(text)
            .fontWeight(isSelected ? .heavy : .regular)
            .font(.custom("Avenir", size: 16))
            .padding(.bottom,10)
            .border(width: isSelected ? 2 : 1, edges: [.bottom], color: .black)
    }
}

struct EdgeBorder: Shape {

    var width: CGFloat
    var edges: [Edge]

    func path(in rect: CGRect) -> Path {
        var path = Path()
        for edge in edges {
            var x: CGFloat {
                switch edge {
                case .top, .bottom, .leading: return rect.minX
                case .trailing: return rect.maxX - width
                }
            }

            var y: CGFloat {
                switch edge {
                case .top, .leading, .trailing: return rect.minY
                case .bottom: return rect.maxY - width
                }
            }

            var w: CGFloat {
                switch edge {
                case .top, .bottom: return rect.width
                case .leading, .trailing: return self.width
                }
            }

            var h: CGFloat {
                switch edge {
                case .top, .bottom: return self.width
                case .leading, .trailing: return rect.height
                }
            }
            path.addPath(Path(CGRect(x: x, y: y, width: w, height: h)))
        }
        return path
    }
}

extension View {
    func border(width: CGFloat, edges: [Edge], color: SwiftUI.Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
    }
}
