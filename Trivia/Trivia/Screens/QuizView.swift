//
//  QuizView.swift
//  Trivia
//
//  Created by Hitarth on 16/02/21.
//

import SwiftUI

struct QuizView: View {
    
    @ObservedObject var quizModel: QuizViewModel
    @Environment(\.managedObjectContext) var context
    
    @Binding var showForm: Bool
    @State var isExpended = false
    var size: CGSize
    
    
    var body: some View {
        ContentView()
    }
    
    fileprivate func ContentView() -> some View {
        VStack(alignment: .leading) {
            
            UniversalHeader(showSheet: $showForm, title: "Quiz", size: size)
            
            ScrollView(.vertical, showsIndicators: false){
                Section(header: SectionHeader(title: "Who is the best cricketer in the world?")) {
                    QuizBox()
                }.padding(.top)
                
                
                Section(header: SectionHeader(title: "What are the colors in the Indian national flag?")) {
                    FlagBox()
                }
                
                
                Spacer()
                
                
                ButtonView(text: "Submit!", backgroundColor: quizModel.answer == "Please select your answer" ? Color.gray : Color.buttonColor) {
                    
                    HapticFeedback.generate()
                    DispatchQueue.main.async {
                        quizModel.colors = quizModel.TotalSelectedColors()
                        
                        quizModel.SaveData(context: context, userName: quizModel.name, userAnswer: quizModel.answer, userColors: quizModel.colors)
                    }
                    
                    withAnimation(.spring()) {
                        showForm = false
                        quizModel.showResult = true
                    }
                    
                    
                }.padding(.bottom, 40)
                .padding(.horizontal)
                
                //Scroll View
            }
            
            //VStack
        }.background(Color.accentColor)
        .edgesIgnoringSafeArea(.all)
    }
    
    
    //MARK:- Select Best Cricketer In The World.
    
    fileprivate func QuizBox() -> some View {
        VStack {
            
            CustomDisclousureGroup(quizModel: quizModel, isExpended: $isExpended, value: quizModel.answer, size: size)
            
            
            //VStack
        }.background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal)
        .onTapGesture {
            withAnimation {
                self.isExpended.toggle()
            }
        }
    }
    
    
    //MARK:- Select Indian National Flag Color.
    
    fileprivate func FlagBox() -> some View {
        VStack(alignment: .leading) {
            
            ForEach(quizModel.flagColors) { color in
                ColorsRow(quizModel: quizModel, color: color, size: size)
            }
            
            
            //VStack
        }
    }
    
    
    //MARK:- Section Header
    
    fileprivate func SectionHeader(title: String) -> some View {
        
        Text(title)
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundColor(.black)
            .padding([.leading, .top])
            .opacity(0.8)
        
    }
    
    
}

