//
//  AList.swift
//  Air-Alarm
//
//  Created by Jinhee on 2021/08/10.
//

import SwiftUI

struct AListView: View {
    struct Database: Codable {
        var CO2: Double = 0.0
        var dust: Double = 0.0
        var humidity: Double = 0.0
        var id: Int = 0
        var temperature: Double = 0.0
        var time: String = ""
    }
    @State var db = Database()
    @State var refresh = Refresh(started: false, released: false)
    @State var json :  String = "아래로 당겨서 새로고침"
    
    // 객체에 데이터 저장하기
    func GET(){
        if let url = URL(string: "http://mirsv.com:5000/get") {
            var request = URLRequest.init(url: url)

            request.httpMethod = "GET"

            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else { return }

                // data
                let decoder = JSONDecoder()
                if let json = try? decoder.decode(Database.self, from: data) {
                    self.db = json
                }
            }.resume()
        }
    }
    
    // 변수에 데이터 직접 저장하긴
//    func GET1(){
//        if let url = URL(string: "http://mirsv.com:5000/get") {
//            var request = URLRequest.init(url: url)
//
//            request.httpMethod = "GET"
//
//            URLSession.shared.dataTask(with: request) { (data, response, error) in
//                guard let data = data else { return }
//
//                // data
//                if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] {
//                    print("json에 데이터 들어감")
//                    print(json["CO2"]!)
//                    self.textView = json["CO2"]! as! Int
//                }
//            }.resume()
//        }
//    }
    
    var body: some View {
        VStack {
            HStack{ // air alarm 글씨
                Text("Air Alarm")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                
                Spacer()
            }
            .padding()
            .background(Color.white.ignoresSafeArea(.all, edges: .top))
            Divider()
            
            ScrollView(.vertical, showsIndicators: false, content: {
                
                GeometryReader{reader -> AnyView in
                    
                    DispatchQueue.main.async{
                        
                        if refresh.startOffset == 0{
                            refresh.startOffset = reader.frame(in: .global).minY
                        }
                        refresh.offset = reader.frame(in: .global).minY
                        
                        if refresh.offset - refresh.startOffset > 80 && !refresh.started{
                            
                            refresh.started = true
                        }
                        
                        if refresh.startOffset == refresh.offset && refresh.started && !refresh.released{
                            
                            withAnimation(Animation.linear){refresh.released = true}
                            updateData()
                        }
                        // 유효하지 않은지 확인
                        if refresh.startOffset == refresh.offset && refresh.started && refresh.released && refresh.invalid{
                            
                            refresh.invalid = false
                            updateData()
                        }
                    }
                    
                    return AnyView(Color.black.frame(width: 0, height: 0))
                }
                .frame(width: 0, height: 0)
                
                ZStack(alignment: Alignment(horizontal: .center, vertical:
                    .top)) {
                    
                    if refresh.started && refresh.released{
                        ProgressView()
                            .offset(y: -35)
                    }
                    else{
                        Image(systemName: "arrow.down")
                            .font(.system(size: 16, weight: .heavy))
                            .foregroundColor(.gray)
                            .rotationEffect(.init(degrees: refresh.started ? 180 : 0))
                            .offset(y: -25)
                            .animation(.easeIn)
                    }
                    
                    VStack {
                        Button(action: GET){
                            Text("버튼")
                        }
                        Text("CO2: " + String(db.CO2))
                        Text("Dust: " + String(db.dust))
                        Text("Humidity: " + String(db.humidity))
                        Text("ID: " + String(db.id))
                        Text("Temperature: " + String(db.temperature))
                        Text("Time: " + db.time)
                        
                        Text("\(json)")//웹에서 받아온 내용이 여기 저장됨
                            .padding()
                        
                    }
                    .background(Color.white)
                    
                }
                .offset(y: refresh.released ? 40 : -10)
            })
        }
        .background(Color.black.opacity(0.06).ignoresSafeArea())
    }
    func updateData(){
        
        print("update Data")
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(Animation.linear){
                
                if refresh.startOffset == refresh.offset{
                    GET()
                    refresh.released = false
                    refresh.started = false
                }
                else{
                    refresh.invalid = true
                }
            }
        }
    }
}

//새로고침
struct Refresh {
    var startOffset : CGFloat = 0
    var offset : CGFloat = 0
    var started : Bool
    var released: Bool
    var invalid : Bool = false
}

struct AList_Previews: PreviewProvider {
    static var previews: some View {
        AListView()
    }
}
