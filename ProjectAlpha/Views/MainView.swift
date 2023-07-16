//
//  ContentView.swift
//  ProjectAlpha
//
//  Created by Anshul Singh on 16/07/2023.
//

import SwiftUI

struct MainView: View {
    var body: some View{
        NavigationView{
            VStack{
                Text("Project Alpha")
                    .font(.system(size:50))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.gray)
                    .padding(.top, 30.0)
                
                NavigationLink(destination: SettingsView()){
                    HStack{
                        Image(systemName: "gearshape")
                            .padding(.leading, 40.0)
                            .padding(.top, -20.0)
                            .font(.system(size:30))
                            .foregroundColor(Color.red)
                    }
                    Spacer()
                }
                
                Spacer()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
