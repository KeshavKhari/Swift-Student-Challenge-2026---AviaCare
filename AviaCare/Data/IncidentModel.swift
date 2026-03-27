//
//  File.swift
//  AviaCare
//
//  Created by Keshav Khari on 22/02/26.
//

import SwiftData
import Foundation

@Model
class Incident {
    
    var title: String
    var severity: String
    var notes: String
    var symptoms: String
    var dateCreated: Date
    
    @Relationship(deleteRule: .cascade)
    var updates: [IncidentUpdate] = []
    
    @Attribute(.externalStorage)
    var imageData: Data?
    
    init(
        title: String,
        severity: String,
        notes: String = "",
        symptoms: String = "",
        dateCreated: Date = Date(),
        imageData: Data? = nil
    ) {
        self.title = title
        self.severity = severity
        self.notes = notes
        self.symptoms = symptoms
        self.dateCreated = dateCreated
        self.imageData = imageData
    }
}

@Model
class IncidentUpdate {
    var timestamp: Date
    var note: String
    
    @Attribute(.externalStorage)
    var imageData: Data?
    
    init(note: String, timestamp: Date = Date(), imageData: Data? = nil) {
        self.note = note
        self.timestamp = timestamp
        self.imageData = imageData
    }
}
