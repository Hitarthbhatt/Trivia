//
//  UniversalHeader.swift
//  Trivia
//
//  Created by Hitarth on 16/02/21.
//

import SwiftUI

struct UniversalHeader: View {
    @Binding var showSheet: Bool
    
    var title: String = ""
    var size: CGSize
    
    var body: some View {
        ZStack(alignment: .center){
            
            HStack(alignment: .center){
                
                
                
                Button(action: {
                    
                    withAnimation(.easeInOut){
                        self.showSheet = false
                    }
                    
                }){
                    
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .foregroundColor(.black)
                    
                }
                
                
                Spacer()
                
                
                Text(title)
                    .font(.headline)
                    .foregroundColor(.black)
                
                
                Spacer()
                
                //HStack
            }.padding(.horizontal, 20)
            .frame(height: size.height/12)
            .background(Color.accentColor)
            
            
            
            //ZStack
        }
    }
}

