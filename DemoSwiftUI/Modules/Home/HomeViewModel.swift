//
//  HomeViewModel.swift
//  DemoSwiftUI
//
//  Created by Hitesh.Chouhan on 20/08/25.
//

import Foundation
import UserNotifications
import UIKit
import LocalAuthentication

class HomeViewModel: ObservableObject {
    
    func didTapClickMe() {
        print("clicked me")
        configureRemoteNotifications { granted in
            print("Register notification")
        }
    }
    
    func configureRemoteNotifications(completion: @escaping ((Bool) -> Void)) {
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            
            if granted {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
                print("granted")
                DispatchQueue.main.async {
                    completion(true)
                }
            } else {
                print("not granted")
                DispatchQueue.main.async {
                    completion(false)
                }
            }
            
            if let error = error {
                print("Error requesting notification authorization: \(error.localizedDescription)")
            }
        }
    }
    
    func authenticateWithFaceID() {
        let context = LAContext()
        var error: NSError?
        
        // Check if Face ID is available
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            let reason = "Authenticate with Face ID to continue."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        // Authentication succeeded
                        print("Face ID authentication successful.")
                    } else {
                        // Authentication failed
                        print("Authentication failed: \(authenticationError?.localizedDescription ?? "Unknown error")")
                    }
                }
            }
        } else {
            // Face ID not available
            print("Face ID not available: \(error?.localizedDescription ?? "Unknown error")")
        }
    }
    
}
