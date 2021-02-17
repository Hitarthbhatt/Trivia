//
//  CustomDisclousureGroup.swift
//  Trivia
//
//  Created by Hitarth on 17/02/21.
//

import SwiftUI

struct CustomDisclousureGroup: View {
    
    @ObservedObject var quizModel: QuizViewModel
    @Binding var isExpended: Bool
    var value: String
    var size: CGSize
    
    var body: some View {
        VStack {
            
            HStack {
                
                Text(value)
                    .foregroundColor(.black)
                    .font(.headline)
                
                Spacer()
                
                Image(systemName: isExpended ? "chevron.down" : "chevron.right")
                    .imageScale(.large)
                    .foregroundColor(.black)
                
                
            }.padding()
            .onTapGesture {
                withAnimation {
                    self.isExpended.toggle()
                }
            }
            
            if isExpended {
                ScrollView(.vertical, showsIndicators: true) {
                    
                    VStack {
                        ForEach(Answers.allCases, id: \.self) { answer in
                            
                            Text(answer.rawValue)
                                .font(.headline)
                                .foregroundColor(.black)
                                .padding(.vertical, 10)
                                .padding(.horizontal)
                                .onTapGesture {
                                    quizModel.answer = answer.rawValue
                                    withAnimation {
                                        self.isExpended.toggle()
                                    }
                                }
                            
                            //Loop
                        }
                        //VStack
                    }
                    
                }.frame(height: size.height/5)
            }
            
            
            //VStack
        }
    }
}


