//
//  viewModel.swift
//  LocalizationTask
//
//  Created by Chicmic on 14/04/23.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var date = Date()
    @Published var height = ""
    @Published var picker = 0
    @Published var gender = ""
    @Published var checkBox: Bool = false
    @Published var healthButton: Bool = true
    @Published var fitbitButton: Bool = true
    @Published var tipsButton: Bool = true
}
