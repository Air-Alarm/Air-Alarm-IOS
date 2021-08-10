//
//  AList.swift
//  Air-Alarm
//
//  Created by Jinhee on 2021/08/10.
//

import SwiftUI

struct AListView: View {
    var body: some View {
        Home()
    }
}

struct AList_Previews: PreviewProvider {
    static var previews: some View {
        AListView()
    }
}

struct Home: View {
    @State var json :  String = "아래로 당겨서 새로고침"
    
    
    func callREST() {
        do {
            let url = URL(string: "http://mirsv.com:5000/get")
            let response = try String(contentsOf: url!)
            
            self.json = response
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }

    
    
    @State var arrayData = ["20210724", "9:58", "0.0", "0.0", "0"]
    @State var refresh = Refresh(started: false, released: false)
    
    var body: some View{
        VStack{
            HStack{
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
                        ForEach(arrayData,id: \.self){value in
                            HStack{
                                Text(value)
                                Spacer()
                                //Image(systemName: "chevron.right")
                                    .foregroundColor(.black)
                            }
                            .padding()
                        }
                        
                        
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
                    callREST()
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

// 새로고침

struct Refresh {
    var startOffset : CGFloat = 0
    var offset : CGFloat = 0
    var started : Bool
    var released: Bool
    var invalid : Bool = false
}
