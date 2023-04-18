//
//  File.swift
//  
//
//  Created by Faizal Hudya Rizfianto on 18/04/23.
//

import SwiftUI

struct SavedTextsView: View {
    @EnvironmentObject var storage: TextStorage

    var body: some View {
        List {
            Section(header: Text("SD")) {
                ForEach(storage.sdTexts, id: \.self) { text in
                    Text(text)
                }
            }

            Section(header: Text("SMP")) {
                ForEach(storage.smpTexts, id: \.self) { text in
                    Text(text)
                }
            }

            Section(header: Text("SMA")) {
                ForEach(storage.smaTexts, id: \.self) { text in
                    Text(text)
                }
            }

            Section(header: Text("Kuliah")) {
                ForEach(storage.kuliahTexts, id: \.self) { text in
                    Text(text)
                }
            }
        }
        .navigationBarTitle("Saved Texts")
    }
}

struct SavedTextsView_Previews: PreviewProvider {
    static var previews: some View {
        SavedTextsView().environmentObject(TextStorage())
    }
}
