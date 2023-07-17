import SwiftUI

struct SettingsView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode:Bool = false
    @State private var isiCloud:Bool = true
    
    var body: some View{
        
        NavigationView{
            VStack{
                Form{
                    Toggle("Dark Mode",isOn:$isDarkMode)
                    
                    Toggle("iCloud Backup",isOn:$isiCloud)
                }
                .navigationTitle("Settings")
                
                Text("App in development")
                Text("Current version 1.0")
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}