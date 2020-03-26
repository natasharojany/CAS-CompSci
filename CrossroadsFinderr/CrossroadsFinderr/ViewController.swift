//
//  ViewController.swift
//  CrossroadsFinderr
//
//  Created by Natasha Rojany on 3/23/20.
//  Copyright © 2020 Natasha Rojany. All rights reserved.
//

import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var crossroadsLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var taikoLabel: UILabel!
    
    let CROSSROADS_LAT = 34.0240892
    let CROSSROADS_LONG = -118.4747321
    let HOME_LAT = 34.064672
    let HOME_LONG = -118.474628
    let TAIKO_LAT = 34.054117
    let TAIKO_LONG = -118.465021
    
    
override func viewDidLoad() {
super.viewDidLoad()
mapView.delegate = self
let crossroadsPoint = MKMapPoint(CLLocationCoordinate2DMake(CROSSROADS_LAT, CROSSROADS_LONG))
let size = MKMapSize(width: 1000, height: 1000)
let rect = MKMapRect(origin: crossroadsPoint, size: size)
mapView.setRegion(MKCoordinateRegion(rect), animated: true)
let homePoint = MKMapPoint(CLLocationCoordinate2DMake(HOME_LAT, HOME_LONG))
let taikoPoint = MKMapPoint(CLLocationCoordinate2DMake(TAIKO_LAT, TAIKO_LONG))
    }

    @IBAction func zoomOut(_ sender: Any) {
        let factor = 0.5
        zoom(factor)
    }
    
    @IBAction func zoomIn(_ sender: Any) {
        let factor = 2.0
        zoom(factor)
    }
    
    func zoom(_ zoomFactor: Double) {
        let region = mapView.region
        let span = region.span
        let newLat = span.latitudeDelta * zoomFactor
        let newLong = span.longitudeDelta * zoomFactor
        let newSpan = MKCoordinateSpan(latitudeDelta: newLat, longitudeDelta: newLong)
        let newRegion = MKCoordinateRegion(center: region.center, span: newSpan)
        mapView.setRegion(newRegion, animated: true)
    }
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let rect = mapView.visibleMapRect
        let appleLoc = CLLocationCoordinate2DMake(TAIKO_LAT, TAIKO_LONG)
               let applePoint = MKMapPoint(appleLoc)
               if rect.contains(applePoint) {
                   taikoLabel.text = "hey, there's taiko" }
                   else { taikoLabel.text = "where is taokp?"
        let homeLoc = CLLocationCoordinate2DMake(HOME_LAT, HOME_LONG)
        let homePoint = MKMapPoint(homeLoc)
        if rect.contains(homePoint) {
            homeLabel.text = "hey, there's century city" }
            else { homeLabel.text = "where is century city?"
        let crossroadsLoc = CLLocationCoordinate2DMake(CROSSROADS_LAT, CROSSROADS_LONG)
        let crossroadsPoint = MKMapPoint(crossroadsLoc)
        if rect.contains(crossroadsPoint) {
            crossroadsLabel.text = "hey, there's crossroads" }
            else { crossroadsLabel.text = "where is crossroads?"
        }
    }
}
}
}
