//
//  AList.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/08/06.
//

import SwiftUI

struct AList: View {
    let restAPI = RestAPI()
    @State var db = RestAPI.Database()
    
    func update() {
        self.db = restAPI.GET()
    }
    
    var body: some View {
        VStack {
            Button(action: update){
                Text("버튼")
            }
            Text("CO2: " + String(db.CO2))
            Text("Dust: " + String(db.dust))
            Text("Humidity: " + String(db.humidity))
            Text("ID: " + String(db.id))
            Text("Temperature: " + String(db.temperature))
            Text("Time: " + db.time)
            
        }
    }
    
}

struct AList_Previews: PreviewProvider {
    static var previews: some View {
        AList()
    }
}
