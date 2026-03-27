//
//  Instruction.swift
//  BirdAid
//
//  Created by Keshav Khari on 07/02/26.
//

import SwiftUI

struct Instruction: View {
    
    let detail: InstructionDetail
    
    @StateObject private var audioManager = AudioManager()
    @State private var isPlaying = false
    @State private var isExpanded = false
    @State private var expandAllBoxes = false
    @State private var isSymptom = false
    @State private var currentExpandedIndex: Int = 0
    
    var body: some View {
        
        ZStack {
            
            ScrollView {
                
                Image(detail.heroImage)
                    .resizable()
                    .frame(height: 400)
                    .scaledToFit()
                    .clipped()
                
                VStack(alignment: .leading) {
                    
                    HStack(alignment: .center) {
                       
                        Text(detail.title)
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundStyle(.cyan)
                            .padding(.horizontal)
                        
                        Spacer()
                        
                        Button {
                            withAnimation(.easeInOut(duration: 0.3)){
                                isSymptom.toggle()
                            }
                        } label: {
                            Image(systemName: isSymptom ? "eye.slash.fill": "eye.fill")
                                .imageScale(.medium)
                                .glassEffect(.regular.interactive())
                                .padding(.horizontal)
                        }
                        
                    }
                    
                    if isSymptom{
                        symptonBox(intro: detail.intro, points: detail.symptoms)
                            .transition(.opacity.combined(with: .scale(scale: 0.95)))
                    }
                    
                    VStack(alignment: .leading, spacing: 15)
                    {
                        ForEach(Array(detail.steps.enumerated()), id: \.element.id){index, step in
                            InfoBox(step: step, expandAll: expandAllBoxes, shouldExpand: index <= currentExpandedIndex, isLastStep: index == detail.steps.count - 1,
                                    onNext: {
                                    withAnimation(.spring())
                                    {
                                        if currentExpandedIndex < detail.steps.count - 1 {
                                            currentExpandedIndex += 1
                                        }
                                    }
                            })
                        }
                    }
                    
                }
                
            }
            .safeAreaInset(edge: .bottom){
                Color.clear
                    .frame(height: 80)
            }
            
            VStack(alignment: .center) {
                
                Spacer()
                
                HStack {
                    
                    if isExpanded {
                        
                        Button {
                            audioManager.skipBackward()
                        } label: {
                            Image(systemName: "gobackward.5")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundStyle(Color.play)
                                .frame(width: 30, height: 30)
                        }
                        .transition(.move(edge: .leading).combined(with: .opacity))
                        
                    }
                    
                    Button {
                        
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                            if !isExpanded {
                                isExpanded = true
                            }
                            
                            expandAllBoxes = true
                        }
                        
                        if isPlaying {
                            audioManager.pause()
                        } else {
                            audioManager.play(fileName: detail.audioFile)
                        }
                        
                        withAnimation(.easeInOut(duration: 0.2)) {
                            isPlaying.toggle()
                        }
                        
                    } label: {
                        Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundStyle(Color.play)
                            .frame(width: 36, height: 36)
                            .scaleEffect(isPlaying ? 1.1 : 1.0)
                            .animation(.easeInOut(duration: 0.2), value: isPlaying)
                    }

                    
                    if isExpanded {
                        
                        Button {
                            audioManager.skipForward()
                        } label: {
                            Image(systemName: "goforward.5")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundStyle(Color.play)
                                .frame(width: 30, height: 30)
                        }
                        .transition(.move(edge: .trailing).combined(with: .opacity))
                    }
                }
                .padding(.vertical, 8)
                .padding(.horizontal, isExpanded ? 18 : 12)
                .background(
                    Capsule()
                        .fill(.clear)
                        .glassEffect(.regular.interactive())
                )
                .animation(.spring(response: 0.35, dampingFraction: 0.8), value: isExpanded)

            }
            
        }
        .ignoresSafeArea(edges: .top)
        .toolbar(.hidden, for: .tabBar)
    }
}

struct symptonBox: View {
    
    let intro: String
    let points: [String]
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 12) {
            
            Text(intro)
                .font(.callout)
                .foregroundStyle(.white)
                .fixedSize(horizontal: false, vertical: true)
            
            Text("Symptoms")
                .font(.headline)
                .foregroundStyle(.white)
            
            VStack(alignment: .leading, spacing: 6) {
                
                ForEach(points, id: \.self){ point in
                    HStack(alignment: .top, spacing: 8) {
                        Text("•")
                        Text(point)
                    }
                }
            }
            .font(.subheadline)
            .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.symptom)
        )
        .padding(.horizontal)
    }
}

#Preview {
    Instruction(detail: InstructionDetail(
        title: "Wildlife Attack",
        heroImage: "TitlewildlifeAttac",
        intro: "Bleeding in birds is a medical emergency that requires immediate pressure and urgent veterinary care.",
        symptoms: ["Visible blood on feathers or skin", "Blood dripping or pooling", "Weakness or inability to stand"],
        audioFile: "Wildlife",
        steps: [
            InstructionStep(
                stepNumber: "Step 1",
                heading: "Protect Yourself",
                imageName: "Rescuewildlife1",
                warningpoints: [warningPoint(colorName: Color.red, text: "Cat bites can cause fatal infection quickly.")],
                points: [
                    InstructionPoint(text: "Wear disposable gloves."),
                    InstructionPoint(text: "If unavailable, use a thick towel.",) ,
                    InstructionPoint(text: "Avoid contact with saliva or blood."),
                    InstructionPoint(text: "Wash hands after handling."),
                    InstructionPoint(text: "Cat bites can cause fatal infection quickly.", ),
                ]
            ),
            InstructionStep(
                stepNumber: "Step 2",
                heading: "Secure the Scene",
                imageName: "Rescuewildlife2",
                warningpoints: nil,
                points: [
                    InstructionPoint(text: "Make sure the predator is gone."),
                    InstructionPoint(text: "Move pets and people away.",),
                    InstructionPoint(text: "Approach slowly and quietly.")
                ]
            ),
            InstructionStep(
                stepNumber: "Step 3",
                heading: "Contain the Bird",
                imageName: "wildlife3",
                warningpoints: [warningPoint(colorName: Color.red, text: "Do NOT clean deep puncture wounds.")],
                points: [
                    InstructionPoint(text: "Gently cover with a towel.",),
                    InstructionPoint(text: "Hold wings against the body.",),
                    InstructionPoint(text: "Place in a ventilated cardboard box."),
                    InstructionPoint(text: "Keep dark and warm."),
                    InstructionPoint(text: "Do NOT clean deep puncture wounds.")
                ]
            ),
            InstructionStep(
                stepNumber: "Step 4",
                heading: "Immediate Veterinary Care",
                imageName: "wildlife4",
                warningpoints: nil,

                points: [
                    InstructionPoint(text: "Contact wildlife rescue immediately."),
                    InstructionPoint(text: "Do not 'wait and watch'.", ),
                    InstructionPoint(text: "Transport within hours.", ),
                    InstructionPoint(text: "Even small bite wounds require antibiotics.", )
                ]
            )
        ]
    ))
}
