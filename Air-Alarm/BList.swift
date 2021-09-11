//
//  BList.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/08/06.
//

import SwiftUI
import SwiftUICharts

struct BList: View {
    var body: some View {
        HStack {
            ScrollView(.vertical, showsIndicators: false, content: {
                HStack {
                    LineView(data: Data.data0, title: Data.title, legend: Data.legend, style: Style.metoring, valueSpecifier: Data.valueSpecifier).padding()
                    LineView(data: Data.data0, title: Data.title, legend: Data.legend, style: Style.metoring, valueSpecifier: Data.valueSpecifier).padding()
                }
            })
        }
    }
}
struct BList_Previews: PreviewProvider {
    static var previews: some View {
        BList()
    }
}
