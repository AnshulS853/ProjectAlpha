import SwiftUI

@main
struct ProjectAlphaApp: App {
    
    //Store the last values for the variables to maintain app appearance
    @AppStorage("useiOSAppearance") private var useiOSAppearance:Bool = true
    @AppStorage("isDarkMode") private var isDarkMode:Bool = false

    var body: some Scene {
        WindowGroup {
            //if user has turned off "Use iOS appearance" in settings then the appearance is set to dark mode
            //if variable isDarkMode is set to true (as the dark mode toggle is enabled)
            if useiOSAppearance {
                MainView()
            }
            else{
                MainView()
                    .preferredColorScheme(isDarkMode ? .dark : .light)
            }
        }
    }
}
