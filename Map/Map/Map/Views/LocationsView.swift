//
//  LocationsView.swift
//  Map
//
//  Created by LinLin on 2024-01-21.
//

import SwiftUI
import MapKit
struct LocationsView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
   
    var body: some View {
        ZStack{
            Map(coordinateRegion:$vm.mapRegion)
                .ignoresSafeArea()
            VStack(spacing: 0){
                header
                    .padding()
                Spacer()

            }
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
    extension LocationsView{
        private var header: some View{
            VStack(spacing:0){
                Button(action: vm.toggleLocationList){
                    Text(vm.mapLocation.name + "," + vm.mapLocation.cityName)
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .frame(height:55)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .animation(.none, value:vm.mapLocation)
                        .overlay(alignment:.leading){
                            Image(systemName: "arrow.down")
                                .font(.headline)
                                .foregroundColor(.primary)
                                .padding()
                                .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                        }
                }
                if vm.showLocationsList{
                    LocationsListView()
                }
            }
            .background(.thickMaterial)
            .cornerRadius(10)
            .shadow(color:Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
            }
        }
        
        
    
