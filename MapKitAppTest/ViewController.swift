//
//  ViewController.swift
//  MapKitAppTest
//
//  Created by Евгений Лукин on 09.07.2023.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialLocation = CLLocation(latitude: 43.346622, longitude: 77.012102)
        mapView.centerLocation(initialLocation)
        
        let cameraCenter = CLLocation(latitude: 43.346622, longitude: 77.012102)
        let region = MKCoordinateRegion(center: cameraCenter.coordinate, latitudinalMeters: 50000, longitudinalMeters: 50000)
        mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region), animated: true)
        
        let zoomRage = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 100000)
        mapView.setCameraZoomRange(zoomRage, animated: true)
        
        let sairanBusStation = Places(
            title: "Автовокзал Сайран",
            locationName: "ул. Толе Би, 294",
            discipline: "BusStation",
            coordinate: CLLocationCoordinate2D(latitude: 43.24467, longitude: 76.858077))
        
        mapView.addAnnotation(sairanBusStation)
    }
}

extension MKMapView {
    func centerLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 1000) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}
