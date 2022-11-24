//
//  PlaceListView.swift
//  NearMeAppSwiftUI
//
//  Created by Daniel Condly on 11/24/22.
//

// Display all the different places of interest in a list

import SwiftUI
import MapKit

struct PlaceListView: View {
    
    let landmarks: [Landmark]
    var onTap: () -> ()
    
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                EmptyView()
            }.frame(width: UIScreen.main.bounds.size.width, height: 60)
                .background(Color.gray)
                .gesture(TapGesture()
                    .onEnded(self.onTap))
            
            List {
                ForEach(self.landmarks, id: \.id) { landmark in
                    VStack(alignment: .leading) {
                        Text(landmark.name)
                            .fontWeight(.bold)
                        
                        Text(landmark.title)
                    }
                }
            }
        }.cornerRadius(10)
    }
}

//struct PlaceListView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlaceListView(landmarks: [Landmark(placemark: MKPlacemark())])
//    }
//}
