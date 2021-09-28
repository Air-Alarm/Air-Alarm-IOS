//
//  AList.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/08/06.
//

import SwiftUI

struct CList: View {
    let restAPI = RestweatherAPI()
    @State var wwdb = RestweatherAPI.WeatherInfo()
    @State var weather = Weather(started: false, released: false)
    @State var json :  String = "아래로 당겨서 새로고침"
    
    func update() {
        self.wwdb = restAPI.GET()
    }
    
    var body: some View {
        VStack {
            
            ScrollView(.vertical, showsIndicators: false, content: {
                
                GeometryReader{reader -> AnyView in
                    
                    DispatchQueue.main.async{
                        
                        if weather.startOffset == 0{
                            weather.startOffset = reader.frame(in: .global).minY
                        }
                        weather.offset = reader.frame(in: .global).minY
                        
                        if weather.offset - weather.startOffset > 80 && !weather.started{
                            
                            weather.started = true
                        }
                        
                        if weather.startOffset == weather.offset && weather.started && !weather.released{
                            
                            withAnimation(Animation.linear){weather.released = true}
                            updateData()
                        }
                        // 유효하지 않은지 확인
                        if weather.startOffset == weather.offset && weather.started && weather.released && weather.invalid{
                            
                            weather.invalid = false
                            updateData()
                        }
                    }
                    
                    return AnyView(Color.black.frame(width: 0, height: 0))
                }
                .frame(width: 0, height: 0)
                
                ZStack (alignment: Alignment(horizontal: .center, vertical:
                    .top)){
                    
                    if weather.started && weather.released{
                        ProgressView()
                            .offset(y: -35)
                    }
                    
                    VStack {
                        
                        HStack {
                            Spacer()
                            Text("Location :  " + String(wwdb.Location))
                                .padding()
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Text("dust10 :  " + String(wwdb.dust10))
                                .padding()
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Text("dust25 :  " + String(wwdb.dust25))
                                .padding()
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Text("temperature :  " + String(wwdb.temperature))
                                .padding()
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Text("time :  " + String(wwdb.time))
                                .padding()
                            Spacer()
                        }
                        
                        Text("\(json)")//웹에서 받아온 내용이 여기 저장됨
                            .padding()
                        
                    }
                    .background(Color.white)
                }
                .offset(y: weather.released ? 40 : -10)
            })
        }
    }
    func updateData(){
        
        print("update Data")
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(Animation.linear){
                
                if weather.startOffset == weather.offset{
                    update()
                    weather.released = false
                    weather.started = false
                }
                else{
                    weather.invalid = true
                }
            }
        }
    }
}

//새로고침
struct Weather {
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
