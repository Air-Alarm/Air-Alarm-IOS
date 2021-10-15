//
//  AList.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/08/06.
//

import SwiftUI

struct CList: View {
    let restAPI = RestAPI()
    @State var db = WeatherInfo.init()
    @State var refresh = Refreshh(started: false, released: false)
    @State var json :  String = "아래로 당겨서 새로고침"
    
    func update() {
        self.db = restAPI.GET_Weather()
    }
    
    var body: some View {
        VStack {
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
                    
                    VStack {
                        HStack {
                            Spacer()
                            Text("지역 :  " + String(db.Location))
                                .padding()
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Text("PM2.5 (10):  " + String(db.dust10) + " ㎍/m³")
                                .padding()
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Text("PM2.5 (25):  " + String(db.dust25) + " ㎍/m³")
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
                            Text("온도 :  " + String(db.temperature) + " °C")
                                .padding()
                            Spacer()
                        }
                        VStack {
                            Spacer()
                            Text("측정시간")
                                .foregroundColor(Color.gray)
                                .font(.system(size: 16))
                            Text(db.time)
                                .foregroundColor(Color.gray)
                                .font(.system(size: 16))
                        }
                        
                        Text("\(json)")//웹에서 받아온 내용이 여기 저장됨
                            .padding()
                        
                    }
                    .background(Color.white)
                }
                .offset(y: refresh.released ? 40 : -10)
            })
        }
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
struct Refreshh {
    var startOffset : CGFloat = 0
    var offset : CGFloat = 0
    var started : Bool
    var released: Bool
    var invalid : Bool = false
}

struct CList_Previews: PreviewProvider {
    static var previews: some View {
        CList()
    }
}
