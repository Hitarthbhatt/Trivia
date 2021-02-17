//
//  ResultView.swift
//  Trivia
//
//  Created by Hitarth on 17/02/21.
//

import SwiftUI

struct ResultView: View {
    
    @ObservedObject var quizModel: QuizViewModel
    @Environment(\.managedObjectContext) var context
    @State var showHistory = false
    var size: CGSize
    
    var body: some View {
        
        VStack {
            
            NavBar(title: "Result", size: size)
            
            ContentView()
            
            Spacer()
            
            
            //MARK:- Finish Button
            
            ButtonView(text: "Finish", backgroundColor: Color.buttonColor) {
                
                HapticFeedback.generate()
                withAnimation(.spring()) {
                    quizModel.name = ""
                    quizModel.answer = "Please select your answer"
                    quizModel.colors = "No Color Selected"
                    quizModel.flagColors = quizModel.flagColors.compactMap { (item) -> FlagColors in
                        
                        return FlagColors(id: item.id, checked: false)
                    }
                    
                    quizModel.showResult = false
                }
                
            }
            .padding(.horizontal)
            
            
            //MARK:- History View Button
            
            ButtonView(text: "History", backgroundColor: Color.buttonColor) {
                
                HapticFeedback.generate()
                self.showHistory = true
                
            }.padding(.bottom, 40)
            .padding(.horizontal)
            
            
            
            //VStack
        }.background(Color.accentColor)
        .edgesIgnoringSafeArea(.all)
        .sheet(isPresented: $showHistory) {
            HistoryView(quizModel: quizModel, showSheet: $showHistory, size: size)
                .environment(\.managedObjectContext, context)
        }
    }
    
    
    
    
    //MARK:- Content View
    
    fileprivate func ContentView() -> some View {
        VStack(alignment: .leading, spacing: 10){
         
            Text("Hello, \(quizModel.name)")
                .font(.headline)
                .foregroundColor(.black)
            
            Text("Here are the answers selected:")
                .font(.headline)
                .foregroundColor(.black)
                .opacity(0.7)
            
            Text("1. Who is the best cricketer in the world?")
                .font(.headline)
                .foregroundColor(.black)
                
            Text(quizModel.answer)
                .font(.footnote)
                .foregroundColor(.black)
                .opacity(0.7)
            
            Text("2. What are the colors in the national flag?")
                .font(.headline)
                .foregroundColor(.black)
            
            Text(quizModel.colors)
                .font(.footnote)
                .foregroundColor(.black)
                .opacity(0.7)
            
            //VStack
        }.padding()
        .background(Color.white)
        .padding()
        .cornerRadius(8)
    }
    
    
}

