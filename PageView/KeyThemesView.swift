//
//  KeyThemesView.swift
//  WWDC 2023 Faizal
//
//  Created by Faizal Hudya Rizfianto on 17/04/23.
//
import SwiftUI

class TextStorage: ObservableObject {
    @Published var sdTexts: [String] = []
    @Published var smpTexts: [String] = []
    @Published var smaTexts: [String] = []
    @Published var kuliahTexts: [String] = []
}

struct KeyThemesView: View {
    @State private var sdText: String = ""
    @State private var smpText: String = ""
    @State private var smaText: String = ""
    @State private var kuliahText: String = ""
    
    @EnvironmentObject var storage: TextStorage
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("SD")) {
                    TextField("Enter text here", text: $sdText)
                    Button(action: {
                        storage.sdTexts.append(sdText)
                        sdText = ""
                    }, label: {
                        Text("Save")
                    })
                }
                
                Section(header: Text("SMP")) {
                    TextField("Enter text here", text: $smpText)
                    Button(action: {
                        storage.smpTexts.append(smpText)
                        smpText = ""
                    }, label: {
                        Text("Save")
                    })
                }
                
                Section(header: Text("SMA")) {
                    TextField("Enter text here", text: $smaText)
                    Button(action: {
                        storage.smaTexts.append(smaText)
                        smaText = ""
                    }, label: {
                        Text("Save")
                    })
                }
                
                Section(header: Text("Kuliah")) {
                    TextField("Enter text here", text: $kuliahText)
                    Button(action: {
                        storage.kuliahTexts.append(kuliahText)
                        kuliahText = ""
                    }, label: {
                        Text("Save")
                    })
                }
            }
            .navigationBarTitle("Key Themes")
            .navigationBarItems(trailing:
                NavigationLink(destination: SavedTextsView().environmentObject(storage)) {
                    Text("Check the saved text here →")
                    Image(systemName: "list.dash")
                }
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(storage)
    }
}

struct KeyThemesView_Previews: PreviewProvider {
    static var previews: some View {
        KeyThemesView().environmentObject(TextStorage())
    }
}
