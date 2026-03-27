//
//  Vet.swift
//  BirdAid
//
//  Created by Keshav Khari on 16/02/26.
//

import SwiftUI

struct Vet: View {
    
    @State private var showPopup = false
    @State private var showMap = false
    
    let vets = [
            ("WASPCA Animal Poison Control Center", "(888) 426-4435"),
            ("Pet Poison Helpline", "(855) 764-7661"),
        ]
    
    
    var body: some View {
        
        ScrollView {
            
            
            LazyVStack(alignment: .leading, spacing: 10){
                
                Text("When taking an injured bird to a veterinarian, providing accurate and detailed information can significantly improve the bird’s chances of recovery. The following details are of utmost importance:")
                    .font(.body)
                
                ForEach(vetInstructions) { vetInstruction in
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text(vetInstruction.title)
                            .font(.title2)
                            .fontWeight(.black)
                            .foregroundStyle(.red)
                        
                        ForEach(vetInstruction.points, id: \.self) { point in
                            
                            HStack(alignment: .top, spacing: 8) {
                                
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 8))
                                    .padding(.top, 6)
                                    .foregroundStyle(.yellow)
                                
                                Text(point)
                                    .font(.body)
                            }
                        }
                        
                        Text(vetInstruction.subheading)
                            .font(.callout)
                        
                    }
                }
                
            }
            .padding()
        }
        .navigationTitle("Critical Information")
        .navigationBarTitleDisplayMode(.large)
        .navigationSubtitle("Information to Share with the Vet")
        .toolbar {
            
            ToolbarItem(placement: .topBarTrailing) {
                HStack(spacing: 12) {
                    
                    
                    NavigationLink {
                        VetMapView()
                    } label: {
                        Label("Find Nearby Vets", systemImage: "map.fill")
                    }
                    
                    
                    Button {
                        showPopup.toggle()
                    } label: {
                        Image(systemName: "phone.fill")
                            .imageScale(.large)
                            
                    }
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(
                    Capsule()
                        .fill(Color(.systemGray6))
                )
            }
        }
        
        .sheet(isPresented: $showPopup) { vetCallSheet }
    }
    
    private var vetCallSheet: some View {
        
        VStack(spacing: 20) {
            Text("Call a Vet")
                .font(.title2)
                .fontWeight(.bold)
            ForEach(vets, id: \.1) { vet in
                HStack {
                    Text(vet.0)
                        .font(.headline)
                    Spacer()
                    Button {
                        callNumber(vet.1)
                    } label: {
                        Image(systemName: "phone.fill")
                            .foregroundStyle(.white)
                            .frame(width: 40, height: 40)
                            .background(
                                Circle()
                                    .fill(Color.red)
                            )
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color(.systemGray6))
                )
            }
            Spacer()
            
            Button{
                showPopup =  false
            }  label: {
                Image(systemName: "xmark")
                    .imageScale(.large)
                    .fontWeight(.bold)
                    .foregroundStyle(.red)
                    .padding()
                    .background(
                        Circle()
                            .fill(Color.white)
                    )
            }
            .glassEffect(.regular.interactive())
        }
        .padding()
        .presentationDetents([.medium])
    }
    
    private func callNumber(_ number: String) {
        if let url = URL(string: "tel://\(number)") {
            UIApplication.shared.open(url)
        }
    }
}

#Preview {
    Vet()
}
