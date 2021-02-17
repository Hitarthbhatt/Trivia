//
//  ButtonView.swift
//  Trivia
//
//  Created by Hitarth on 16/02/21.
//

import SwiftUI

struct ButtonView: View {
    var text = ""
    var backgroundColor = Color.black
    var action = {}
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            HStack {
                Text(text)
                    .font(.headline)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.vertical)
                    .accentColor(Color.white)
                    .background(backgroundColor.opacity(0.9))
                    .cornerRadius(8)
                //HStack
            }
        }
    }
}

