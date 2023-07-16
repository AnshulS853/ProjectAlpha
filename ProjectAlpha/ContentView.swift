//
//  ContentView.swift
//  ProjectAlpha
//
//  Created by Anshul Singh on 16/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var buttonClicks:Int = 0
    
    var body: some View {
        VStack {
            Text("Project Alpha")
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .bold()
                .font(.system(size:55))
            
            HStack{
                Button {
                } label: {
                    Image(systemName: "gearshape")
                        .padding(.leading, 7.0)
                        .padding(/*@START_MENU_TOKEN@*/.top, -20.0/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 30))
                        .foregroundColor(.accentColor)

                        
                        
                }
            Spacer()
            }
            
            Spacer()
            
            Text("Number of button clicks:\n" + String(buttonClicks))
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button {
                buttonClicks += 1
                
            } label: {
                VStack{
                    Image(systemName: "camera.fill")
                        .font(.system(size:100))
                        .foregroundColor(.accentColor)
                    
                    Text("Scan a Receipt")
                        .multilineTextAlignment(.center)
                }
            }
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
