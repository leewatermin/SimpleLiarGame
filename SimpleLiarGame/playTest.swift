//
//  playTest.swift
//  LiarGame
//
//  Created by lee on 2022/02/01.
//

import Foundation
import SwiftUI

struct playFoodAnju: View {
    @State var cntPressed = 1
    @State var playWord = dataFoodStreet.randomElement()!
    @State var txtHeader = " "
    @State var txtCheck = "제시어 확인하기!"
    @State var playWordTmp = " "
    @State var txtTF = "당신은 라이어가 아닙니다!"
    @State var clrCheck = Color.blue.opacity(0.8)
    @State var clrCheckTxt = Color.white
    @State var clrNext = Color.gray.opacity(0.3)
    @State var clrNextTxt = Color.black.opacity(0.3)
    @State var boolCheck = false
    
    func nonLiarTouch(){
    }
    
    func showWord(){
        txtHeader = "제시어를 기억하세요."
        playWordTmp = playWord
        self.clrCheck = Color.blue.opacity(0.2)
        self.clrCheckTxt = Color.white
        self.clrNext = Color.black.opacity(0.8)
        self.clrNextTxt = Color.white
    }
    
    func nextPlayer(){
        cntPressed += 1
        if cntPressed > playerSize{
            cntPressed = 100
        }
    }
    
    var body: some View {
        VStack{
            Spacer()
            Label(String(cntPressed) + " 번째 플레이어 차례입니다.", systemImage: "person.fill").font(Font.headline.weight(.black))
                .padding(30).foregroundColor(Color.blue)
            Text(txtHeader).padding(EdgeInsets(top:0, leading: 0, bottom: 1, trailing: 0))
            Text(playWordTmp) .font(Font.title.weight(.black)).padding(EdgeInsets(top: -5, leading: 0, bottom: 0, trailing: 0))
            Spacer()
            
            Button(action: {
                if boolCheck == false{ // "제시어 확인 완료" 터치한 경우
                    showWord()
                    boolCheck = true
                }
                else { // "제시어 다시 확인하기" 터치한 경우
                    boolCheck = false // 제시어 미확인 상태로 변경
                    
                }
            }) {
                Label(txtCheck, systemImage: "hand.tap.fill")
                    .foregroundColor(clrCheckTxt)
                    .padding(12).frame(width: 250, height: 50)
                    .background(clrCheck)
                    .cornerRadius(6)
            }.disabled(boolCheck)
            Button(action: {
                nonLiarTouch()
                nextPlayer()
            }) {
                Label("넘겨주기 전에 제시어 가리기", systemImage: "chevron.right.circle.fill")
                    .foregroundColor(clrNextTxt)
                    .padding(12).frame(width: 250, height: 50)
                    .background(clrNext)
                    .cornerRadius(6)
                
            }
            Spacer()
            Spacer()
        }
    }
}

struct playFoodStreet: View {
    var body: some View {
        VStack{
            Text("shall we start?: we like street food")
        }
    }
}

struct playTest_Previews: PreviewProvider {
    static var previews: some View {
        playFoodAnju()
    }
}
