//
//  ContentView.swift
//  SimpleLiarGame
//
//  Created by lee on 2022/02/01.
//

import SwiftUI
var playerSize = 2

struct CircleView: View {
    @State var imgName: String
    var body: some View {
        ZStack {
            Image(imgName)
                .resizable()
                .frame(width: 70, height: 125)
        }
    }
}

struct ContentView: View {
    @State private var nightMode = true
    @State private var twitMode = false
    @State var playerSize = 3
    @State var liarSize = 1
    
    var body: some View {
        NavigationView{
            
            VStack {
                // header, playerSize setting
                Group{
                    Label("Liar Game", systemImage: "gamecontroller.fill").font(Font.headline.weight(.black)).padding(EdgeInsets(top: -20, leading: 0, bottom: 20, trailing: 0))
                    Divider().padding(EdgeInsets(top:0, leading: 20, bottom: 10, trailing: 20))
                    let tglMode = Toggle(isOn: $twitMode) {
                        Label("바보모드"+String(twitMode), systemImage: "gamecontroller.fill").font(Font.headline.weight(.black)).frame(maxWidth: .infinity, alignment: .topLeading).padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 0))
                    }
                    tglMode.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 30))
                    
                    Stepper("전체 인원: \(playerSize.formatted()) 명", value: $playerSize, in: 2...12, step: 1).font(Font.headline.weight(.black))
                        .labelStyle(.titleAndIcon).frame(maxWidth: .infinity, alignment: .topLeading).padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                    Stepper("라이어 수: \(liarSize.formatted()) 명", value: $liarSize, in: 1...(playerSize-1), step: 1).font(Font.headline.weight(.black))
                        .labelStyle(.titleAndIcon).frame(maxWidth: .infinity, alignment: .topLeading).padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                    
                    Divider().padding(EdgeInsets(top:10, leading: 20, bottom: 20, trailing: 20))
                    
                }
                Group{
                    // category setting
                    // first row
                    Label("먹고 마시는 것", systemImage: "fork.knife") .font(Font.headline.weight(.black))
                        .labelStyle(.titleAndIcon).frame(maxWidth: .infinity, alignment: .topLeading).padding(EdgeInsets(top:5, leading: 30, bottom: 5, trailing: 0))
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            NavigationLink(destination: playFoodAnju()) {
                                CircleView(imgName: "pngFoodAnju")}
                            NavigationLink(destination: playFoodStreet()) {
                                CircleView(imgName: "pngFoodStreet")}
                            CircleView(imgName: "pngFoodCafe")
                            CircleView(imgName: "pngFoodFruit")
                        }.padding(EdgeInsets(top:0, leading: 25, bottom: 0, trailing: 25))
                    }.frame(height: 120).padding(EdgeInsets(top:0, leading:0, bottom: 5, trailing: 0))
                }
                
                // second row
                Label("생활 속 이것저것", systemImage: "shippingbox.fill") .font(Font.headline.weight(.black))
                    .labelStyle(.titleAndIcon).frame(maxWidth: .infinity, alignment: .topLeading).padding(EdgeInsets(top:5, leading: 30, bottom: 5, trailing: 0))
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        CircleView(imgName: "pngEtcUtil")
                        CircleView(imgName: "pngEtcCity")
                        CircleView(imgName: "pngEtcNetflix")
                        CircleView(imgName: "pngEtcKMovie")
                        CircleView(imgName: "pngEtcKDrama")
                        CircleView(imgName: "pngEtcIntlMovie")
                    }.padding(EdgeInsets(top:0, leading: 25, bottom: 0, trailing: 25))
                }.frame(height: 120).padding(EdgeInsets(top:0, leading:0, bottom: 5, trailing: 0))
                
                // third row
                Label("유명한 사람들", systemImage: "face.smiling.fill") .font(Font.headline.weight(.black))
                    .labelStyle(.titleAndIcon).frame(maxWidth: .infinity, alignment: .topLeading).padding(EdgeInsets(top:5, leading: 30, bottom: 5, trailing: 0))
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 15) {
                        CircleView(imgName: "pngPeopleActor")
                        CircleView(imgName: "pngPeopleMaleActor")
                        CircleView(imgName: "pngPeopleFemaleActor")
                        CircleView(imgName: "pngPeopleMaleIdol")
                        CircleView(imgName: "pngPeopleFemaleIdol")
                    }.padding(EdgeInsets(top:0, leading: 25, bottom: 0, trailing: 25))
                }.frame(height: 120).padding(EdgeInsets(top:0, leading:0, bottom: 50, trailing: 0))
            }.background(Color.gray.opacity(0.1))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewInterfaceOrientation(.portrait)
        }
        
    }
}
