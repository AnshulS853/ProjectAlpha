import SwiftUI

struct SettingsView: View {
    //Appstorage variables assigned to default values stored in app class
    //Stored to maintian the app appearance after closing
    @AppStorage("useiOSAppearance") private var useiOSAppearance = true
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    //--iCloud Functionality has not been added yet
    @State private var isiCloudBackup:Bool = false

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Appearance")){
                        Toggle("Use iOS Appearance", isOn: $useiOSAppearance)
                        
                        //Only when the useiOSAppearances variable is set to false, the dark mode toggle appears
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
