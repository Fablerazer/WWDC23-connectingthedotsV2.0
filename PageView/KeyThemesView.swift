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
                Section(header: Text("Explanation")) {
                                Text("This is the explanation of the form section")
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
                
                Section(
                ){
                    Button(action: {
                                        // Navigate to the next page
                                    }, label: {
                                        Text("Next Page")
                                            .padding()
                                            .foregroundColor(.white)
                                            .background(Color.blue)
                                            .cornerRadius(10)
                                    })
                                    .padding()
                }
            }
            .navigationBarTitle("Key Journey Themes")
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

class NavigationState: ObservableObject {
    @Published var currentPage: AnyView
    
    init<Content: View>(@ViewBuilder startPage: () -> Content) {
        self.currentPage = AnyView(startPage())
    }
    
    func push<Content: View>(_ view: Content) {
        self.currentPage = AnyView(view)
    }
}

struct NextPageView: View {
    var body: some View {
        Text("This is the next page")
    }
}


struct KeyThemesView_Previews: PreviewProvider {
    static var previews: some View {
        KeyThemesView().environmentObject(TextStorage())
    }
}
