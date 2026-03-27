//
//  Category.swift
//  BirdAid
//
//  Created by Keshav Khari on 07/02/26.
//

import Foundation

struct CategoryItem: Identifiable {
    let id = UUID()
    let titleName: String
    let imgeName: String
    let detail: InstructionDetail
}

struct Category: Identifiable {
    let id = UUID()
    let categoryName: String
    let items: [CategoryItem]
}


let Categories: [Category] = [
    Category(
        categoryName: "Emergency Help",
        items: [
            CategoryItem(titleName: "Wildlife Attack", imgeName: "cat", detail: rescueInstruction[0]),
            CategoryItem(titleName: "Wing Dropping", imgeName: "birdWing", detail: rescueInstruction[1]),
            CategoryItem(titleName: "Bleeding", imgeName: "birdBleeding", detail: rescueInstruction[2]),
            CategoryItem(titleName: "Not Standing", imgeName: "birdFoot", detail: rescueInstruction[3]),
        ]
        ),
    Category(
        categoryName: "Environmental Stress",
        items:[
            CategoryItem(titleName: "Extreme Heat", imgeName: "birdHeat", detail: rescueInstruction[4]),
            CategoryItem(titleName: "Pollution", imgeName: "birdPollution", detail: rescueInstruction[5])
        ]
    ),
    
    Category(
        categoryName: "Urban Accidents",
        items:[
            CategoryItem(titleName: "Window Collusion", imgeName: "window", detail: rescueInstruction[6]),
            CategoryItem(titleName: "Net Stuck", imgeName: "birdNet", detail: rescueInstruction[7])
        ]
    ),
    
    Category(
        categoryName: "Baby Birds",
        items:[
            CategoryItem(titleName: "Chick", imgeName: "chick", detail: rescueInstruction[8]),
            CategoryItem(titleName: "Fallen Nest", imgeName: "nest", detail: rescueInstruction[9]),
            CategoryItem(titleName: "Fledgling hopping", imgeName: "hopping", detail: rescueInstruction[10])
            
        ]
    )
]

        

