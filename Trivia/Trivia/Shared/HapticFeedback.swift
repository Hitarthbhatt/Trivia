//
//  HapticFeedback.swift
//  Trivia
//
//  Created by Hitarth on 17/02/21.
//

import SwiftUI

struct HapticFeedback {
    
    public static func generate(){
        
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.prepare()
        generator.impactOccurred()
        
    }
}
