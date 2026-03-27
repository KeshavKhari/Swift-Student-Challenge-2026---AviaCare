//
//  InfoBox.swift
//  BirdAid
//
//  Created by Keshav Khari on 05/02/26.
//

import SwiftUI

struct InfoBox: View {
    
    @State private var isExpanded = false
    
    let step: InstructionStep
    var expandAll: Bool
    var shouldExpand: Bool
    let isLastStep: Bool
    let onNext: () -> Void
    
    var body: some View {
        
        VStack {
            
            Button {
                withAnimation(.easeInOut) {
                    isExpanded.toggle()
                }
            } label: {
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 1) {
                        
                        Text(step.stepNumber)
                            .font(.headline)
                            .foregroundStyle(.instruction)
                            .fontWeight(.semibold)
                        
                        Text(step.heading)
                            .font(.body)
                            .foregroundStyle(.primary)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.down")
                        .imageScale(.large)
                        .foregroundStyle(.primary)
                        .rotationEffect(.degrees(isExpanded ? 180 : 0))
                        .animation(.easeInOut(duration: 0.25), value: isExpanded)
                }
                .padding()
            }
            
            
            if isExpanded {
                expandedContent
                    .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }

        .onChange(of: expandAll) { _, newValue in
            withAnimation(.easeInOut) {
                isExpanded = newValue
            }
        }
        
        .onChange(of: shouldExpand) { _, newValue in
            if newValue {
                withAnimation(.easeInOut) {
                    isExpanded = true
                }
            }
        }
        
        .background(Color.white)
        .cornerRadius(15)
        .shadow(
            color: .black.opacity(0.15),
            radius: 20,
            x: 0,
            y: 4
        )
        .overlay(
            Group {
                if isExpanded {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.blue, lineWidth: 1)
                }
            }
        )
        .padding(.horizontal)
    }
    
    
    private var expandedContent: some View {
        
        VStack {
            
            ForEach(step.warningpoints ?? []) { wp in
                WarningBanner(backgroundColor: wp.colorName, text: wp.text)
                    .padding(.horizontal, 5)
            }
            
            VStack(alignment: .leading, spacing: 0) {
                
                Image(step.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    ForEach(Array(step.points.enumerated()), id: \.element.id) { index, point in
                        
                        HStack(alignment: .top, spacing: 6) {
                            
                            Text("\(index + 1).")
                                .bold()
                            
                            Text(point.text ?? "")
                                .multilineTextAlignment(.leading)
                        }
                    }
                }
                .padding()
                
                if isLastStep {
                    
                    NavigationLink{
                        VetMapView()
                    } label: {
                        Label("Call Emergency", systemImage: "phone.fill")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                    }
                    .buttonStyle(.glass)
                    .buttonBorderShape(.capsule)
                    .tint(.red)
                    
                } else {
                    Button("NEXT") {
                        onNext()
                    }
                    .controlSize(.regular)
                    .buttonStyle(.glass)
                    .buttonBorderShape(.capsule)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                }
            }
        }
    }
    
    
    
    
    struct WarningBanner: View {
        
        let backgroundColor: Color
        let text: String
        
        var body: some View {
            HStack(alignment: .top, spacing: 8) {
                
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundStyle(.white)
                
                Text(text)
                    .font(.default)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                
            }
            .foregroundStyle(.white)
            .padding(.vertical, 8)
            .padding(.horizontal)
            
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(backgroundColor)
            .cornerRadius(15)
            
        }
    }
}


#Preview {
    
    
    InfoBox(step: InstructionStep(
        stepNumber: "Step 1",
        heading: "Stay Calm & Quiet",
        imageName: "RescueWildlife1",
        warningpoints: [warningPoint(colorName: .red, text: "Only contact rescue if injured or attacked.")],
        points: [
            InstructionPoint(text: " Use a towel"),
            InstructionPoint(text: "Avoid squeezing")
        ]
    ), expandAll: false,
            shouldExpand: false,
            isLastStep: false,
            onNext:{ print("Next Tapped")}
    )
}

