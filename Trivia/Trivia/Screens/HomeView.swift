//
//  HomeView.swift
//  Trivia
//
//  Created by Hitarth on 16/02/21.
//


import SwiftUI

struct HomeView: View {
    
    @ObservedObject var quizModel: QuizViewModel
    @Environment(\.managedObjectContext) var context
    
    var size: CGSize
    @State private var formOffset: CGFloat = 0
    @State var showSheet = false
    @State var showHistory = false
    
    var body: some View {
        
        VStack(alignment: .trailing) {
            
            SubscriptionView(content: ContentView(), publisher: NotificationCenter.keyboardPublisher) { frame in
                withAnimation {
                    self.formOffset = frame.height > 0 ? -50 : 0
                }
            }
            
            Spacer()
            
            HistoryViewButton().sheet(isPresented: $showHistory) {
                HistoryView(quizModel: quizModel, showSheet: $showHistory, size: size)
                    .environment(\.managedObjectContext, context)
            }
            
            //VStack
        }
        .background(Color.accentColor)
        .edgesIgnoringSafeArea(.all)
    }
    
    
    
    
    fileprivate func ContentView() -> some View {
        VStack {
            
            NavBar(size: size)
            
            Spacer()
            
            Image("Doodle")
                .resizable()
                .padding(.top)
                .frame(width: size.width/1.5, height: size.height/5)
            
            TextFieldView(value: $quizModel.name)
            
            ButtonView(text: "Start", backgroundColor: quizModel.name.isEmpty ? Color.gray : Color.buttonColor) {
                
                HapticFeedback.generate()
                self.showSheet = true
                
            }.disabled(quizModel.name.isEmpty)
            .padding(.horizontal)
            
            Spacer()
            
            
        }.offset(y: formOffset)
        .sheet(isPresented: $showSheet) {
            QuizView(quizModel: quizModel, showForm: $showSheet, size: size)
        }
    }
    
    
    
    //TODO:- History View Button
    
    fileprivate func HistoryViewButton() -> some View {
        
        Button(action: {
            
            HapticFeedback.generate()
            self.showHistory = true
            
        }, label: {
            ZStack(alignment: .center) {
                
                Circle()
                    .frame(width: size.width/5, height: size.width/5)
                    .foregroundColor(.white)
                    .shadow(color: Color.gray.opacity(0.5), radius: 2, x: 1, y: 1)
                
                VStack(alignment: .center) {
                    
                    Image(systemName: "clock.arrow.circlepath")
                        .imageScale(.large)
                        .foregroundColor(.orange)
                    
                    Text("History")
                        .foregroundColor(.orange)
                        .font(.footnote)
                    
                }
                //ZStack
            }.padding(.bottom, 40)
            .padding(.trailing)
            //Button
        })
    }
    
    
}

