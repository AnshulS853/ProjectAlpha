//
//  ContentView.swift
//  ReceiptAlpha
//
//  Created by Anshul Singh on 16/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        
        VStack {
            Text("Project Alpha")
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .bold()
                .font(.system(size:55))
            
            NavigationStack {
            }
            .padding(.top, -30.0)
            .searchable(text: $searchText)
            
            Spacer()
            
            Image(systemName: "camera.fill")
                .resizable()
                .scaledToFit()
                .padding(.bottom, -130.0)
                .scaleEffect(0.3)
                .foregroundColor(.purple)
            Text("Scan a Receipt")
                .multilineTextAlignment(.center)
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
