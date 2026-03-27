//
//  RescueCenterView.swift
//  AviaCare
//
//  Created by Keshav Khari on 22/02/26.
//

import SwiftUI
import SwiftData


struct RescueCenterView: View {
    
    @Environment(\.modelContext) private var context
    
    @Query(sort: \Incident.dateCreated, order: .reverse)
    private var incidents: [Incident]
    
    @State private var showCreateSheet = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            Button {
                showCreateSheet = true
            } label: {
                HStack {
                    Image(systemName: "plus.circle.fill")
                    Text("Create New Incident")
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red)
                .foregroundStyle(.white)
                .cornerRadius(16)
            }
            .padding(.horizontal)
            
            if incidents.isEmpty {
                Spacer()
                VStack(spacing: 12) {
                    Image(systemName: "tray")
                        .font(.largeTitle)
                        .foregroundStyle(.secondary)
                    
                    Text("No Incidents Yet")
                        .foregroundStyle(.secondary)
                }
                Spacer()
            } else {
                List {
                    ForEach(incidents) { incident in
                        NavigationLink {
                            IncidentDetailView(incident: incident)
                        } label: {
                            VStack(alignment: .leading) {
                                Text(incident.title)
                                    .font(.headline)
                                
                                Text(
                                    incident.dateCreated.formatted(
                                        date: .abbreviated,
                                        time: .shortened
                                    )
                                )
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .onDelete(perform: deleteIncident)
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("Rescue Center")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showCreateSheet) {
            CreateIncidentView()
        }
    }
    
    private func deleteIncident(at offsets: IndexSet) {
        for index in offsets {
            context.delete(incidents[index])
        }
    }
    
    
}

#Preview {
    RescueCenterView()
}
