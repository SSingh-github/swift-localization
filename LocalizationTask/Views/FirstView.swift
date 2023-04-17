//
//  practice.swift
//  WeatherApp
//
//  Created by Chicmic on 11/04/23.
//

//and manage the language change without opening the app

import SwiftUI

struct FirstView: View {
    
    @AppStorage(Constants.languageString)
    private var language = LocalizationService.shared.language
    
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    var body: some View {

        ScrollView {
            HStack {
                Spacer()
                Text(Constants.heading.localized(language))
                    .font(.title2)
                    .bold()
                
                Menu {
                    Button {
                        LocalizationService.shared.language = .english
                    } label: {
                        Text(Constants.englishString.localized(language))
                    }
                    Button {
                        LocalizationService.shared.language = .hindi
                    } label: {
                        Text(Constants.hindiString.localized(language))
                    }
                    Button {
                        LocalizationService.shared.language = .arabic
                    } label: {
                        Text(Constants.arabicString.localized(language))
                    }
                } label: {
                    Spacer()
                    Text(Constants.languageString.localized(language))
                }.padding()
            }
            .padding()
                
                ZStack {
                    Image(Constants.headingImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .clipShape(Circle())
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Image(systemName: Constants.cameraImage)
                                .font(.title2)
                                .foregroundColor(Constants.orangeColor)
                                .clipShape(Circle())
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                    }
                    .frame(width: 70, height: 70)
                }
            if language == .arabic {
                SecondView(viewModel: self.viewModel)
                    .environment(\.layoutDirection, .rightToLeft)
                ThirdView(viewModel: self.viewModel)
                    .environment(\.layoutDirection, .rightToLeft)
            }
            else {
                SecondView(viewModel: self.viewModel)
                ThirdView(viewModel: self.viewModel)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.1))
    }
}

struct practice_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}


