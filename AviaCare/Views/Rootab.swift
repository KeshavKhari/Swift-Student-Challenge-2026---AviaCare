//
//  Rootab.swift
//  BirdAid
//
//  Created by Keshav Khari on 02/02/26.
//

import SwiftUI

struct Rootab: View {
    
    var body: some View {
        
        TabView {
            
            NavigationStack { 
                Rescue()
            }
            .tabItem{
                Label("Rescue", systemImage: "cross")
                
                
            }
            
            NavigationStack {
                Vet()
            }
            .tabItem{
                Label("Veterinarian", systemImage: "building.2")
            }
            
            
            
            NavigationStack{
                Prevent()
            }
            .tabItem{
                Label("Prevent", systemImage: "shield")
                
            }
        }
    }
}
           
            


#Preview {
    Rootab()
}
