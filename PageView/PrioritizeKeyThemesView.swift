//
//  PrioritizeKeyThemesView.swift
//  WWDC 2023 Faizal
//
//  Created by Faizal Hudya Rizfianto on 17/04/23.
//

import SwiftUI

struct PrioritizeKeyThemesView: View {
    @EnvironmentObject var storage: TextStorage
    @State private var selectedCategory: Category?
    @State private var showDiscardedItems = true
    @State private var discardedItems: [String] = []
    
    private enum Category: String, CaseIterable {
        case sd = "Before & After Elementary School (SD)"
        case smp = "Junior High School (SMP)"
        case sma = "Senior High School (SMA)"
        case kuliah = "University Until Now (Kuliah)"
    }
    
    private var items: [String] {
        switch selectedCategory {
        case .sd:
            return storage.sdTexts
        case .smp:
            return storage.smpTexts
        case .sma:
            return storage.smaTexts
        case .kuliah:
            return storage.kuliahTexts
        case .none:
            return []
        }
    }
    
    private var itemsToDisplay: [String] {
        if showDiscardedItems {
            return items
        } else {
            return items.filter { !discardedItems.contains($0) }
        }
    }
    
    private func selectCategory(_ category: Category) {
        selectedCategory = category
        discardedItems.removeAll()
    }
    
    private func toggleShowDiscardedItems() {
        showDiscardedItems.toggle()
    }
    
    private func toggleItem(_ item: String) {
        if discardedItems.contains(item) {
            discardedItems.removeAll(where: { $0 == item })
        } else {
            discardedItems.append(item)
        }
    }
    
    private var allItems: [String] {
        storage.sdTexts + storage.smpTexts + storage.smaTexts + storage.kuliahTexts
    }
    
    private var mostFrequentWords: [String] {
        getMostFrequentWords(in: allItems, topN: 10)
    }

    private func getMostFrequentWords(in items: [String], topN: Int) -> [String] {
        var wordsFrequency = [String: Int]()
        for section in [storage.sdTexts, storage.smpTexts, storage.smaTexts, storage.kuliahTexts].flatMap({ $0 }) {
            let words = section.components(separatedBy: .whitespacesAndNewlines)
            for word in words where !discardedItems.contains(word) {
                wordsFrequency[word, default: 0] += 1
            }
        }
        let sortedWords = wordsFrequency.sorted { $0.value > $1.value }
        return sortedWords.map { $0.key }
    }

    var body: some View {
        VStack {
            Text("Select a category to prioritize")
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Category.allCases, id: \.self) { category in
                        Button(action: {
                            selectCategory(category)
                        }, label: {
                            Text(category.rawValue)
                                .padding()
                                .background(category == selectedCategory ? Color.blue : Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        })
                    }
                }
                .padding()
            }
            
            Toggle(isOn: $showDiscardedItems, label: {
                Text("Show discarded items")
            })
            .padding()
            
            List(itemsToDisplay, id: \.self) { item in
                HStack {
                    Text(item)
                    
                    Spacer()
                    
                    Button(action: {
                        toggleItem(item)
                    }, label: {
                        if discardedItems.contains(item) {
                            Image(systemName: "square")
                        } else {
                            Image(systemName: "checkmark.square")
                        }
                    })
                }
            }
            .navigationBarTitle("Prioritize Key Themes")
            
            // Show most frequent words
            VStack {
                Text("Most frequent words:")
                    .font(.headline)
                ForEach(mostFrequentWords, id: \.self) { word in
                    Text("\(word)")
                }
            }
            .onAppear {
                // Call getMostFrequentWords on apperance
                let _ = mostFrequentWords
            }
            
            //            NavigationLink(destination: MainContentTabView().environmentObject(storage)) {
            //                Text("Next Page")
            //                    .padding()
            //                    .foregroundColor(.white)
            //                    .background(Color.blue)
            //                    .cornerRadius(10)
            //                    .padding()
            //            }
        }
    }
}

struct PrioritizeKeyThemesView_Previews: PreviewProvider {
    static var previews: some View {
        PrioritizeKeyThemesView().environmentObject(TextStorage())
    }
}
