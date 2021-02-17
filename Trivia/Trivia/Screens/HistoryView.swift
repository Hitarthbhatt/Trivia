//
//  HistoryView.swift
//  Trivia
//
//  Created by Hitarth on 17/02/21.
//

import SwiftUI

struct HistoryView: View {
    
    @ObservedObject var quizModel: QuizViewModel
    @Binding var showSheet: Bool
    var size: CGSize
    
    
    //MARK:- Fetching data from local storage
    
    @FetchRequest(entity: Quizes.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)], animation: .spring()) var results: FetchedResults<Quizes>
    
    var body: some View {
        VStack(alignment: .leading) {
         
            UniversalHeader(showSheet: $showSheet, title: "History", size: size)
            
            GameHistory()
            
            Spacer()
            
            //VStack
        }.background(Color.accentColor)
        .edgesIgnoringSafeArea(.all)
    }
    
    
    
    fileprivate func GameHistory() -> some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack {
                
                ForEach(results){ value in
                    HistoryDetailRow(quiz: value, size: size)
                }
                
                //VStack
            }.frame(width: size.width)
        }
        
    }
    
}

