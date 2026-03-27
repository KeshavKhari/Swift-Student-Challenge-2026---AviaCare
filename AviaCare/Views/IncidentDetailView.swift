//
//  IncidentDetailView.swift
//  AviaCare
//
//  Created by Keshav Khari on 22/02/26.
//

import SwiftUI
import SwiftData
import PhotosUI

struct PreviewImage: Identifiable {
    let id = UUID()
    let image: UIImage
}

struct IncidentDetailView: View {
    
    let incident: Incident
    
    @Environment(\.modelContext) private var context
    
    @State private var newUpdateNote = ""
    @State private var updatePhotoItem: PhotosPickerItem?
    @State private var updatePhotoData: Data?
    
    @State private var selectedPreviewImage: PreviewImage?
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading, spacing: 24) {
                
                Text(incident.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                HStack {
                    Text("Severity")
                    Spacer()
                    Text(incident.severity)
                        .fontWeight(.semibold)
                }
                
                HStack {
                    Text("Date")
                    Spacer()
                    Text(incident.dateCreated.formatted(date: .long, time: .shortened))
                }
                
                if !incident.symptoms.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Symptoms")
                            .font(.headline)
                        Text(incident.symptoms)
                    }
                }
                
                if !incident.notes.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Details")
                            .font(.headline)
                        Text(incident.notes)
                    }
                }
                
                if let data = incident.imageData,
                   let image = UIImage(data: data) {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Attached Image")
                            .font(.headline)
                        
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(16)
                            .onTapGesture {
                                selectedPreviewImage = PreviewImage(image: image)
                            }
                    }
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    Text("Add Progress Update")
                        .font(.headline)
                    
                    TextField("Add update...", text: $newUpdateNote)
                        .textFieldStyle(.roundedBorder)
                    
                    PhotosPicker(selection: $updatePhotoItem, matching: .images) {
                        Label("Attach Image", systemImage: "photo")
                    }
                    
                    if let data = updatePhotoData,
                       let image = UIImage(data: data) {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 120)
                            .cornerRadius(12)
                    }
                    
                    Button("Add Update") {
                        addUpdate()
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(newUpdateNote.isEmpty)
                }
                
                if !incident.updates.isEmpty {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Progress Updates")
                            .font(.headline)
                        
                        ForEach(incident.updates.sorted(by: { $0.timestamp > $1.timestamp })) { update in
                            
                            VStack(alignment: .leading, spacing: 8) {
                                
                                Text(update.note)
                                
                                Text(formatted(update.timestamp))
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                
                                if let data = update.imageData,
                                   let image = UIImage(data: data) {
                                    
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(12)
                                        .onTapGesture {
                                            selectedPreviewImage = PreviewImage(image: image)
                                        }
                                }
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color(.systemGray6))
                            )
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Incident Details")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                ShareLink(
                    item: generateReport(),
                    preview: SharePreview("Incident Report")
                ) {
                    Image(systemName: "square.and.arrow.up")
                }
            }
        }
        .sheet(item: $selectedPreviewImage) { preview in
            ZStack {
                Color.black.ignoresSafeArea()
                
                Image(uiImage: preview.image)
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
        }
        .onChange(of: updatePhotoItem) { _, newItem in
            Task {
                guard let item = newItem else { return }
                if let data = try? await item.loadTransferable(type: Data.self) {
                    updatePhotoData = data
                }
            }
        }
        .toolbar(.hidden, for: .tabBar)
    }
    
    private func addUpdate() {
        let update = IncidentUpdate(
            note: newUpdateNote,
            imageData: updatePhotoData
        )
        
        incident.updates.append(update)
        
        newUpdateNote = ""
        updatePhotoData = nil
    }
    
    private func generateReport() -> String {
        var report = """
        Incident Report
        ------------------------
        Title: \(incident.title)
        Severity: \(incident.severity)
        Date: \(incident.dateCreated.formatted(date: .long, time: .shortened))
        
        Symptoms:
        \(incident.symptoms)
        
        Notes:
        \(incident.notes)
        
        Updates:
        """
        
        for update in incident.updates.sorted(by: { $0.timestamp > $1.timestamp }) {
            report += "\n• \(formatted(update.timestamp)) - \(update.note)"
        }
        
        return report
    }
    
    private func formatted(_ date: Date) -> String {
        date.formatted(date: .abbreviated, time: .shortened)
    }
}

#Preview {
//    IncidentDetailView(incident: [])
}
