//
//  QuizViewModel.swift
//  Trivia
//
//  Created by Hitarth on 17/02/21.
//

import SwiftUI
import CoreData

class QuizViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var answer: String = "Please select your answer"
    @Published var colors: String = "No Color Selected"
    @Published var showResult: Bool = false
    
    
    @Published var flagColors: [FlagColors] = [
        
        FlagColors(id: "White", checked: false),
        FlagColors(id: "Yellow", checked: false),
        FlagColors(id: "Orange", checked: false),
        FlagColors(id: "Green", checked: false),
    ]
    
    
    //MARK:- This method helps to checkmark given colors (Multiple Selection)
    
    func GetColorIndex(color: FlagColors) -> Int {
        
        let index = self.flagColors.firstIndex { (color1) -> Bool in
            
            return color1.id == color.id
            
        } ?? 0
        
        return index
    }
    
    
    //MARK:- This method convert selected colors into comma separated string
    
    func TotalSelectedColors() -> String {
        
        var totalColors: [String] = []
        
        for item in flagColors {
            
            if item.checked {
                totalColors.append(item.id)
            }
            
        }
        
        let formattedArray = (totalColors.map{$0}).joined(separator: ",")
        
        return formattedArray
    }
    
    
    
    //MARK:- This method saves users selected answers into local storage
    
    func SaveData(context: NSManagedObjectContext, userName: String, userAnswer: String, userColors: String) {
        
        let newQuiz = Quizes(context: context)
        newQuiz.name = userName
        newQuiz.answer = userAnswer
        newQuiz.colors = userColors
        newQuiz.date = Date()
        
        do {
            
            try context.save()
            
        }catch {
            print(error.localizedDescription)
        }
        
        
    }
    
    
    
    
    
    //MARK:- Date Formatter Method.
    
    func DateConverter(date: Date) -> String {
        
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .short
        formatter.dateFormat = "MMM dd hh:mm a"
        formatter.timeZone = TimeZone(identifier: "IST")
        let oldTime = formatter.string(from: date)
        
        return oldTime
    }
    
    
    
}
