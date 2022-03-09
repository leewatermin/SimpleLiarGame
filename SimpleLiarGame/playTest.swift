//
//  playTest.swift
//  LiarGame
//
//  Created by lee on 2022/02/01.
//

import Foundation
import SwiftUI

var playerSize = 3
struct playFoodAnju: View {
    @State var cntPressed = 1
    @State var txtHeader = " "
    @State var txtCheck = "제시어 확인하기!"
    @State var playWordTmp = " "
    @State var txtTF = "당신은 라이어가 아닙니다!"
    @State var clrCheck = Color.blue.opacity(0.8)
    @State var clrCheckTxt = Color.white
    @State var clrNext = Color.gray.opacity(0.3)
    @State var clrNextTxt = Color.black.opacity(0.3)

    @State var boolCheck = false
    @State var boolLiar = false
    @State var boolEndGame = false
    @State var checkBtnDisable = false
    @State var nextBtnDisable = false
    
    @State var numLiar = Int.random(in: 1...playerSize)
    @State var playWord = dataFoodStreet.randomElement()!
    
    @State var isAtMaxScale = false
    private let animation = Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)
    private let maxScale: CGFloat = 1.1
    
    func showWord(){
        if cntPressed == numLiar{
            txtHeader = String(numLiar)
            boolLiar = true
        }
        if boolLiar == true{
            txtHeader = "표정관리 하세요!"
            playWordTmp = "당신은 라이어입니다."
        }
        else{
            txtHeader = String(numLiar)
           // txtHeader = "제시어를 기억하세요."
            playWordTmp = playWord
        }
        self.clrNext = Color.blue.opacity(0.8)
        self.clrNextTxt = Color.white
    }
    
    func checkWord(){
        self.clrCheck = Color.gray.opacity(0.3)
        self.clrCheckTxt = Color.black.opacity(0.3)
    }
    
    func initButtons(){
        checkBtnDisable = false
        playWordTmp = " "
        txtHeader = " "
        clrCheck = Color.blue.opacity(0.8)
        clrCheckTxt = Color.white
        clrNext = Color.gray.opacity(0.3)
        clrNextTxt = Color.black.opacity(0.3)
    }
    
    func nextPlayer(){
        boolLiar = false
        initButtons()
        if cntPressed == playerSize+1{
            endGame()
        }
        cntPressed += 1
    }
    
    func endGame(){
        checkBtnDisable = true
        nextBtnDisable = true
        boolEndGame = true
        playWordTmp = "START!"
        txtHeader = "라이어 게임"
        clrCheck = Color.gray.opacity(0.3)
        clrCheckTxt = Color.black.opacity(0.3)
        clrNext = Color.gray.opacity(0.3)
        clrNextTxt = Color.black.opacity(0.3)
        cntPressed += 1
    }
    
    var body: some View {
        
        VStack{
            Spacer()
            Label(String(cntPressed) + " 번째 플레이어 차례입니다.", systemImage: "person.fill").font(Font.headline.weight(.black))
                .padding(0).foregroundColor(Color.blue).opacity(boolEndGame ? 0 : 1)
            
            Button(action: {
                showWord()
                checkWord()
                checkBtnDisable = true
            }, label: {
                Label(txtCheck, systemImage: "hand.tap.fill")
                    .foregroundColor(clrCheckTxt)
                    .padding(12).frame(width: 200, height: 40)
                    .background(clrCheck)
                    .cornerRadius(20)
                        .foregroundColor(.white)
                        .padding(0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(clrCheck, lineWidth: 3)
                        )
            }).padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)).disabled(checkBtnDisable).opacity(boolEndGame ? 0 : 1)

            Text(txtHeader).padding(EdgeInsets(top: 50, leading: 0, bottom: 15, trailing: 0))
            Text(playWordTmp) .font(Font.title.weight(.black)).padding(EdgeInsets(top: -5, leading: 0, bottom: 0, trailing: 0))

            
            Button(action: {
                nextPlayer()
            }) {
                Label("넘겨주기 전에 제시어 가리기", systemImage: "chevron.right.circle.fill")
                    .foregroundColor(clrNextTxt)
                    .padding(12).frame(width: 250, height: 40)
                    .background(clrNext)
                    .cornerRadius(20)
                        .foregroundColor(.white)
                        .padding(0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(clrNext, lineWidth: 3)
                        )
            }.padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0)).disabled(nextBtnDisable).opacity(boolEndGame ? 0 : 1)
                    
            Spacer()
        }
    }
}

