//
//  SecondView.swift
//  LocalizationTask
//
//  Created by Chicmic on 14/04/23.
//

import SwiftUI

struct SecondView: View {
    
    @AppStorage(Constants.languageString)
    private var language = LocalizationService.shared.language
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text(Constants.firstNameLabel.localized(language))
                    
                    TextField(Constants.namePlaceholder.localized(language), text: $viewModel.firstName)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black.opacity(0.5), lineWidth: 2)
                                .frame(height: CGFloat(45))
                        )
                        .foregroundColor(Color.black)
                        .tint(Color.black)
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(Constants.lastNameLabel.localized(language))
                    
                    TextField(Constants.namePlaceholder.localized(language), text: $viewModel.lastName)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black.opacity(0.5), lineWidth: 2)
                                .frame(height: CGFloat(45))
                        )
                        .foregroundColor(Color.black)
                        .tint(Color.black)
                }
                .padding()
                
                VStack (alignment: .leading, spacing: 0){
                    Text(Constants.birthDateLabel.localized(language))
                    DatePicker(Constants.placeholder.localized(language), selection: $viewModel.date, displayedComponents: .date)
                        .environment(\.locale, .init(identifier: LocalizationService.shared.language.rawValue))
                        .foregroundColor(Color.gray)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black.opacity(0.5), lineWidth: 2)
                                .frame(height: CGFloat(45))
                        )
                }
                .padding(.leading)
                .padding(.trailing)
                .padding(.top)
                
                HStack {
                    Image(systemName: Constants.exclamationImage)
                        .foregroundColor(Color.red)
                    Text(Constants.ageString.localized(language))
                        .foregroundColor(Color.red)
                    Spacer()
                }
                .padding(.leading)
                .padding(.bottom)
                
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text(Constants.heightLabel.localized(language))
                        Spacer()
                        Picker(Constants.pickerLabel, selection: $viewModel.picker) {
                            Text(Constants.pickerLabel1.localized(language))
                                .tag(0)
                            Text(Constants.pickerLabel2.localized(language))
                                .tag(1)
                        }
                        .pickerStyle(.segmented)
                        .background(Constants.orangeColor)
                        .cornerRadius(10)
                    }
                    .padding(.leading)
                    .padding(.trailing)
                    
                    Menu {
                        ForEach(Constants.heightDropDownList, id: \.self){ client in
                            Button(client.localized(language)) {
                                viewModel.height = client.localized(language)
                            }
                        }
                    } label: {
                        VStack(spacing: 4){
                            HStack{
                                Text((viewModel.height).isEmpty ? Constants.placeholder.localized(language) : viewModel.height)
                                    .foregroundColor(viewModel.height.isEmpty ? .gray : .black)
                                Spacer()
                                Image(systemName: Constants.chevronImage)
                                    .foregroundColor(Color.black)
                                    .font(Font.system(size: 20, weight: .bold))
                            }
                            .padding(.horizontal)
                            Rectangle()
                                .fill(Color.black.opacity(0))
                                .frame(height: 2)
                        }
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black.opacity(0.5), lineWidth: 2)
                                .frame(height: CGFloat(45))
                        )
                    }
                    .padding(.leading)
                    .padding(.trailing)
                }
                .padding(.top)
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(viewModel: ViewModel())
    }
}
