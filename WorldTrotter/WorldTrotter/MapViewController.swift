//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Hector Enrique Gomez Morales on 1/13/16.
//  Copyright © 2016 Hector Enrique Gomez Morales. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
  var mapView: MKMapView!
  var selfButton: UIButton!
  var locationManager: CLLocationManager!

  override func loadView() {
    mapView = MKMapView()
    locationManager = CLLocationManager()
    let locationStatus = CLLocationManager.authorizationStatus()
    if locationStatus == .NotDetermined {
      locationManager.requestWhenInUseAuthorization()
    }
    selfButton = UIButton(type: .DetailDisclosure)
    
    view = mapView
    
    view.addSubview(selfButton)
    
    selfButton.addTarget(self, action: "getUserLocation", forControlEvents: .TouchUpInside)
    
    selfButton.translatesAutoresizingMaskIntoConstraints = false
    let centerConstraint = selfButton.centerXAnchor.constraintEqualToAnchor(selfButton.superview?.centerXAnchor)
    let buttomConstraint = selfButton.bottomAnchor.constraintEqualToAnchor(bottomLayoutGuide.topAnchor, constant: -8)
    centerConstraint.active = true
    buttomConstraint.active = true

    let standardString = NSLocalizedString("Standard", comment: "Standard map view")
    let satelliteString = NSLocalizedString("Satellite", comment: "Satellite map view")
    let hybridString = NSLocalizedString("Hybrid", comment: "Hybrid map view")
    
    let segmentedControl = UISegmentedControl(items: [standardString, satelliteString, hybridString])
    segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
    segmentedControl.selectedSegmentIndex = 0
    
    segmentedControl.addTarget(self, action: "mapTypeChanged:", forControlEvents: .ValueChanged)
    
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(segmentedControl)
    
    let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)

    let margins = view.layoutMarginsGuide
    let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
    let trailingConstraint =  segmentedControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
    topConstraint.active = true
    leadingConstraint.active = true
    trailingConstraint.active = true
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    print("MapViewController loaded its view.")
  }
  
  func mapTypeChanged(segControl: UISegmentedControl) {
    switch segControl.selectedSegmentIndex {
    case 0:
      mapView.mapType = .Standard
    case 1:
      mapView.mapType = .Hybrid
    case 2:
      mapView.mapType = .Satellite
    default:
      break
    }
  }
  
  func getUserLocation() {
    mapView.setUserTrackingMode(.Follow, animated: true)
  }
}
