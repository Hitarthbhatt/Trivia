//
//  TextFieldView.swift
//  Trivia
//
//  Created by Hitarth on 16/02/21.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var value: String
    var header = "Please Enter Your Name"
    var placeholder = "Your Name"
    
    
    var body: some View {
        VStack(alignment: .center) {
            Text(header.capitalized).font(.headline).foregroundColor(Color.black).opacity(0.7)
                .padding(.bottom, 10)
            
            TextField(placeholder, text: self.$value)
                .frame(height: 50)
                .padding(.horizontal)
                .foregroundColor(.black)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 0.5))
            
        }.background(Color.clear)
        .padding()
    }
}

