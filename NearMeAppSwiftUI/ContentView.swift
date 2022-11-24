//
//  ContentView.swift
//  NearMeAppSwiftUI
//
//  Created by Daniel Condly on 11/23/22.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @ObservedObject var locationManager = LocationManager()
    @State private var search: String = ""
    // Array of landmarks
    @State private var landmarks: [Landmark] = [Landmark]()
    
    
    private func getNearByLandmarks() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = search
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            if let response = response {
                let mapItems = response.mapItems
                self.landmarks = mapItems.map{
                    Landmark(placemark: $0.placemark)
                }
                
            }
        }
    }
    
    var body: some View {
        ZStack(alignment: .top)  {
            MapView(landmarks: landmarks)
             
            TextField("Search", text: $search, onEditingChanged: { _ in })
            {
                // commit
                self.getNearByLandmarks()
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .offset(y:30)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
