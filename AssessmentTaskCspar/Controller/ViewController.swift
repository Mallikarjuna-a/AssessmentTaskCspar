//
//  ViewController.swift
//  AssessmentTaskCspar
//
//  Created by Mallikarjuna on 16/12/20.
//  Copyright © 2020 Mallikarjuna. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces


class ViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var myView: UIView!

    @IBOutlet weak var userDetailsBarButton: UIBarButtonItem!

    var locationDatahere:[LocationStruct]!
    
    override func viewDidLoad() {
        
        
        
        GMSServices.provideAPIKey("AIzaSyAW3gLfbnJxPWkxT-ybzXxzU2fHGToFEHw")
        
        
        DataManager.shared.fetchDataFromServer() { (locationData, erroring) in
            if erroring != nil{
                print(erroring!.localizedDescription)
                self.userDetailsBarButton.isEnabled = false
            }else{
                print("hello:::::locationData")
                self.locationDatahere = locationData
                self.userDetailsBarButton.isEnabled = true
                
//                print(self.locationDatahere[0].lat!)
                
                var latitude:Double!
                var langgitude:Double!
                for i in 0..<self.locationDatahere.count{

                    latitude = self.locationDatahere[i].lat! as! Double
                }
            }
        }
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Do any additional setup after loading the view.
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: self.myView.frame, camera: camera)
        self.myView.addSubview(mapView)

        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        
        
    }
    



}

