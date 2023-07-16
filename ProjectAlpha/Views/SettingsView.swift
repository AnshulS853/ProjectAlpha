import SwiftUI

struct SettingsView: View {
    
    @State private var darkMode_isEnabled:Bool = false
    @State private var iCloud_isEnabled:Bool = true
    
    var body: some View{
        
        NavigationView{
            VStack{
                Form{
                    
                    Toggle("Enable Dark Mode",isOn:$darkMode_isEnabled)
                    
                    Toggle("Enable iCloud Backup",isOn:$iCloud_isEnabled)
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
