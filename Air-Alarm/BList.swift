//
//  BList.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/08/06.
//

import SwiftUI
import SwiftUICharts

struct BList: View {
    @State var pickerSelectedItem = 0
    @State var tag:Int? = nil
    private var pickerArray = ["일", "주", "월"]
    
    var body: some View {
        NavigationView {
            VStack {
//                Picker(selection: $pickerSelectedItem, label: Text("")) {
//                        Text("일")
//                            .tag(0)
//                        Text("주")
//                            .tag(1)
//                        Text("월")
//                            .tag(2)
//                }.pickerStyle(SegmentedPickerStyle())
//                .padding(.horizontal, 24)
                
                HStack {
                    NavigationLink(destination: BList()) {
                        Text("일")
                            .padding(.horizontal, 30.0)
                            .foregroundColor(.red)
                    }
                    NavigationLink(destination: Charts1()) {
                        Text("주")
                            .padding(.horizontal, 30.0)
                    }
                    NavigationLink(destination: Charts2()) {
                        Text("월")
                            .padding(.horizontal, 30.0)
                    }
                }
                .padding(.horizontal,10.0)
                Divider()
                Spacer()
                VStack {
                    ScrollView {
                        LineView(data: Data.data0, title: Data.title, legend: Data.legend0, style: Style.metoring)
                            .padding()
                            .frame(width: 360, height: 365)
                            .tag(0)
                        LineView(data: Data.data1, title: Data.title, legend: Data.legend1, style: Style.metoring)
                            .padding()
                            .frame(width: 360, height: 365)
                            .tag(0)
                        LineView(data: Data.data2, title: Data.title, legend: Data.legend2, style: Style.metoring)
                            .padding()
                            .frame(width: 360, height: 365)
                            .tag(0)
                        LineView(data: Data.data3, title: Data.title, legend: Data.legend3, style: Style.metoring)
                            .padding()
                            .frame(width: 360, height: 365)
                            .tag(0)
                        Spacer()
                    }
                    .padding()
                }
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}
struct BList_Previews: PreviewProvider {
    static var previews: some View {
        BList()
    }
}
