//
//  UIAlertControllerExtension.swift
//  Vocapic
//
//  Created by ericzero on 8/19/23.
//

// UIAlertControllerExtensions.swift - Copyright 2020 SwifterSwift

import UIKit
import Foundation

// MARK: - Methods
 extension UIAlertController {
   
    /// SwifterSwift: Add a text field to Alert.
    
     public func show() {
             if let window = UIApplication.shared.delegate?.window,
                let rootViewController = window?.rootViewController {
                 rootViewController.present(self, animated: true, completion: nil)
             }
         }
         
         public static func show(title: String? = nil, message: String? = nil, style: UIAlertController.Style = UIAlertController.Style.alert, okActionTitle: String?, handler: ((UIAlertAction) -> Swift.Void)? = nil) {
             
             if let window = UIApplication.shared.delegate?.window,
                 let rootViewController = window?.rootViewController {
                 
                 let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
                 
                 let okAction = UIAlertAction(title: okActionTitle, style: .default, handler: handler)
                 
                 alertController.addAction(okAction)
                 
                 rootViewController.present(alertController, animated: true, completion: nil)
             }
         }
         
         public static func show(title: String? = nil,
                                 message: String? = nil,
                                 style: UIAlertController.Style = UIAlertController.Style.alert,
                                 okActionTitle: String?,
                                 okHandler: ((UIAlertAction) -> Swift.Void)? = nil,
                                 cancelActionTitle: String?,
                                 cancelHandler: ((UIAlertAction) -> Swift.Void)? = nil) {
             
         if let window = UIApplication.shared.delegate?.window,
             let rootViewController = window?.rootViewController {
             
             let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
             
             let cancelAction = UIAlertAction(title: cancelActionTitle, style: .default, handler: cancelHandler)
             
             alertController.addAction(cancelAction)
             
             let okAction = UIAlertAction(title: okActionTitle, style: .default, handler: okHandler)
             
             alertController.addAction(okAction)
             
             rootViewController.present(alertController, animated: true, completion: nil)
        }
   }
     
     
    /// - Parameters:
    ///   - text: text field text (default is nil).
    ///   - placeholder: text field placeholder text (default is nil).
    ///   - editingChangedTarget: an optional target for text field's editingChanged.
    ///   - editingChangedSelector: an optional selector for text field's editingChanged.
    func addTextField(
        text: String? = nil,
        placeholder: String? = nil,
        editingChangedTarget: Any?,
        editingChangedSelector: Selector?) {
        addTextField { textField in
            textField.text = text
            textField.placeholder = placeholder
            if let target = editingChangedTarget, let selector = editingChangedSelector {
                textField.addTarget(target, action: selector, for: .editingChanged)
            }
        }
    }
}

// MARK: - Initializers

 extension UIAlertController {
    /// SwifterSwift: Create new alert view controller with default OK action.
    ///
    /// - Parameters:
    ///   - title: alert controller's title.
    ///   - message: alert controller's message (default is nil).
    ///   - defaultActionButtonTitle: default action button title (default is "OK").
    ///   - tintColor: alert controller's tint color (default is nil).
    convenience init(
        title: String,
        message: String? = nil,
        defaultActionButtonTitle: String = "OK",
        tintColor: UIColor? = nil) {
        self.init(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: defaultActionButtonTitle, style: .default, handler: nil)
        addAction(defaultAction)
        if let color = tintColor {
            view.tintColor = color
        }
    }

    /// SwifterSwift: Create new error alert view controller from Error with default OK action.
    ///
    /// - Parameters:
    ///   - title: alert controller's title (default is "Error").
    ///   - error: error to set alert controller's message to it's localizedDescription.
    ///   - defaultActionButtonTitle: default action button title (default is "OK").
    ///   - preferredStyle: type of alert to display (default is .alert).
    ///   - tintColor: alert controller's tint color (default is nil).
    convenience init(
        title: String = "Error",
        error: Error,
        defaultActionButtonTitle: String = "OK",
        preferredStyle: UIAlertController.Style = .alert,
        tintColor: UIColor? = nil) {
        self.init(title: title, message: error.localizedDescription, preferredStyle: preferredStyle)
        let defaultAction = UIAlertAction(title: defaultActionButtonTitle, style: .default, handler: nil)
        addAction(defaultAction)
        if let color = tintColor {
            view.tintColor = color
        }
    }
}
