//
//  Rescue Category.swift
//  BirdAid
//
//  Created by Keshav Khari on 13/02/26.
//

import Foundation
import SwiftUI


struct warningPoint: Identifiable {
    let id = UUID()
    let colorName: Color
    let text: String
    
}

struct InstructionPoint: Identifiable {
    let id = UUID()
    let text: String?
    
}

struct InstructionStep: Identifiable {
    let id = UUID()
    let stepNumber: String
    let heading: String
    let imageName: String
    let warningpoints: [warningPoint]?
    let points: [InstructionPoint]
}

struct InstructionDetail: Identifiable {
    let id = UUID()
    let title: String
    let heroImage: String
    let intro: String
    let symptoms: [String]
    let audioFile: String
    let steps: [InstructionStep]
}

let rescueInstruction = [

    InstructionDetail(
        title: "Wildlife Attack",
        heroImage: "TitlewildlifeAttac",
        intro: "A bird attacked by a predator may appear stable but can develop fatal infection quickly.",
        symptoms: [
            "Small puncture wounds",
            "Bleeding or swelling",
            "Ruffled or missing feathers",
            "Weakness or shock",
            "Difficulty standing"
        ],
        audioFile: "Wildlife",
        steps: [
            InstructionStep(
                stepNumber: "Step 1",
                heading: "Protect Yourself",
                imageName: "Rescuewildlife1",
                warningpoints: [warningPoint(colorName: Color.red, text: "Even tiny predator bites can cause deadly infection within 24–48 hours.")],
                points: [
                    InstructionPoint(text: "Wear disposable gloves."),
                    InstructionPoint(text: "If unavailable, use a thick towel."),
                    InstructionPoint(text: "Avoid contact with saliva or blood."),
                    InstructionPoint(text: "Wash hands after handling."),
                    InstructionPoint(text: "Cat bites can cause fatal infection quickly.")
                ]
            ),
            InstructionStep(
                stepNumber: "Step 2",
                heading: "Secure the Scene",
                imageName: "Rescuewildlife2",
                warningpoints: nil,
                points: [
                    InstructionPoint(text: "Make sure the predator is gone."),
                    InstructionPoint(text: "Move pets and people away."),
                    InstructionPoint(text: "Approach slowly and quietly.")
                ]
            ),
            InstructionStep(
                stepNumber: "Step 3",
                heading: "Contain the Bird",
                imageName: "wildlife3",
                warningpoints: [warningPoint(colorName: Color.red, text: "Deep puncture wounds may seal quickly but hide severe internal infection.")],
                points: [
                    InstructionPoint(text: "Gently cover with a towel."),
                    InstructionPoint(text: "Hold wings against the body."),
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
                    InstructionPoint(text: "Do not 'wait and watch'."),
                    InstructionPoint(text: "Transport within hours."),
                    InstructionPoint(text: "Even small bite wounds require antibiotics.")
                ]
            )
        ]
    ),

    InstructionDetail(
        title: "Wing Dropping",
        heroImage: "TitlewingDroppin",
        intro: "A drooping wing usually indicates fracture, dislocation, or severe soft tissue injury.",
        symptoms: [
            "One wing hangs lower",
            "Unable to fly",
            "Wing held at odd angle",
            "Pain when moving",
            "Reluctance to move"
        ],
        audioFile: "wingdropping",
        steps: [
            InstructionStep(
                stepNumber: "Step 1",
                heading: "Minimize Handling",
                imageName: "Wing_Dropping1",
                warningpoints: [warningPoint(colorName: Color.red, text: "Improper handling can cause permanent wing damage.")],
                points: [
                    InstructionPoint(text: "Wear gloves."),
                    InstructionPoint(text: "Do not lift or stretch the wing."),
                    InstructionPoint(text: "Observe if one wing hangs lower."),
                    InstructionPoint(text: "Forcing movement can worsen fracture.")
                ]
            ),
            InstructionStep(
                stepNumber: "Step 2",
                heading: "Restrict Movement",
                imageName: "Wing_Dropping2",
                warningpoints: nil,
                points: [
                    InstructionPoint(text: "Place bird in small ventilated box."),
                    InstructionPoint(text: "Keep space small to prevent flapping."),
                    InstructionPoint(text: "Keep dark and quiet.")
                ]
            ),
            InstructionStep(
                stepNumber: "Step 3",
                heading: "Seek Professional Help",
                imageName: "Wing_Dropping3",
                warningpoints: nil,
                points: [
                    InstructionPoint(text: "Do not attempt splinting."),
                    InstructionPoint(text: "Contact wildlife rehabilitator."),
                    InstructionPoint(text: "Transport carefully.")
                ]
            )
        ]
    ),
    InstructionDetail(
        title: "Bleeding",
        heroImage: "Titlebleedin",
        intro: "Active bleeding in birds is life-threatening because even small blood loss can cause shock.",
        symptoms: [
            "Visible bleeding",
            "Blood on feathers",
            "Weakness",
            "Rapid breathing",
            "Pale appearance"
        ],
        audioFile: "bleeding",
        steps: [
            InstructionStep(
                stepNumber: "Step 1",
                heading: "Apply Pressure Immediately",
                imageName: "Bleeding1",
                warningpoints: [warningPoint(colorName: Color.red, text: "Home remedies may contaminate wounds and delay clotting.")],
                points: [
                    InstructionPoint(text: "Wear gloves."),
                    InstructionPoint(text: "Use clean gauze or cloth."),
                    InstructionPoint(text: "Apply firm, steady pressure for 2 to 5 minutes."),
                    InstructionPoint(text: "Do not lift cloth repeatedly."),
                    InstructionPoint(text: "Do NOT use turmeric, powder, or antiseptics.")
                ]
            ),
            InstructionStep(
                stepNumber: "Step 2",
                heading: "Stabilize for Shock",
                imageName: "Bleeding2",
                warningpoints: nil,
                points: [
                    InstructionPoint(text: "Place bird in warm, dark box."),
                    InstructionPoint(text: "Reduce noise and movement."),
                    InstructionPoint(text: "Keep handling minimal.")
                ]
            ),
            InstructionStep(
                stepNumber: "Step 3",
                heading: "Emergency Referral (If Bleeding Continues)",
                imageName: "Bleeding3",
                warningpoints: nil,
                points: [
                    InstructionPoint(text: "If bleeding does not stop after 5 minutes → urgent transport."),
                    InstructionPoint(text: "Contact wildlife vet immediately.")
                ]
            )
        ]
    ),

    InstructionDetail(
        title: "Not Standing",
        heroImage: "TitlenotStandin",
        intro: "A bird that cannot stand may have spinal injury, shock, or severe internal weakness.",
        symptoms: [
            "Lying flat",
            "Legs not supporting body",
            "Poor balance",
            "Minimal movement",
            "Slow response"
        ],
        audioFile: "notstanding",
        steps: [
            InstructionStep(
                stepNumber: "Step 1",
                heading: "Observe Without Forcing Movement",
                imageName: "NotStanding1",
                warningpoints: nil,
                points: [
                    InstructionPoint(text: "Wear gloves."),
                    InstructionPoint(text: "Check breathing rate."),
                    InstructionPoint(text: "See if legs move slightly."),
                    InstructionPoint(text: "Do NOT force bird to stand.")
                ]
            ),
            InstructionStep(
                stepNumber: "Step 2",
                heading: "Provide Immediate Support",
                imageName: "NotStanding2",
                warningpoints: nil,
                points: [
                    InstructionPoint(text: "Place bird in small ventilated box."),
                    InstructionPoint(text: "Line with soft cloth."),
                    InstructionPoint(text: "Provide gentle warmth (not heat)."),
                    InstructionPoint(text: "Keep dark and silent.")
                ]
            ),
            InstructionStep(
                stepNumber: "Step 3",
                heading: "Seek Urgent Help",
                imageName: "NotStanding3",
                warningpoints: nil,
                points: [
                    InstructionPoint(text: "Not standing is abnormal."),
                    InstructionPoint(text: "Contact wildlife rescue quickly."),
                    InstructionPoint(text: "Do not feed or give water.")
                ]
            )
        ]
    ),

    InstructionDetail(
        title: "Heat Stress",
        heroImage: "Titleheat",
        intro: "Heat stress occurs when a bird overheats and cannot regulate its body temperature.",
        symptoms: [
            "Panting with open beak",
            "Wings held away from body",
            "Lethargy",
            "Weakness or collapse",
            "Unresponsive behavior"
        ],
        audioFile: "heatstress",
        steps: [
            InstructionStep(
                stepNumber: "Step 1",
                heading: "Move to Shade Immediately",
                imageName: "Rescueheat1",
                warningpoints: [warningPoint(colorName: Color.red, text: "Overheating can quickly lead to organ failure.")],
                points: [
                    InstructionPoint(text: "Gently move the bird to a shaded, cool area."),
                    InstructionPoint(text: "Keep away from direct sunlight."),
                    InstructionPoint(text: "Minimize handling and stress."),
                    InstructionPoint(text: "Do not leave bird on hot pavement.")
                ]
            ),
            InstructionStep(
                stepNumber: "Step 2",
                heading: "Cool Gradually (NOT Rapidly)",
                imageName: "Rescueheat2",
                warningpoints: [warningPoint(colorName: Color.red, text: "Rapid cooling may trigger shock.")],
                points: [
                    InstructionPoint(text: "Place bird in ventilated box in cool room."),
                    InstructionPoint(text: "Provide airflow (fan at distance, not direct blast)."),
                    InstructionPoint(text: "Lightly mist feet with room-temperature water if conscious."),
                    InstructionPoint(text: "Do NOT use ice or cold water shock.")
                ]
            ),
            InstructionStep(
                stepNumber: "Step 3",
                heading: "Offer Water Safely (Only If Alert)",
                imageName: "heat3",
                warningpoints: [warningPoint(colorName: Color.red, text: "Forced water can enter lungs and cause aspiration.")],
                points: [
                    InstructionPoint(text: "Place shallow water dish nearby."),
                    InstructionPoint(text: "Do NOT force water into beak."),
                    InstructionPoint(text: "Observe for improvement."),
                    InstructionPoint(text: "Forcing water can cause aspiration.")
                ]
            ),
            InstructionStep(
                stepNumber: "Step 4",
                heading: "Seek Help If Symptoms Persist",
                imageName: "heat4",
                warningpoints: [warningPoint(colorName: Color.red, text: "Severe heatstroke requires urgent veterinary care.")],
                points: [
                    InstructionPoint(text: "Signs of severe heatstroke include panting with open beak."),
                    InstructionPoint(text: "Wings held away from body."),
                    InstructionPoint(text: "Weakness or collapse."),
                    InstructionPoint(text: "Not responding."),
                    InstructionPoint(text: "Contact wildlife rescue immediately if these appear.")
                ]
            )
        ]
    ),
    InstructionDetail(
        title: "Pollution",
        heroImage: "Titlepollutio",
        intro: "Oil or chemical exposure can damage feathers and internal organs rapidly.",
        symptoms: [
            "Feathers sticky or oily",
            "Strong chemical smell",
            "Weakness",
            "Labored breathing",
            "Irritated skin"
        ],
        audioFile: "pollution",
        steps: [
            InstructionStep(
                stepNumber: "Step 1",
                heading: "Protect Yourself First",
                imageName: "pollution1",
                warningpoints: [warningPoint(colorName: Color.red, text: "Chemical exposure can harm both rescuer and bird.")],
                points: [
                    InstructionPoint(text: "Wear gloves immediately."),
                    InstructionPoint(text: "Avoid touching chemicals directly."),
                    InstructionPoint(text: "Keep bird away from children and pets."),
                    InstructionPoint(text: "Some chemicals are toxic to humans too.")
                ]
            ),
            InstructionStep(
                stepNumber: "Step 2",
                heading: "Prevent Further Contamination",
                imageName: "pollution2",
                warningpoints: [warningPoint(colorName: Color.red, text: "Incorrect washing may worsen shock or hypothermia.")],
                points: [
                    InstructionPoint(text: "Place bird in ventilated box lined with paper towels."),
                    InstructionPoint(text: "Do NOT wash immediately (especially oil exposure)."),
                    InstructionPoint(text: "Keep bird warm and calm."),
                    InstructionPoint(text: "Washing improperly can cause shock or worsen condition.")
                ]
            ),
            InstructionStep(
                stepNumber: "Step 3",
                heading: "DO NOT Attempt Home Cleaning (Oil/Chemical)",
                imageName: "pollution3",
                warningpoints: [warningPoint(colorName: Color.red, text: "Oil removal requires trained rehabilitation techniques.")],
                points: [
                    InstructionPoint(text: "Do not use soap unless directed by professionals."),
                    InstructionPoint(text: "Do not scrub feathers."),
                    InstructionPoint(text: "Do not apply powder or remedies."),
                    InstructionPoint(text: "Oil removal requires special technique and warm water control.")
                ]
            ),
            InstructionStep(
                stepNumber: "Step 4",
                heading: "Immediate Professional Rescue",
                imageName: "pollution4",
                warningpoints: [warningPoint(colorName: Color.green, text: "Professional wildlife care greatly improves survival chances.")],
                points: [
                    InstructionPoint(text: "Contact wildlife rescue urgently."),
                    InstructionPoint(text: "Transport bird quickly."),
                    InstructionPoint(text: "Keep warm during transport."),
                    InstructionPoint(text: "Pollution cases require professional rehabilitation.")
                ]
            )
        ]
    ),

    InstructionDetail(
        title: "Window Collision",
        heroImage: "TitlewindowCollisio",
        intro: "Birds hitting windows may suffer concussion or internal injury without visible wounds.",
        symptoms: [
            "Stunned or lying still",
            "Difficulty standing",
            "Unbalanced movement",
            "Half-closed eyes",
            "Not flying away"
        ],
        audioFile: "windowcollision",
        steps: [
            InstructionStep(
                stepNumber: "Step 1",
                heading: "Ensure Safety & Approach Calmly",
                imageName: "window1",
                warningpoints: [warningPoint(colorName: Color.red, text: "Concussed birds may suddenly flutter and injure themselves further.")],
                points: [
                    InstructionPoint(text: "Wear gloves if available."),
                    InstructionPoint(text: "Make sure no pets are nearby."),
                    InstructionPoint(text: "Approach slowly and quietly."),
                    InstructionPoint(text: "Do not allow the bird to flutter around."),
                    InstructionPoint(text: "A stunned bird may suddenly attempt to fly.")
                ]
            ),
            InstructionStep(
                stepNumber: "Step 2",
                heading: "Contain Immediately",
                imageName: "window2",
                warningpoints: [warningPoint(colorName: Color.green, text: "A dark, quiet space helps reduce neurological stress.")],
                points: [
                    InstructionPoint(text: "Gently cover bird with soft towel."),
                    InstructionPoint(text: "Hold wings close to body."),
                    InstructionPoint(text: "Place in ventilated cardboard box lined with cloth."),
                    InstructionPoint(text: "Keep in dark, quiet room."),
                    InstructionPoint(text: "Darkness helps reduce brain stimulation and stress.")
                ]
            ),
            InstructionStep(
                stepNumber: "Step 3",
                heading: "Observe for 1–2 Hours",
                imageName: "window3",
                warningpoints: [warningPoint(colorName: Color.red, text: "Loss of balance may indicate serious brain trauma.")],
                points: [
                    InstructionPoint(text: "Leave bird undisturbed in dark space."),
                    InstructionPoint(text: "Do not feed or give water."),
                    InstructionPoint(text: "Check if bird becomes alert and able to stand."),
                    InstructionPoint(text: "If bird cannot stand or balance, seek help immediately.")
                ]
            ),
            InstructionStep(
                stepNumber: "Step 4",
                heading: "Release or Refer",
                imageName: "window4",
                warningpoints: [
                    warningPoint(colorName: Color.green, text: "Release only if flight is strong and coordinated."),
                    warningPoint(colorName: Color.red, text: "Persistent weakness requires wildlife veterinary care.")
                ],
                points: [
                    InstructionPoint(text: "If bird regains strength and flies normally → release outdoors in safe area."),
                    InstructionPoint(text: "If bird remains weak, bleeding, or unbalanced → contact wildlife rescue.")
                ]
            )
        ]
    ),

    InstructionDetail(
        title: "Net Stuck",
        heroImage: "TitlenetStuc",
        intro: "Entanglement in nets can cause fractures, circulation loss, or strangulation.",
        symptoms: [
            "Visible net wrapped around body",
            "Swelling of limb or neck",
            "Panic flapping",
            "Breathing difficulty",
            "Restricted movement"
        ],
        audioFile: "netstuck",
        steps: [
            InstructionStep(
                stepNumber: "Step 1",
                heading: "Protect Yourself & Secure Area",
                imageName: "net1",
                warningpoints: [warningPoint(colorName: Color.red, text: "Panic movement can tighten fibers and restrict blood flow.")],
                points: [
                    InstructionPoint(text: "Wear gloves."),
                    InstructionPoint(text: "Ensure predator or pets are gone."),
                    InstructionPoint(text: "Approach calmly to avoid panic flapping."),
                    InstructionPoint(text: "Sudden movement can tighten entanglement.")
                ]
            ),
            InstructionStep(
                stepNumber: "Step 2",
                heading: "Calm & Cover the Bird",
                imageName: "net2",
                warningpoints: [warningPoint(colorName: Color.red, text: "Forceful pulling may cause fractures or skin tears.")],
                points: [
                    InstructionPoint(text: "Gently place towel over bird."),
                    InstructionPoint(text: "Keep wings against body."),
                    InstructionPoint(text: "Support bird before cutting net."),
                    InstructionPoint(text: "Never pull the net forcefully.")
                ]
            ),
            InstructionStep(
                stepNumber: "Step 3",
                heading: "Cut the Net Carefully",
                imageName: "net3",
                warningpoints: [warningPoint(colorName: Color.red, text: "Neck or wing constriction can become life-threatening quickly.")],
                points: [
                    InstructionPoint(text: "Use small scissors."),
                    InstructionPoint(text: "Cut one strand at a time."),
                    InstructionPoint(text: "Start from outer loose areas."),
                    InstructionPoint(text: "Avoid cutting near skin."),
                    InstructionPoint(text: "If deeply wrapped around neck or wing → stop and call rescue.")
                ]
            ),
            InstructionStep(
                stepNumber: "Step 4",
                heading: "Check for Injuries",
                imageName: "net4",
                warningpoints: nil,
                points: [
                    InstructionPoint(text: "Look for swelling or bleeding."),
                    InstructionPoint(text: "Check if wings move normally."),
                    InstructionPoint(text: "Observe breathing pattern.")
                ]
            ),
            InstructionStep(
                stepNumber: "Step 5",
                heading: "Stabilize & Refer if Needed",
                imageName: "net5",
                warningpoints: [
                    warningPoint(colorName: Color.green, text: "Normal flight after release indicates stable recovery."),
                    warningPoint(colorName: Color.red, text: "Weakness after entanglement may signal hidden injury.")
                ],
                points: [
                    InstructionPoint(text: "If bird appears alert and flies normally → safe release."),
                    InstructionPoint(text: "If weak, bleeding, or wing drooping → place in box and contact wildlife rescue.")
                ]
            )
        ]
    ),
    InstructionDetail(
        title: "Chick",
        heroImage: "Titlechic",
        intro: "A featherless baby bird must remain in a nest and depends completely on parental care.",
        symptoms: [
            "No feathers or very few",
            "Cannot stand or hop",
            "Eyes may be closed",
            "Constant chirping",
            "Found on ground"
        ],
        audioFile: "chick",
        steps: [
            InstructionStep(
                stepNumber: "Step 1",
                heading: "Identify Correctly",
                imageName: "chick1",
                warningpoints: [warningPoint(colorName: Color.red, text: "Removing a true chick from its nest lowers survival chances.")],
                points: [
                    InstructionPoint(text: "Check if the bird is featherless or mostly bare."),
                    InstructionPoint(text: "Confirm it cannot stand or hop."),
                    InstructionPoint(text: "Look around for nest above."),
                    InstructionPoint(text: "Chicks MUST be in a nest.")
                ]
            ),
            InstructionStep(
                stepNumber: "Step 2",
                heading: "Return to Nest Immediately (If Possible)",
                imageName: "chick2",
                warningpoints: [warningPoint(colorName: Color.green, text: "Human scent does not cause parental rejection.")],
                points: [
                    InstructionPoint(text: "Locate the original nest."),
                    InstructionPoint(text: "Gently place chick back inside."),
                    InstructionPoint(text: "Leave area and observe from distance."),
                    InstructionPoint(text: "Parent birds will NOT reject chick due to human touch.")
                ]
            ),
            InstructionStep(
                stepNumber: "Step 3",
                heading: "If Nest Is Missing or Destroyed",
                imageName: "chick3",
                warningpoints: [warningPoint(colorName: Color.red, text: "If parents do not return, professional help is required.")],
                points: [
                    InstructionPoint(text: "Create temporary nest (small basket with tissue)."),
                    InstructionPoint(text: "Secure it safely near original location."),
                    InstructionPoint(text: "Observe if parents return within 1–2 hours."),
                    InstructionPoint(text: "If parents do not return → contact wildlife rescue.")
                ]
            )
        ]
    ),

    InstructionDetail(
        title: "Fallen Nest",
        heroImage: "Titlenestfalle",
        intro: "A fallen nest exposes eggs or chicks to injury, cold, and predators.",
        symptoms: [
            "Nest found on ground",
            "Eggs cracked or broken",
            "Chicks exposed",
            "Cold or weak chicks",
            "No visible parent activity"
        ],
        audioFile: "nestfallen",
        steps: [
            InstructionStep(
                stepNumber: "Step 1",
                heading: "Check Condition Carefully",
                imageName: "nest1",
                warningpoints: [warningPoint(colorName: Color.red, text: "Rough handling may injure fragile chicks or eggs.")],
                points: [
                    InstructionPoint(text: "Wear gloves."),
                    InstructionPoint(text: "See if eggs are cracked."),
                    InstructionPoint(text: "Check if chicks are alive."),
                    InstructionPoint(text: "Handle gently.")
                ]
            ),
            InstructionStep(
                stepNumber: "Step 2",
                heading: "Reattach or Rebuild Nest",
                imageName: "nest2",
                warningpoints: [warningPoint(colorName: Color.green, text: "Repositioning nearby allows parents to resume care.")],
                points: [
                    InstructionPoint(text: "If nest intact → place back in tree securely."),
                    InstructionPoint(text: "If damaged → create replacement basket nest."),
                    InstructionPoint(text: "Attach near original branch."),
                    InstructionPoint(text: "Parents usually return if nest is nearby.")
                ]
            ),
            InstructionStep(
                stepNumber: "Step 3",
                heading: "Observe From Distance",
                imageName: "nest3",
                warningpoints: [warningPoint(colorName: Color.red, text: "Extended absence of parents may indicate abandonment.")],
                points: [
                    InstructionPoint(text: "Leave the area completely."),
                    InstructionPoint(text: "Watch from far away."),
                    InstructionPoint(text: "Give parents time to return."),
                    InstructionPoint(text: "If no parent activity for several hours → contact rescue.")
                ]
            )
        ]
    ),

    InstructionDetail(
        title: "Fledgling Hopping",
        heroImage: "Titlefledinghoppin",
        intro: "A feathered young bird hopping on the ground is usually learning to fly and does not need rescue.",
        symptoms: [
            "Fully feathered body",
            "Short hops or fluttering",
            "Chirping frequently",
            "Parents nearby",
            "Alert and responsive"
        ],
        audioFile: "fle",
        steps: [
            InstructionStep(
                stepNumber: "Step 1",
                heading: "Identify as Fledgling",
                imageName: "chatgpthopping1",
                warningpoints: [warningPoint(colorName: Color.green, text: "Ground hopping is part of normal flight development.")],
                points: [
                    InstructionPoint(text: "Bird has feathers."),
                    InstructionPoint(text: "It hops and moves around."),
                    InstructionPoint(text: "It may chirp frequently."),
                    InstructionPoint(text: "This is normal learning stage."),
                    InstructionPoint(text: "Most cases do NOT require rescue.")
                ]
            ),
            InstructionStep(
                stepNumber: "Step 2",
                heading: "Observe Before Intervening",
                imageName: "chatgpthopping2",
                warningpoints: [warningPoint(colorName: Color.red, text: "Intervening too early may separate chick from parents.")],
                points: [
                    InstructionPoint(text: "Watch quietly from distance."),
                    InstructionPoint(text: "Look for parent birds nearby."),
                    InstructionPoint(text: "Parents often feed from trees."),
                    InstructionPoint(text: "Do NOT assume abandonment.")
                ]
            ),
            InstructionStep(
                stepNumber: "Step 3",
                heading: "Intervene Only If In Danger",
                imageName: "chatgpthopping3",
                warningpoints: [warningPoint(colorName: Color.red, text: "Rescue only if injured or attacked by predator.")],
                points: [
                    InstructionPoint(text: "If near road or pets → move to nearby bush."),
                    InstructionPoint(text: "Do NOT take it home."),
                    InstructionPoint(text: "Leave it in same general area.")
                ]
            )
        ]
    )

]







