//
//  MapView.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 20/07/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State var isShowingTravelingMode = false
    @State var selectedTravelImage: String = "car.fill"

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Map() {
                Marker("TOTHENEW", coordinate: CLLocationCoordinate2D(latitude: 28.584670, longitude: 77.352010))
                    .tint(.orange)
            }
            .mapControls {
                MapUserLocationButton()
                MapCompass()
                MapScaleView()
            }
//            .mapStyle(.hybrid(elevation: .realistic))

            Button("") {
                isShowingTravelingMode.toggle()
            }
            .buttonStyle(TravelButton(systemImageName: selectedTravelImage))
            .padding()
            .sheet(isPresented: $isShowingTravelingMode) {
                optionsActionSheet
                    .presentationDetents([.medium, .large]) // can add multiple fraction & height
                    .presentationDragIndicator(.visible)
            }
        }
    }

    var optionsActionSheet: some View {
        VStack(spacing: 20) {

            Text("Travel Options")

            HStack(spacing: 16) {
                Button("") {
                    isShowingTravelingMode.toggle()
                    selectedTravelImage = "airplane"
                }
                .buttonStyle(TravelButton(systemImageName: "airplane"))

                Button("") {
                    isShowingTravelingMode.toggle()
                    selectedTravelImage = "car.fill"
                }
                .buttonStyle(TravelButton(systemImageName: "car.fill"))


                Button("") {
                    isShowingTravelingMode.toggle()
                    selectedTravelImage = "ferry.fill"
                }
                .buttonStyle(TravelButton(systemImageName: "ferry.fill"))


                Button("") {
                    isShowingTravelingMode.toggle()
                    selectedTravelImage = "tram.fill"
                }
                .buttonStyle(TravelButton(systemImageName: "tram.fill"))
            }
        }
    }
}

#Preview {
    MapView()
}
