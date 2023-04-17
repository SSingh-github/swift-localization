//
//  LocalizationTaskApp.swift
//  LocalizationTask
//
//  Created by Chicmic on 14/04/23.
//

import SwiftUI

@main
struct LocalizationTaskApp: App {
    @AppStorage(Constants.languageString)
    private var language = LocalizationService.shared.language
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            
        }
    }
}
