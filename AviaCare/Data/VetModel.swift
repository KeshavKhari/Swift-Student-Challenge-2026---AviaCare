//
//  vetModell.swift
//  BirdAid
//
//  Created by Keshav Khari on 16/02/26.
//

import Foundation

struct vetModel: Identifiable {
    
    let id = UUID()
    let title: String
    let points: [String]
    let subheading: String
    
}



let vetInstructions: [vetModel] = [
    
    vetModel(
        title: "How the Injury Happened",
        points: [
            "Was it a cat attack, dog attack, or predator attack?",
            "Did the bird hit a window or vehicle?",
            "Was it found trapped in a net, thread, or cage?",
            "Was there any fall from height?"
            
        ],
        subheading: "This helps the vet assess internal trauma and infection risk (especially cat bites)."
    ),
    
    vetModel(
        title: "Time Since Injury",
        points: [
            "When did you first notice the injury?",
            "Approximately how many hours ago did it occur?",
        ],
        subheading: "Time is critical in birds because they deteriorate quickly."
    ),
    
    vetModel(
        title: "Visible Symptoms",
        points: [
            "Bleeding (location and amount)",
            "Swelling",
            "Drooping wing",
            "Inability to stand or fly",
            "Labored breathing",
            "Closed eyes or unresponsiveness",
            "Seizures or tremors",
        ],
        subheading: "Even small signs can indicate serious internal damage."
    ),
    
    vetModel(
        title: "Bird’s Behavior",
        points: [
            "Is the bird alert or lethargic?",
            "Is it trying to escape?",
            "Is it sitting fluffed up and still?",
            "Is it chirping normally or silent?",
        ],
        subheading: "Behavior changes often reveal shock or pain."
    ),
    
    vetModel(
        title: "Feeding and Drinking",
        points: [
            "Has the bird eaten or drunk anything?",
            "Was any food or water given after rescue?",
            "Was anything force-fed?",
            "Improper feeding can worsen the condition."
        ],
        subheading: "Behavior changes often reveal shock or pain."
    ),
    
    vetModel(
        title: "Any First Aid Given",
        points: [
            "Did you clean the wound?",
            "Was any antiseptic applied?",
            "Was the wing splinted?",
            "Was the bird placed in a box?",
        ],
        subheading: "This prevents duplicate treatment or harmful interactions."

    ),
    
    vetModel(
        title: "Contact with Cats (Very Important)",
        points: [
            "Was the bird in a cat’s mouth?",
            "Even if there is no visible wound, tell the vet clearly.",
            "Cat saliva bacteria can cause fatal infections within 24–48 hours."
        ],
        subheading: "Cat saliva bacteria can cause fatal infections within 24–48 hours."

    ),
    
    vetModel(
        title: "Environment Details",
        points: [
            "Where was the bird found? (roadside, garden, balcony)",
            "Was it exposed to heat, rain, or cold?",
            "Any possible toxin exposure (oil, chemicals)?",
            "Environmental factors affect treatment decisions."
        ],
        subheading: "Environmental factors affect treatment decisions."

    ),
    
    vetModel(
        title: "Species (If Known)",
        points: [
            "Sparrow, pigeon, parrot, crow, etc.",
            "Adult, juvenile, or fledgling?",
            "Different species require different treatment approaches."
        ],
        subheading: "Different species require different treatment approaches."

    ),
    
    vetModel(
        title: "Duration in Your Care",
        points: [
            "How long has the bird been with you?",
            "Has its condition improved or worsened?",
        ],
        subheading: "Progression patterns help diagnose internal injury."

    )
    
]
