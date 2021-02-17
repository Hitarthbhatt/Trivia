//
//  NotificationExt.swift
//  Trivia
//
//  Created by Hitarth on 16/02/21.
//

import SwiftUI

extension NotificationCenter {
    
    private static let keyboardWillShow = NotificationCenter.Publisher(center: .default, name: UIResponder.keyboardWillShowNotification)
    
    private static let keyboardWillHide = NotificationCenter.Publisher(center: .default, name: UIResponder.keyboardWillHideNotification)
    
    
    static var keyboardPublisher = NotificationCenter.keyboardWillShow.merge(with: NotificationCenter.keyboardWillHide.map { Notification(name: $0.name, object: $0.object, userInfo: nil) })
        .map { ($0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero)}
    
}