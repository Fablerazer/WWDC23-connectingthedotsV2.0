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
    @Published var shouldKeep: [Bool] = []
}

struct KeyThemesView: View {
    @State private var sdText: String = ""
    @State private var smpText: String = ""
    @State private var smaText: String = ""
    @State private var kuliahText: String = ""
    
    @EnvironmentObject var storage: TextStorage
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Reminder")) {
                        Text("- Use big ideas only (e.g. music, fitness, design, automotive) \n- Minimum 3 key journey themes per section\n- Put as many thing as you can!")
                    }
                    
                    Section(header: Text("Before & After Elementary School (SD)")) {
                        TextField("Enter your key journey here", text: $sdText)
                        Button(action: {
                            storage.sdTexts.append(sdText)
                            sdText = ""
                        }, label: {
                            Text("Save")
                        })
                    }
                    
                    Section(header: Text("Junior High School (SMP)")) {
                        TextField("Enter your key journey here", text: $smpText)
                        Button(action: {
                            storage.smpTexts.append(smpText)
                            smpText = ""
                        }, label: {
                            Text("Save")
                        })
                    }
                    
                    Section(header: Text("Senior High School (SMA)")) {
                        TextField("Enter your key journey here", text: $smaText)
                        Button(action: {
                            storage.smaTexts.append(smaText)
                            smaText = ""
                        }, label: {
                            Text("Save")
                        })
                    }
                    
                    Section(header: Text("University Until Now (Kuliah)")) {
                        TextField("Enter your key journey here", text: $kuliahText)
                        Button(action: {
                            storage.kuliahTexts.append(kuliahText)
                            kuliahText = ""
                        }, label: {
                            Text("Save")
                        })
                    }
                }
                .navigationBarTitle("Key Journey Themes")
                .navigationBarItems(trailing:
                                        NavigationLink(destination: SavedTextsView().environmentObject(storage)) {
                    Text("Check the saved text here →")
                    Image(systemName: "list.dash")
                }
                )
                
                NavigationLink(destination: PrioritizeKeyThemesView().environmentObject(storage)) {
                    Text("Next Page")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding()
                }
                .navigationBarTitle("Key Journey Themes")
                .navigationBarItems(trailing:
                                        NavigationLink(destination: SavedTextsView().environmentObject(storage)) {
                    Text("Check the saved text here →")
                    Image(systemName: "list.dash")
                }
                )
                
            }
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
