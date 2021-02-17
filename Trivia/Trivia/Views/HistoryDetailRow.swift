//
//  HistoryDetailRow.swift
//  Trivia
//
//  Created by Hitarth on 17/02/21.
//

import SwiftUI

struct HistoryDetailRow: View {
    
    var quiz: Quizes
    var size: CGSize
    @ObservedObject var quizModel = QuizViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            HStack(alignment: .center) {
                
                Text("Hello, \(quiz.name ?? "")")
                    .font(.headline)
                    .foregroundColor(.black)
                
                Spacer()
                
                Text(quizModel.DateConverter(date: quiz.date ?? Date()))
                    .foregroundColor(.black)
                    .opacity(0.7)
                    .font(.footnote)
                    .layoutPriority(1)
                    .padding(.trailing, 10)
                
                //HStack
            }
            
            Text("Here are the answers selected:")
                .font(.headline)
                .foregroundColor(.black)
                .opacity(0.7)
            
            Text("1. Who is the best cricketer in the world?")
                .layoutPriority(1)
                .lineLimit(2)
                .font(.headline)
                .foregroundColor(.black)
            
            Text(quiz.answer ?? "")
                .font(.footnote)
                .foregroundColor(.black)
                .opacity(0.7)
            
            Text("2. What are the colors in the national flag?")
                .lineLimit(2)
                .layoutPriority(1)
                .font(.headline)
                .foregroundColor(.black)
                .frame(height: size.height/15)
            
            Text(quiz.colors ?? "")
                .font(.footnote)
                .foregroundColor(.black)
                .opacity(0.7)
            
            
            //VStack
        }.padding(5)
        .frame(width: size.width/1.1, height: size.height/3)
        .background(Color.white)
        .cornerRadius(10)
        .padding(10)
        
    }
}


