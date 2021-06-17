//
//  Remind_MeApp.swift
//  Remind Me
//
//  Created by Carlos Gil on 2021/06/16.
//

import SwiftUI
import Firebase

@main
struct Remind_MeApp: App {
    
    init() {
        FirebaseApp.configure()
        authenticationService.signIn()
      }
    
    var body: some Scene {
        WindowGroup {
            TaskListView()
        }
    }
}

