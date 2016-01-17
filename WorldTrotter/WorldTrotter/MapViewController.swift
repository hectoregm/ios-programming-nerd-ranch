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

  override func loadView() {
    mapView = MKMapView()

    view = mapView
    
    let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
    segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
    segmentedControl.selectedSegmentIndex = 0
    
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(segmentedControl)
    
    let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)
    let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor)
    let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor)
    topConstraint.active = true
    leadingConstraint.active = true
    trailingConstraint.active = true
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    print("MapViewController loaded its view.")
  }
}
