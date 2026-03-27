//
//  VetMapView.swift
//  AviaCare
//
//  Created by Keshav Khari on 22/02/26.
//

import SwiftUI
import MapKit


struct VetLocation: Identifiable {
    let id = UUID()
    let name: String
    let phone: String
    let coordinate: CLLocationCoordinate2D
}


struct VetMapView: View {
    
    @State private var cameraPosition: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 37.3349,
                longitude: -122.0090
            ),
            span: MKCoordinateSpan(
                latitudeDelta: 0.08,
                longitudeDelta: 0.08
            )
        )
    )
    
    
    let vets: [VetLocation] = [
        VetLocation(
            name: "SAGE Veterinary Centers",
            phone: "4083437243",
            coordinate: CLLocationCoordinate2D(latitude: 37.2879, longitude: -121.9483)
        ),
        VetLocation(
            name: "MedVet Silicon Valley",
            phone: "6504149200",
            coordinate: CLLocationCoordinate2D(latitude: 37.4007, longitude: -122.1080)
        ),
        VetLocation(
            name: "Adobe Animal Hospital",
            phone: "6509489661",
            coordinate: CLLocationCoordinate2D(latitude: 37.3790, longitude: -122.1141)
        ),
        VetLocation(
            name: "Oakridge Veterinary Clinic",
            phone: "4087232600",
            coordinate: CLLocationCoordinate2D(latitude: 37.2510, longitude: -121.8614)
        )
    ]
    
    private func openInMaps(for vet: VetLocation) {
        
        let location = CLLocation(
            latitude: vet.coordinate.latitude,
            longitude: vet.coordinate.longitude
        )
        
        let mapItem = MKMapItem(
            location: location,
            address: nil
        )
        
        mapItem.name = vet.name
        
        mapItem.openInMaps(launchOptions: [
            MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving
        ])
    }
    
    var body: some View {
        VStack(spacing: 0) {
            
            
            Map(position: $cameraPosition) {
                
                ForEach(vets) { vet in
                    Annotation(vet.name, coordinate: vet.coordinate) {
                        Image(systemName: "cross.case.fill")
                            .font(.title2)
                            .foregroundStyle(.red)
                    }
                }
            }
            .frame(height: 300)
            
            Divider()
            
            
            List(vets) { vet in
                VStack(alignment: .leading, spacing: 6) {
                    
                    Button {
                        openInMaps(for: vet)
                    } label: {
                        HStack {
                            Text(vet.name)
                                .font(.headline)
                                .foregroundStyle(.blue)
                            
                            Spacer()
                            
                            Image(systemName: "arrow.up.right.square")
                                .foregroundStyle(.blue)
                        }
                    }
                    
                    Button {
                        if let url = URL(string: "tel://\(vet.phone)") {
                            UIApplication.shared.open(url)
                        }
                    } label: {
                        HStack {
                            Image(systemName: "phone.fill")
                            Text("Call \(vet.phone)")
                                .fontWeight(.semibold)
                        }
                        .padding(.vertical, 6)
                        .padding(.horizontal, 12)
                        .background(Color.red)
                        .foregroundStyle(.white)
                        .cornerRadius(8)
                    }
                }
                .padding(.vertical, 4)
            }
        }
        .navigationTitle("Emergency Vets")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    VetMapView()
}
