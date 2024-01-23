//
//  LocationsViewModel.swift
//  Map
//
//  Created by LinLin on 2024-01-21.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    
    @Published var locations: [Location]
    @Published var mapLocation: Location{
        didSet{
            updateMapRegion(location: mapLocation)
        }
    }
    // current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    //show list of locations
    @Published var showLocationsList: Bool = false
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    private func updateMapRegion(location: Location){
        withAnimation(.easeInOut){
            mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan)
        }
    }
    func toggleLocationList(){
        withAnimation(.easeInOut){
            showLocationsList = !showLocationsList
        }
    }
    func showNextLocation(location: Location){
        withAnimation(.easeInOut){
            mapLocation = location
            showLocationsList = false
        }
    }
    
}
