import SwiftUI

struct SettingsView: View {
    @AppStorage("useiOSAppearance") private var useiOSAppearance = true
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    @State private var isiCloudBackup:Bool = false

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Appearance")){
                        Toggle("Use iOS Appearance", isOn: $useiOSAppearance)
                        
                        if useiOSAppearance == false {
                            Toggle("Dark Mode",isOn:$isDarkMode)
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
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
