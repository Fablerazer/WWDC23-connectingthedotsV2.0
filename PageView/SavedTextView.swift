//
//  File.swift
//  
//
//  Created by Faizal Hudya Rizfianto on 18/04/23.
//

import SwiftUI

class DiscardedItems {
    static let shared = DiscardedItems()
    private init() {}
    
    var items: [String] = ["the", "and", "[T]","[L]","[T&L]"]
}


struct SavedTextsView: View {
    @EnvironmentObject var storage: TextStorage
    @State private var editMode = EditMode.inactive
    
    private var discardedItems = DiscardedItems.shared.items
    private var ignoreWords = ["the", "and", "[T]", "[L]", "[T&L]"]
    
    private var allItems: [String] {
        storage.sdTexts + storage.smpTexts + storage.smaTexts + storage.kuliahTexts
    }
    
    private var mostFrequentWords: [String] {
        getMostFrequentWords(in: allItems, topN: 10, ignoreWords: ignoreWords)
    }
    
    private func getMostFrequentWords(in items: [String], topN: Int, ignoreWords: [String]) -> [String] {
        var wordsFrequency = [String: Int]()
        for section in [storage.sdTexts, storage.smpTexts, storage.smaTexts, storage.kuliahTexts].flatMap({ $0 }) {
            let words = section.components(separatedBy: .whitespacesAndNewlines)
            for word in words {
                if !ignoreWords.contains(word), !discardedItems.contains(word), !CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: word)) {
                    wordsFrequency[word, default: 0] += 1
                }
            }
        }
        let sortedWords = wordsFrequency.sorted { $0.value > $1.value }
        return Array(sortedWords.prefix(topN)).map { $0.key }
    }
    
    
    var body: some View {
        List {
            Section(header: Text("Most frequent words:")) {
                let wordCounts = allItems.reduce(into: [String: Int]()) { counts, word in
                    if !ignoreWords.contains(word), !discardedItems.contains(word), !CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: word)) {
                        counts[word, default: 0] += 1
                    }
                }
                ForEach(mostFrequentWords, id: \.self) { word in
                    Text("\(word) ")
                }
                .onAppear {
                    // Call getMostFrequentWords on apperance
                    let _ = mostFrequentWords
                }
            }
            
            Section(header: Text("Before & After Elementary School (SD)")) {
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
            
            Section(header: Text("Junior High School (SMP)")) {
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
            
            Section(header: Text("Senior High School (SMA)")) {
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
            
            Section(header: Text("University Untill Now (Kuliah)")) {
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
