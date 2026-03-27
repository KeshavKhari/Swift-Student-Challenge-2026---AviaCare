//
//  BirdBox.swift
//  BirdAid
//
//  Created by Keshav Khari on 02/02/26.
//

import SwiftUI

struct BirdBox: View {
    
    let categoryName: String
    let categoryImage: String

    var body: some View {
        
        VStack {
            
            VStack(spacing: 8) {
                Image(categoryImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)

                Text(categoryName)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(25)
        .shadow(
            color: Color.black.opacity(0.12),
            radius: 20,
            x: 0,
            y: 4
        )
    }
}

#Preview {
    
    BirdBox(categoryName: "Net", categoryImage: "birdNet")
}
