//
//  PreventModel.swift
//  BirdAid
//
//  Created by Keshav Khari on 12/02/26.
//

import Foundation

struct PreventSection: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let description: String
}

struct PreventDetail {
    let title: String
    let intro: String
    let sections: [PreventSection]
    let bulletPoints: [String]
}


let prevents : [PreventDetail] = [
    
    PreventDetail(title: "Window Collision",
                  intro: "Birds often mistake clear or reflective glass for open sky, trees, or water. When they try to fly through these reflections, they collide with windows at high speed. This is one of the leading causes of bird injuries and deaths in urban areas, especially around homes, offices, and balconies.",
                  sections:
                    [(PreventSection(title: "🪟 Make Glass Visible to Birds", imageName: "Preventwindow1", description: "Birds cannot recognize clear or reflective glass as a barrier. By adding stickers, dots, or simple tape patterns to your windows, you break up reflections of the sky and trees. This helps birds understand that the surface is solid and prevents dangerous collisions. Even small visible patterns can make a big difference.")),
                     (PreventSection(title: "🪟 Use Curtains or Blinds", imageName: "Preventwindow2", description: "Closing curtains or blinds reduces strong reflections on glass surfaces. When reflections are minimized, birds are less likely to mistake windows for open space. This is one of the simplest and most effective ways to prevent window strikes, especially during bright daylight or migration seasons."))],
                  bulletPoints: ["Turn off unnecessary lights at night", "Avoid placing bird feeders directly in front of glass", "Place plants slightly away from windows"]),
    
    
    PreventDetail(title: "Heat",
                  intro: "Heat waves are becoming more intense due to climate change. When temperatures rise too high, birds struggle to cool their bodies. They lose water quickly through panting and can suffer from heatstroke or dehydration, especially when water sources dry up. Extreme heat during breeding season is particularly dangerous for both adult birds and chicks.",
                  sections:
                    [(PreventSection(title: "💧 Offer Water", imageName: "heat1", description: "During extreme heat, water is the most important resource birds need. Birds cool themselves by panting, which causes rapid water loss. Providing a shallow bird bath or water bowl helps them drink and bathe, lowering their body temperature. Even a simple, clean dish of water placed in shade can save lives during heat waves. Make sure to refill it daily and clean it regularly to prevent disease.")),
                     (PreventSection(title: "🌳 Provide Shade", imageName: "heat2", description: "Birds avoid overheating by resting in cool, shaded areas during the hottest part of the day. Planting native trees, shrubs, or even placing water bowls under shaded areas gives birds a safe place to recover from heat stress. If you use nest boxes, make sure they are placed in shade, as direct sunlight can dangerously overheat them."))
                    ],
                  bulletPoints: ["Plant native species that provide natural food sources",
                                 "Avoid using pesticides during breeding season",
                                 "Remove spoiled suet in hot weather",
                                "Reduce lawn mowing and emissions to lower heat impact"]
                  
                 ),
    
    PreventDetail(title: "Habitat",
                  
                  intro: "Birds depend on trees, shrubs, and natural spaces for nesting, food, and shelter. When trees are cut down, land is cleared, or green spaces are replaced with concrete, birds lose their homes. Habitat loss is one of the biggest threats to bird populations, especially in cities where nesting areas are already limited.",
                  
                  sections: [(PreventSection(title: "🌳 Protect Existing Trees", imageName: "habitat1", description: "Mature trees are critical for nesting and shelter. Avoid cutting or heavy trimming during nesting season, as hidden nests may be present. Even a single tree in an urban area can support multiple bird species. Protecting what already exists is one of the most powerful ways to support bird life.")),
                            
                             PreventSection(title: "🌼 Reduce Lawn, Plant Natives", imageName: "habitat2", description: "Large lawns provide little food or shelter for birds. Replacing parts of your lawn with native plants, shrubs, or ground cover creates natural habitat. Native plants support insects, berries, and seeds — all essential food sources, especially during breeding season."),
                            PreventSection(title: "🚫 Avoid Pesticides", imageName: "habitat3", description: "Chemical pesticides kill insects that birds depend on for survival. During breeding season, most birds feed their chicks caterpillars and other insects. Reducing or eliminating pesticide use protects both insect populations and the birds that rely on them.")],
                            
                  
                  bulletPoints: ["Leave fallen leaves and twigs for nesting material", "Avoid over-cleaning natural spaces",
                                 "Reduce pesticide use", "Support local tree-planting initiatives"]),
    
    
    PreventDetail(title: "Wildlife Attacks",
                  
                  intro: "Birds, especially chicks and injured birds, are vulnerable to attacks from predators like cats, dogs, and other urban wildlife. In cities and residential areas, human activity often increases these risks. Many attacks can be prevented with small changes in how we manage pets and outdoor spaces.",
                  
                  sections: [PreventSection(title: "🐱 Keep Cats Indoors or Supervised", imageName: "wildlife1", description: "Domestic cats are one of the leading human-related threats to birds. Even well-fed cats naturally hunt birds. Keeping cats indoors, using supervised outdoor time, or installing enclosed “cat patios” significantly reduces bird injuries and deaths."),
                            
                             PreventSection(title: "🪺 Protect Nests and Young Birds", imageName: "wildlife2", description: "Avoid disturbing nests, especially during breeding season. If you find a fallen chick, keep pets away and observe from a distance — parent birds are often nearby. Creating safe, quiet spaces around trees and shrubs helps reduce predator access.")],
                  
                  bulletPoints: ["Keep dogs on leash near nesting areas", "Avoid feeding stray animals near bird habitats", "Secure trash to prevent attracting predators", "Install bird-safe fencing around sensitive areas"]),
    
    PreventDetail(title: "Food",
                  intro: "Birds depend on natural sources like insects, seeds, berries, and nectar for survival. In cities, food becomes limited due to habitat loss, pesticide use, and extreme weather. During breeding season especially, a shortage of insects can make it difficult for parent birds to feed their chicks.",
                  sections: [PreventSection(title: "🌾 Grow Natural Food Sources", imageName: "food1", description: "Planting native shrubs, flowering plants, and fruit-bearing trees creates a steady food supply. Native plants attract insects, which are essential for young birds. Even a small balcony garden with the right plants can support local bird populations."),
                             PreventSection(title: "🥣 Use Bird Feeders Responsibly", imageName: "food2", description: "Bird feeders can help supplement food, especially during extreme weather. Use appropriate seeds for local species and clean feeders regularly to prevent disease. Avoid putting out spoiled food, and remove suet during very hot weather to prevent it from turning rancid.")
                            ],
                  bulletPoints: ["Avoid pesticide use", "Leave some seed heads and dry plants in winter", "Provide fruit pieces during extreme heat", "Grow flowering plants that support pollinators", "Reduce over-trimming of shrubs"])
                 
]
