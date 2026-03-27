//
//  Prevent2.swift
//  BirdAid
//
//  Created by Keshav Khari on 10/02/26.
//

import SwiftUI


struct Prevent2: View {
    
    @State private var showSheet = false
    
    let detail: PreventDetail
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading, spacing: 16) {
                
                Text(detail.title)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundStyle(.cyan)
                
                Divider()
                
                Text(detail.intro)
                    .font(.callout)
                                
                
                if detail.title == "Food" {
                    
                    Button("Click Here for a Food List"){
                        showSheet = true
                    }
                    .sheet(isPresented: $showSheet){
                        BirdFoodSheet()
                    }
                }
                
                
                Text("Preventive Measures:")
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(.red)
                
                ForEach(detail.sections) { section in
                    SectionView(section: section)
                }
                
                Text("🔎 Other Ways to Help:")
                    .font(.title3)
                    .fontWeight(.bold)
                
                BulletListView(items: detail.bulletPoints)
            }
            .padding()
        }
    }
}

struct SectionView: View {
    
    let section: PreventSection
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            
            Text(section.title)
                .font(.title3)
                .fontWeight(.bold)
            
            Image(section.imageName)
                .resizable()
                .scaledToFit()
            
            Text(section.description)
                .font(.callout)
        }
    }
}


struct BulletListView: View {
    
    let items: [String]
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 6) {
            ForEach(items, id: \.self) { item in
                HStack(alignment: .top, spacing: 8) {
                    Text("•")
                    Text(item)
                }
            }
        }
        .font(.callout)
    }
}

struct BirdFoodSheet: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 40) {
            
            Text("Bird Food Guide")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            HStack(spacing: 12) {
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Safe Food")
                        .font(.headline)
                        .foregroundStyle(.green)
                    
                    Text("• Sunflower\n• Safflower\n• Millet\n• Nyjer\n• Peanuts")
                }
                .frame(maxWidth: .infinity, minHeight: 150)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.green.opacity(0.09))
                )
                
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Avoid These")
                        .font(.headline)
                        .foregroundStyle(.red)
                    
                    Text("• Chocolate\n• Avocado\n• Salted Snacks\n• Bread\n• Processed Food")
                }
                .frame(maxWidth: .infinity, minHeight: 150)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.red.opacity(0.09))
                )
            }
            
            Spacer()
            
            Button(action: {
                dismiss()
            }) {
                Text("Close")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
            }
            .glassEffect(.regular.interactive())
        }
        .padding()
        .presentationDetents([.medium])
    }
}

#Preview {
    
    Prevent2(detail: PreventDetail(
        title: "Window Collision",
        intro: "Birds often mistake clear or reflective glass...",
        sections: [
            PreventSection(
                title: "Make Glass Visible to Birds",
                imageName: "window1",
                description: "Birds cannot recognize clear glass..."
            ),
            PreventSection(
                title: "Use Curtains or Blinds",
                imageName: "window3",
                description: "Closing curtains reduces reflections..."
            )
        ],
        bulletPoints: [
            "Turn off unnecessary lights at night",
            "Avoid placing bird feeders directly in front of glass",
            "Place plants slightly away from windows"
        ]
    )
)
}
