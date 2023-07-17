import SwiftUI

@main
struct ProjectAlphaApp: App {
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = {
        if let deviceDefault = UserDefaults.standard.object(forKey: "AppleInterfaceStyle") as? String,
           deviceDefault == "Dark" {
            return true
        } else {
            return false
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
