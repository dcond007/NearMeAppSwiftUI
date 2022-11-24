//
//  Landmark.swift
//  NearMeAppSwiftUI
//
//  Created by Daniel Condly on 11/23/22.
//

import Foundation
import MapKit 
 
struct Landmark {
    let placemark: MKPlacemark
    
    var id: UUID {
        return UUID()
    }
    
    var name: String {
        self.placemark.name ?? ""
    }
    
    var title: String {
        self.placemark.title ?? ""
    }
    
    var coordinate: CLLocationCoordinate2D {
        self.placemark.coordinate
    }
}