struct playFoodStreet: View {
    @State var cntPressed = 1
    @State var txtHeader = " "
    @State var txtCheck = "제시어 확인하기!"
    @State var playWordTmp = " "
    @State var txtTF = "당신은 라이어가 아닙니다!"
    @State var clrCheck = Color.blue.opacity(0.8)
    @State var clrCheckTxt = Color.white
    @State var clrNext = Color.gray.opacity(0.3)
    @State var clrNextTxt = Color.black.opacity(0.3)
    @State var boolCheck = false
    @State var boolLiar = false
    @State var boolEndGame = false
    @State var checkBtnDisable = false
    @State var nextBtnDisable = false
    
    @State var numLiar = Int.random(in: 1...playerSize)
    @State var playWord = dataFoodStreet.randomElement()!
    
    @State var isAtMaxScale = false
    private let animation = Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)
    private let maxScale: CGFloat = 1.1
    
    func showWord(){
        if cntPressed == numLiar{
            txtHeader = String(numLiar)
            boolLiar = true
        }
        if boolLiar == true{
            txtHeader = "표정관리 하세요!"
            playWordTmp = "당신은 라이어입니다."
        }
        else{
            txtHeader = String(numLiar)
           // txtHeader = "제시어를 기억하세요."
            playWordTmp = playWord
        }
        self.clrNext = Color.blue.opacity(0.8)
        self.clrNextTxt = Color.white
    }
    
    func checkWord(){
        self.clrCheck = Color.gray.opacity(0.3)
        self.clrCheckTxt = Color.black.opacity(0.3)
    }
    
    func initButtons(){
        checkBtnDisable = false
        playWordTmp = " "
        txtHeader = " "
        clrCheck = Color.blue.opacity(0.8)
        clrCheckTxt = Color.white
        clrNext = Color.gray.opacity(0.3)
        clrNextTxt = Color.black.opacity(0.3)
    }
    
    func nextPlayer(){
        boolLiar = false
        initButtons()
        if cntPressed == playerSize+1{
            endGame()
        }
        cntPressed += 1
    }
    
    func endGame(){
        checkBtnDisable = true
        nextBtnDisable = true
        boolEndGame = true
        playWordTmp = "START!"
        txtHeader = "라이어 게임"
        clrCheck = Color.gray.opacity(0.3)
        clrCheckTxt = Color.black.opacity(0.3)
        clrNext = Color.gray.opacity(0.3)
        clrNextTxt = Color.black.opacity(0.3)
        cntPressed += 1
    }
    
    var body: some View {
        
        VStack{
            Spacer()
            Label(String(cntPressed) + " 번째 플레이어 차례입니다.", systemImage: "person.fill").font(Font.headline.weight(.black))
                .padding(0).foregroundColor(Color.blue).opacity(boolEndGame ? 0 : 1)
            
            Button(action: {
                showWord()
                checkWord()
                checkBtnDisable = true
            }, label: {
                Label(txtCheck, systemImage: "hand.tap.fill")
                    .foregroundColor(clrCheckTxt)
                    .padding(12).frame(width: 200, height: 40)
                    .background(clrCheck)
                    .cornerRadius(20)
                        .foregroundColor(.white)
                        .padding(0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(clrCheck, lineWidth: 3)
                        )
            }).padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)).disabled(checkBtnDisable).opacity(boolEndGame ? 0 : 1)

            Text(txtHeader).padding(EdgeInsets(top: 50, leading: 0, bottom: 15, trailing: 0))
            Text(playWordTmp) .font(Font.title.weight(.black)).padding(EdgeInsets(top: -5, leading: 0, bottom: 0, trailing: 0))

            
            Button(action: {
                nextPlayer()
            }) {
                Label("넘겨주기 전에 제시어 가리기", systemImage: "chevron.right.circle.fill")
                    .foregroundColor(clrNextTxt)
                    .padding(12).frame(width: 250, height: 40)
                    .background(clrNext)
                    .cornerRadius(20)
                        .foregroundColor(.white)
                        .padding(0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(clrNext, lineWidth: 3)
                        )
            }.padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0)).disabled(nextBtnDisable).opacity(boolEndGame ? 0 : 1)
                    
            Spacer()
        }
    }
}

struct notdefinedyet: View {
    var body: some View {
        VStack{
            Text("shall we start?: we like street food")
        }
    }
}

struct playTest_Previews: PreviewProvider {
    static var previews: some View {
        playFoodStreet()
    }
}
