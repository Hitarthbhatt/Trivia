//
//  ColorsRow.swift
//  Trivia
//
//  Created by Hitarth on 17/02/21.
//

import SwiftUI

struct ColorsRow: View {
    
    @ObservedObject var quizModel: QuizViewModel
    @State var color: FlagColors
    var size: CGSize
    
    var body: some View {
        HStack {
            
            Text(color.id)
                .foregroundColor(.black)
                .font(.headline)
                .padding(.horizontal)
            
            Spacer()
            
            if color.checked {
                
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame(width: size.width/15, height: size.width/15)
                    .foregroundColor(.green)
                    .padding(.trailing)
            }else {
                Circle()
                    .stroke(Color.black, lineWidth: 0.5)
                    .frame(width: size.width/15, height: size.width/15)
                    .padding(.trailing)
            }
            
            //HStack
        }.padding(.vertical)
        .background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal)
        .onTapGesture {
            withAnimation(.spring()) {
                quizModel.flagColors[quizModel.GetColorIndex(color: color)].checked.toggle()
                color.checked.toggle()
            }
        }
    }
}

