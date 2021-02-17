//
//  NavBar.swift
//  Trivia
//
//  Created by Hitarth on 16/02/21.
//

import SwiftUI

struct NavBar: View {
    
    var title: String = ""
    var size: CGSize
    
    var body: some View {
        ZStack(alignment: .bottom){
            
            HStack(alignment: .center){
                
                if title.isEmpty {
                    
                    Image("Small Logo")
                        .resizable()
                        .padding(.top)
                        .frame(width: size.width/5, height: size.height/15)
                    
                }else {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.black)
                }
                
                
                //HStack
            }.padding([.leading, .trailing, .top], 20)
            .frame(height: size.height/10, alignment: .bottom)
            .background(Color.accentColor)
            
            //ZStack
        }
    }
}
