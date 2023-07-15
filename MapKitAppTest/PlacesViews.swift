//
//  PlacesViews.swift
//  MapKitAppTest
//
//  Created by Евгений Лукин on 14.07.2023.
//

import Foundation
import MapKit

class PlacesMarkersView: MKMarkerAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            guard let places = newValue as? Places else {
                return
            }
            
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
            markerTintColor = places.markerTintColor
            if (places.discipline?.first) != nil {
                glyphText = places.title
            }
        }
    }
}
