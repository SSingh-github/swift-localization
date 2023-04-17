//
//  ThirdView.swift
//  LocalizationTask
//
//  Created by Chicmic on 14/04/23.
//

import SwiftUI

struct ThirdView: View {
    
    @AppStorage(Constants.languageString)
    private var language = LocalizationService.shared.language
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ScrollView {
            HStack {
                VStack {
                    Spacer()
                    Text(Constants.asterisk)
                        .font(.title)
                        .foregroundColor(Color.gray)
                    Spacer()
                }
                Text(Constants.weightString.localized(language))
                    .foregroundColor(Color.gray)
                Spacer()
            }
            .padding(.leading)
            
            VStack(alignment: .leading, spacing: 0) {
                
                Text(Constants.genderLabel.localized(language))
                    .padding(.leading)
                    .padding(.top)
                
                Menu {
                    ForEach(Constants.genderDropDownList, id: \.self){ client in
                        Button(client.localized(language)) {
                            viewModel.gender = client.localized(language)
                        }
                    }
                } label: {
                    VStack(spacing: 4){
                        HStack{
                            Text(viewModel.gender.isEmpty ? Constants.placeholder.localized(language): viewModel.gender)
                                .foregroundColor(viewModel.gender.isEmpty ? .gray : .black)
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
            
            HStack {
                Toggle(isOn: $viewModel.checkBox) {
                   Text(Constants.checkboxLabel)
               }
               .toggleStyle(iOSCheckboxToggleStyle())
               .tint(Constants.orangeColor)
   
                Text(Constants.checkboxString.localized(language))
                    .foregroundColor(Color.gray)
               Spacer()
           }
           .padding()
            
            HStack {
                VStack {
                    Divider()
                        .frame(maxWidth: 60)
                        .overlay(Color.black)
                }
                Text(Constants.syncString.localized(language))
                VStack {
                    Divider()
                        .frame(maxWidth: 60)
                        .overlay(Color.black)
                }
            }
            .padding(.top)
            .padding(.bottom)
            
            HStack {
                HStack {
                    Image(systemName: Constants.heartImage)
                        .font(.title2)
                        .foregroundColor(Color.red)
                        .background(Color.white)
                        .padding()
                    VStack(alignment: .leading) {
                        Text(Constants.heartString1.localized(language))
                            .bold()
                        Text(Constants.heartString2.localized(language))
                            .font(.subheadline)
                            .foregroundColor(Color.black.opacity(0.7))
                    }
                    .frame(maxHeight: 50)
                }
                Spacer()
                Toggle(Constants.toggleLabel, isOn: $viewModel.healthButton)
                    .frame(maxWidth: 50)
            }
            .padding(.leading)
            .padding(.trailing)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black.opacity(0.5), lineWidth: 2)
                    .frame(height: CGFloat(55))
            )
            .padding(.leading)
            .padding(.trailing)
            
            HStack {
                HStack {
                    Image(systemName: Constants.fitbitImage)
                        .font(.title2)
                        .foregroundColor(Constants.fitbitColor)
                        .background(Color.white)
                        .padding()
                    VStack(alignment: .leading) {
                        Text(Constants.fitbitLabel1.localized(language))
                            .bold()
                        Text(Constants.fitbitLabel2.localized(language))
                            .font(.subheadline)
                            .foregroundColor(Color.black.opacity(0.7))
                    }
                    .frame(maxHeight: 50)
                }
                Spacer()
                Toggle(Constants.toggleLabel, isOn: $viewModel.fitbitButton)
                    .frame(maxWidth: 50)
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black.opacity(0.5), lineWidth: 2)
                    .frame(height: CGFloat(55))
            )
            .padding()
            
            HStack {
                VStack {
                    Spacer()
                    Text(Constants.asterisk)
                        .font(.title)
                        .foregroundColor(Color.gray)
                    Spacer()
                }
                Text(Constants.recommendationString.localized(language))
                    .foregroundColor(Color.gray)
                Spacer()
            }
            .padding(.leading)
            .padding(.bottom)
            
            HStack {
                VStack {
                    Divider()
                        .frame(maxWidth: 80)
                        .overlay(Color.black)
                }
                Text(Constants.popupString.localized(language))
                VStack {
                    Divider()
                        .frame(maxWidth: 80)
                        .overlay(Color.black)
                }
            }
            
            HStack {
                HStack {
                    Image(systemName: Constants.wellnessImage)
                        .font(.title2)
                        .background(Color.white)
                        .padding()
                    VStack(alignment: .leading) {
                        Text(Constants.wellnessLabel1.localized(language))
                            .bold()
                        Text(Constants.wellnessLabel2.localized(language))
                            .font(.subheadline)
                            .foregroundColor(Color.black.opacity(0.7))
                            
                    }
                    .frame(maxHeight: 50)
                }
                Spacer()
                Toggle(Constants.toggleLabel, isOn: $viewModel.tipsButton)
                    .frame(maxWidth: 50)
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black.opacity(0.5), lineWidth: 2)
                    .frame(height: CGFloat(55))
            )
            .padding()
            
            Button {
    
            } label: {
                Text(Constants.saveString.localized(language))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Constants.orangeColor.cornerRadius(10))
                    .foregroundColor(.white)
                    .font(.headline)
            }
            .padding()
    
        }
        
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView(viewModel: ViewModel())
    }
}
