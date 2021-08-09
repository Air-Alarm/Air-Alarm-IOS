//
//  RestAPI.swift
//  IOS
//
//  Created by gibeom on 2021/07/30.
//

//import SwiftUI
//
//struct RestAPI: View {
//    
//    @State var json :  String = "json 파일"
//    
//    
//    func callREST() {
//        do {
//            let url = URL(string: "http://mirsv.com:5000/get")
//            let response = try String(contentsOf: url!)
//            
//            self.json = response
//        } catch let error as NSError {
//            print(error.localizedDescription)
//        }
//    }
//    
//    var body: some View {
//        VStack {
//            Button(action: callREST) {
//                Text("GET")
//            }
//            Text(json)
//        }
//    }
//}
//
//struct RestAPI_Previews: PreviewProvider {
//    static var previews: some View {
//        RestAPI()
//    }
//}
