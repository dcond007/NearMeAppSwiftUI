//
//  MapView.swift
//  NearMeAppSwiftUI
//
//  Created by Daniel Condly on 11/23/22.
//

import Foundation
import SwiftUI
import MapKit


class Coordinator: NSObject, MKMapViewDelegate {
    var control: MapView
    init(_ control: MapView) {
        self.control = control
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        if let annotationView = views.first {
            if let annotation = annotationView.annotation {
                if annotation is MKUserLocation {
                    // create a region
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                    mapView.setRegion(region, animated: true)
                }
            }
        }
    }
}

struct MapView: UIViewRepresentable {
    
    // to allow the rendered content view (mapview) to take in an a parameter
    let landmarks: [Landmark]
    
    func makeUIView(context: Context) -> MKMapView {
        
        let map = MKMapView()
        
        map.showsUserLocation = true
        // process all the different functions of the map view
        // like did update locations
        map.delegate = context.coordinator
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        updateAnnotations(from: uiView)
    }
    
    // put all the landmarks on the map
    private func updateAnnotations(from mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
        let annotations = self.landmarks.map(LandmarkAnnotation.init)
        mapView.addAnnotations(annotations)
    }
    
}
 
