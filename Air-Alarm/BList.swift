//
//  BList.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/08/06.
//


import SwiftUI
import SwiftUICharts

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
                    LineView(data: Data.data1, title: Data.title0, style: Style.metoring)
                        .padding()
                        .frame(width: 360, height: 365)
                    LineView(data: Data.data3, title: Data.title1, style: Style.metoring)
                        .padding()
                        .frame(width: 360, height: 365)
                    LineView(data: Data.data2, title: Data.title2, style: Style.metoring)
                        .padding()
                        .frame(width: 360, height: 365)
                    LineView(data: Data.data0, title: Data.title3, style: Style.metoring)
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
                    LineView(data: Data.data2, title: Data.title0, style: Style.metoring)
                        .padding()
                        .frame(width: 360, height: 365)
                    LineView(data: Data.data1, title: Data.title1, style: Style.metoring)
                        .padding()
                        .frame(width: 360, height: 365)
                    LineView(data: Data.data0, title: Data.title2, style: Style.metoring)
                        .padding()
                        .frame(width: 360, height: 365)
                    LineView(data: Data.data3, title: Data.title3, style: Style.metoring)
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
        HStack(spacing: 50) {
            Spacer()
            TabBarButton(text: "Day", isSelected: .constant(tabIndex == 0))
                .onTapGesture { onButtonTapped(index: 0) }
            TabBarButton(text: "Week", isSelected: .constant(tabIndex == 1))
                .onTapGesture { onButtonTapped(index: 1) }
            TabBarButton(text: "Month", isSelected: .constant(tabIndex == 2))
                .onTapGesture { onButtonTapped(index: 2) }
            Spacer()
        }
        .border(width: 1, edges: [.bottom], color: .blue)
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
            .border(width: isSelected ? 2 : 1, edges: [.bottom], color: .blue)
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
