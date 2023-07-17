import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @AppStorage("useiOSAppearance") private var useiOSAppearance: Bool = true
    @State private var isiCloudBackup: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("App appearance")) {
                        Toggle("Use iOS Appearance", isOn: $useiOSAppearance)
                            .onChange(of: useiOSAppearance) { newValue in
                                if newValue {
                                    isDarkMode = isDeviceDefaultDarkMode()
                                }
                            }
                        if !useiOSAppearance {
                            Toggle("Dark Mode", isOn: $isDarkMode)
                        }
                    }

                    Section(header: Text("Backup")) {
                        Toggle("iCloud Backup", isOn: $isiCloudBackup)
                    }

                    Section(header: Text("ABOUT")) {
                        HStack {
                            Text("Version")
                            Spacer()
                            Text("0.1")
                        }

                        HStack {
                            Text("Developed by")
                            Spacer()
                            Text("Anshul Singh")
                        }
                    }
                }
                .navigationTitle("Settings")
            }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
        .onAppear {
            isDarkMode = isDeviceDefaultDarkMode()
        }
    }

    private func isDeviceDefaultDarkMode() -> Bool {
        if useiOSAppearance {
            if UIScreen.main.traitCollection.userInterfaceStyle == .dark {
                return true
            } else {
                return false
            }
        } else {
            return isDarkMode
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
