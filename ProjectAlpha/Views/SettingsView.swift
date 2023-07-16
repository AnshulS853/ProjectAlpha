//
//  ContentView.swift
//  ProjectAlpha
//
//  Created by Anshul Singh on 16/07/2023.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var darkMode_isEnabled:Bool = false
    @State private var iCloud_isEnabled:Bool = true
    
    var body: some View{
        NavigationView{
            Form{
                
                Toggle("Enable Dark Mode",isOn:$darkMode_isEnabled)
                
                Toggle("Enable iCloud Backup",isOn:$iCloud_isEnabled)
                
            }
            .navigationTitle("Settings")
        }
            
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
