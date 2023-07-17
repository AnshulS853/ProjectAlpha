import SwiftUI

@main
struct ProjectAlphaApp: App {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
