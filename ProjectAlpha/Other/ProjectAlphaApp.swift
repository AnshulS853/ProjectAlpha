import SwiftUI

@main
struct ProjectAlphaApp: App {

    @AppStorage("useiOSAppearance") private var useiOSAppearance:Bool = true
    @AppStorage("isDarkMode") private var isDarkMode:Bool = false

    var body: some Scene {
        WindowGroup {
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
