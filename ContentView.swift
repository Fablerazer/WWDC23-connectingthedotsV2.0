//  WWDC 2023 Faizal
//
//  Created by Faizal Hudya Rizfianto
//  Best build & run on Ipad Pro 11 inch

// Connecting the dot

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        WelcomeView()
            .id(appState.rootViewId)
    }
}
