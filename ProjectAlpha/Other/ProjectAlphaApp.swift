import SwiftUI

@main
struct ProjectAlphaApp: App {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @AppStorage("useiOSAppearance") private var useiOSAppearance: Bool = true

    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
        .onChange(of: isDarkMode) { newValue in
            if useiOSAppearance {
                isDarkMode = isDeviceDefaultDarkMode()
            }
        }
    }

    private func isDeviceDefaultDarkMode() -> Bool {
        if UIScreen.main.traitCollection.userInterfaceStyle == .dark {
            return true
        } else {
            return false
        }
    }
}
