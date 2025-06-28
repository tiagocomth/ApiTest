//
//  ApiTestApp.swift
//  ApiTest
//
//  Created by Thiago de Jesus on 27/06/25.
//

import SwiftUI

@main
struct ApiTestApp: App {
    
    let dataManager = DataManager.shared
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, dataManager.container.viewContext)
        }
    }
}
