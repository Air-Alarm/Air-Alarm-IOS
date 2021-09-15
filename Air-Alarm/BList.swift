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
    var body: some View {
        VStack {
            ScrollView {
//            Picker(selection: $pickerSelectedItem, label: Text("")) {
//                Text("온도").tag(0)
//                Text("습도").tag(1)
//                Text("미세먼지").tag(2)
//            }.pickerStyle(SegmentedPickerStyle())
//            .padding(.horizontal, 24)
            
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
            .padding()
        }
    }
}
struct BList_Previews: PreviewProvider {
    static var previews: some View {
        BList()
    }
}
