//
//  playTest.swift
//  LiarGame
//
//  Created by lee on 2022/02/01.
//

import Foundation
import SwiftUI

struct playFoodAnju: View {
    @State var cntPressed = 0
    @State var playWord = dataFoodStreet.randomElement()!
    @State var txtHeader = "제시어를 기억하세요."
    @State var txtCheck = "제시어 확인 완료!"
    @State var boolCheck = false
    @State var playWordTmp = "제시어 보관하기"
    
    func nonLiarTouch(){
    }
    
    func showWord(){
        txtHeader = "제시어를 기억하세요."
        playWord = playWordTmp
    }
    
    func hideWord(){
        txtHeader = "기억했다면 아래 노란 버튼 터치!"
        playWordTmp = playWord
        playWord = "  "
    }
    
    func nextPlayer(){
        cntPressed += 1
    }
    
    var body: some View {
        VStack{
            Spacer()
            Label("당신은 라이어가 아닙니다!", systemImage: "person.fill.xmark") .font(Font.headline.weight(.black)).labelStyle(.titleAndIcon).padding(30).foregroundColor(.blue)
            Text(txtHeader).padding(EdgeInsets(top:0, leading: 0, bottom: 1, trailing: 0))
            Text(playWord) .font(Font.title.weight(.black)).padding(EdgeInsets(top: -5, leading: 0, bottom: 0, trailing: 0))
            Spacer()
            
            Button(action: {
                if boolCheck == false{ // "제시어 확인 완료" 터치한 경우
                    boolCheck = true // 제시어 확인 상태로 변경
                    hideWord()
                    self.txtCheck = "제시어 다시 확인하기"
                }
                else { // "제시어 다시 확인하기" 터치한 경우
                    boolCheck = false // 제시어 미확인 상태로 변경
                    showWord()
                    self.txtCheck = "제시어 확인 완료!"
                }
            }) {
                Label(txtCheck, systemImage: "hand.tap.fill")
                    .foregroundColor(Color.black)
                    .padding(12).frame(width: 250, height: 50)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(6)
            }
            Button(action: {
                nonLiarTouch()
            }) {
                Label("넘겨주기 전에 터치!", systemImage: "chevron.right.circle.fill")
                    .foregroundColor(Color.black)
                    .padding(12).frame(width: 250, height: 50)
                    .background(Color.yellow.opacity(0.4))
                    .cornerRadius(6)
            }
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
