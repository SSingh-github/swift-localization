//
//  ContentView.swift
//  LocalizationTask
//
//  Created by Chicmic on 14/04/23.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage(Constants.languageString)
    private var language = LocalizationService.shared.language
    
    var body: some View {
        if language == .arabic {
            FirstView()
                .environment(\.layoutDirection, .rightToLeft)
        }
        else {
            FirstView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
