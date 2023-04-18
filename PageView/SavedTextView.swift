//
//  File.swift
//  
//
//  Created by Faizal Hudya Rizfianto on 18/04/23.
//

import SwiftUI

struct SavedTextsView: View {
    @EnvironmentObject var storage: TextStorage
    @State private var editMode = EditMode.inactive
    
    var body: some View {
        List {
            Section(header: Text("SD")) {
                ForEach(storage.sdTexts, id: \.self) { text in
                    Text(text)
                }
                .onDelete { indexSet in
                    storage.sdTexts.remove(atOffsets: indexSet)
                }
                .onMove { indices, newOffset in
                    storage.sdTexts.move(fromOffsets: indices, toOffset: newOffset)
                }
            }

            Section(header: Text("SMP")) {
                ForEach(storage.smpTexts, id: \.self) { text in
                    Text(text)
                }
                .onDelete { indexSet in
                    storage.smpTexts.remove(atOffsets: indexSet)
                }
                .onMove { indices, newOffset in
                    storage.smpTexts.move(fromOffsets: indices, toOffset: newOffset)
                }
            }

            Section(header: Text("SMA")) {
                ForEach(storage.smaTexts, id: \.self) { text in
                    Text(text)
                }
                .onDelete { indexSet in
                    storage.smaTexts.remove(atOffsets: indexSet)
                }
                .onMove { indices, newOffset in
                    storage.smaTexts.move(fromOffsets: indices, toOffset: newOffset)
                }
            }

            Section(header: Text("Kuliah")) {
                ForEach(storage.kuliahTexts, id: \.self) { text in
                    Text(text)
                }
                .onDelete { indexSet in
                    storage.kuliahTexts.remove(atOffsets: indexSet)
                }
                .onMove { indices, newOffset in
                    storage.kuliahTexts.move(fromOffsets: indices, toOffset: newOffset)
                }
            }
        }
        .navigationBarTitle("Saved Texts")
        .navigationBarItems(trailing: EditButton())
        .environment(\.editMode, $editMode)
    }
}

struct SavedTextsView_Previews: PreviewProvider {
    static var previews: some View {
        SavedTextsView().environmentObject(TextStorage())
    }
}
