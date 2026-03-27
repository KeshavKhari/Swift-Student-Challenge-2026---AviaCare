//
//  CreateIncidentView.swift
//  AviaCare
//
//  Created by Keshav Khari on 22/02/26.
//

import SwiftUI
import SwiftData
import PhotosUI


struct CreateIncidentView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var title = ""
    @State private var severity = "Moderate"
    @State private var notes = ""
    @State private var symptoms = ""
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImageData: Data?
    
    let severityOptions = ["Low", "Moderate", "Critical"]
    
    var body: some View {
        
        NavigationStack {
        
            Form {
                
                Section("Incident Type") {
                    TextField("Enter incident type", text: $title)
                }
                
                Section("Severity") {
                    Picker("Severity", selection: $severity) {
                        ForEach(severityOptions, id: \.self) { level in
                            Text(level)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Symptoms") {
                    TextEditor(text: $symptoms)
                        .frame(height: 80)
                }
                
                Section("Details / Notes") {
                    TextEditor(text: $notes)
                        .frame(height: 100)
                }
                
                Section("Image") {
                    PhotosPicker(selection: $selectedItem, matching: .images) {
                        Label("Select Image", systemImage: "photo")
                    }
                    
                    if let data = selectedImageData,
                       let uiImage = UIImage(data: data) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                            .cornerRadius(12)
                    }
                }
            }
            .onChange(of: selectedItem) { _, newItem in
                Task {
                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
                        selectedImageData = data
                    }
                }
            }
            .navigationTitle("New Incident")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newIncident = Incident(
                            title: title,
                            severity: severity,
                            notes: notes,
                            symptoms: symptoms,
                            imageData: selectedImageData
                        )
                        context.insert(newIncident)
                        dismiss()
                    }
                    .disabled(title.isEmpty)
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    CreateIncidentView()
}
