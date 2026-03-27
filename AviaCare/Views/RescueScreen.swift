//
//  Rescue.swift
//  BirdAid
//
//  Created by Keshav Khari on 05/02/26.
//

import SwiftUI

struct Rescue: View {
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    @State private var searchText = ""
    
    
    var body: some View {
        
        ScrollView {
            
            VStack{
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    Text("AviaCare")
                        .font(.system(size: 55, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                    
                    Text("Category")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                .padding(.horizontal)
                
                VStack(spacing: 20){
                    
                    searchBar
                    infoStack
                }
                
                
            }
        }
        .onAppear{searchText = ""}
    }

    
    var searchBar: some View {
        
        HStack(spacing: 10){
            
            Image(systemName: "magnifyingglass")
                .imageScale(.medium)
                .foregroundStyle(.black)
            
            TextField("Search", text: $searchText)
                .textFieldStyle(.automatic)
        }
        
        .padding(.horizontal)
        .padding(.vertical, 7)
        
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
        )
        .padding(.horizontal, 8)
        .glassEffect(.regular.interactive())
        
    }
    
    var filteredCategories: [Category] {
        
        if searchText.isEmpty {
            return Categories
        }
        
        return Categories.compactMap { category in
            
            let filteredItems = category.items.filter {
                $0.titleName.localizedCaseInsensitiveContains(searchText)
            }
            
            if filteredItems.isEmpty {
                return nil
            }
            
            return Category(
                categoryName: category.categoryName,
                items: filteredItems
            )
        }
    }
    
    
    var infoStack: some View {
        
        LazyVStack(alignment: .leading, spacing: 25 ){
            ForEach(filteredCategories) {category in
                VStack(alignment: .leading, spacing: 25){
                    Text(category.categoryName)
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    LazyVGrid(columns: columns, spacing: 15){
                        ForEach(category.items){item in
                            NavigationLink {
                                Instruction(detail: item.detail)
                            } label: {
                                BirdBox(categoryName: item.titleName, categoryImage: item.imgeName)
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    RescueCenterView()
                } label: {
                    Image(systemName: "person.crop.circle")
                        .imageScale(.large)
                }
            }
        }
    }
}

    

    
#Preview {
    Rescue()
}
