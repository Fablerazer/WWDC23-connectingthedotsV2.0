import SwiftUI

@main
struct ConnectingTheDotApp: App {
    @StateObject var appState = AppState()
    @StateObject var storage = TextStorage()

    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
                .environmentObject(storage)
        }
    }
}
