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
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    print("MapViewController loaded its view.")
  }
}
