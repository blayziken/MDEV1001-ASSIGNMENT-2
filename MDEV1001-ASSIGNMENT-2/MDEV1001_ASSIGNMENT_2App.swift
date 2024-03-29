//
//  MDEV1001_ASSIGNMENT_2App.swift
//  MDEV1001-ASSIGNMENT-2
//
//  Created by Blaze on 10/03/2024.
//

import SwiftUI

@main
struct MDEV1001_ASSIGNMENT_2App: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
        }
    }
}
