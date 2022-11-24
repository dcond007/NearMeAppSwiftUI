//
//  LandmarkAnnotation.swift
//  NearMeAppSwiftUI
//
//  Created by Daniel Condly on 11/23/22.
//

import UIKit
import MapKit

// Displays the annotation on the map
final class LandmarkAnnotation: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(landmark: Landmark) {
        self.title = landmark.name
        self.coordinate = landmark.coordinate
    }
}
