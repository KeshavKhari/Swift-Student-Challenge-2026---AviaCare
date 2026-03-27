//
//  Prevent.swift
//  BirdAid
//
//  Created by Keshav Khari on 10/02/26.
//

import SwiftUI

struct Prevent: View {
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    

    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading, spacing: 16) {

                Text("Learn How to Prevent Accidents")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.horizontal)


                LazyVGrid(columns: columns, spacing: 20) {
                    
                    NavigationLink{
                         Prevent2(detail: prevents[1])
                    } label: {
                        BirdBox(categoryName: "Heat", categoryImage: "heat")
                    }
                    
                    NavigationLink{
                        Prevent2(detail: prevents[0])
                    } label: {
                        BirdBox(categoryName: "Window", categoryImage: "windowPrevent")
                    }
                    NavigationLink{
                        Prevent2(detail: prevents[2])
                    } label: {
                        BirdBox(categoryName: "Habitat", categoryImage: "habitat")
                    }
                    NavigationLink{
                        Prevent2(detail: prevents[3])
                    } label :{
                        BirdBox(categoryName: "Wildlife", categoryImage: "wildlifePrevent")
                    }
                    
                    NavigationLink{
                        Prevent2(detail: prevents[4])
                    } label :{
                        BirdBox(categoryName: "Food", categoryImage: "food")
                    }
                }
                .padding(.horizontal)
            }
            .padding(.top, 8)
        }
        .navigationTitle("Prevent")
        .navigationBarTitleDisplayMode(.large)
    }
}


#Preview {
    Prevent()
}
