//
//  AList.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/08/06.
//

import SwiftUI

struct AListView: View {
    let restAPI = RestAPI()
    @State var db = RestAPI.Database()
    @State var refresh = Refresh(started: false, released: false)
    @State var json :  String = "아래로 당겨서 새로고침"
    
    func update() {
        self.db = restAPI.GET()
    }
    
    var body: some View {
        VStack {
//            HStack{ // air alarm 글씨
//                Text("Air Alarm")
//                    .font(.largeTitle)
//                    .fontWeight(.heavy)
//                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
//
//                Spacer()
//            }
//            .padding()
//            .background(Color.white.ignoresSafeArea(.all, edges: .top))
//            Divider()
            
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
                
                ZStack (alignment: Alignment(horizontal: .center, vertical:
                    .top)){
                    
                    if refresh.started && refresh.released{
                        ProgressView()
                            .offset(y: -35)
                    }
//                    else{
//                        Image(systemName: "arrow.down")
//                            .font(.system(size: 16, weight: .heavy))
//                            .foregroundColor(.gray)
//                            .rotationEffect(.init(degrees: refresh.started ? 180 : 0))
//                            .offset(y: -25)
//                            .animation(.easeIn)
//                    }
                    
                    VStack {
                       // Button(action: GET){
                       //     Text("버튼")
                       // }
//                        Text("CO2: " + String(db.CO2))
//                        Text("Dust: " + String(db.dust))
//                        Text("Humidity: " + String(db.humidity))
//                        Text("ID: " + String(db.id))
//                        Text("Temperature: " + String(db.temperature))
//                        Text("Time: " + db.time)
                        
                        HStack {
                            Spacer()
                            Text("온도 :  " + String(db.temperature) + " °C")
                                .padding()
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Text("습도 :  " + String(db.humidity) + " %")
                                .padding()
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Text("CO₂ :  " + String(db.CO2) + " ppm")
                                .padding()
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Text("PM2.5 :  " + String(db.dust) + " ㎍/m³")
                                .padding()
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Text("측정시간: " + db.time)
                                .padding()
                            Spacer()
                        }
                        
                        Text("\(json)")//웹에서 받아온 내용이 여기 저장됨
                            .padding()
                        
                    }
                    .background(Color.white)
                }
                .offset(y: refresh.released ? 40 : -10)
            })
        }
        //.background(Color.black.opacity(0.06).ignoresSafeArea())
    }
    func updateData(){
        
        print("update Data")
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(Animation.linear){
                
                if refresh.startOffset == refresh.offset{
                    update()
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
