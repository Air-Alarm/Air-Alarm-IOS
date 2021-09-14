//
//  ContentView.swift
//  Air-Alarm
///Users/gibeom/git/Air-Alarm/Air-Alarm/ContentView.swift
//  Created by byungwoo on 2021/08/06.
//

import SwiftUI


struct ContentView: View {
    let restAPI = RestAPI()
    @State var db = RestAPI.Database()
    
    func update() {
        self.db = restAPI.GET()
    }
    
    var body: some View {
        VStack{
            Button(action: update){
                Text("버튼")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
