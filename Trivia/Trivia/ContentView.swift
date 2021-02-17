//
//  ContentView.swift
//  Trivia
//
//  Created by Hitarth on 16/02/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var quizModel = QuizViewModel()
    var body: some View {
        GeometryReader { geo in
            
            if quizModel.showResult {
                
                ResultView(quizModel: quizModel, size: geo.size)
                
            }else {
                
                HomeView(quizModel: quizModel, size: geo.size)
                
            }
            
            //Geometry Reader
        }
    }
}

