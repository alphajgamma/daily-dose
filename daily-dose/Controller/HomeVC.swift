//
//  ViewController.swift
//  daily-dose
//
//  Created by Andrew Greenough on 01/09/2017.
//  Copyright © 2017 Andrew Greenough. All rights reserved.
//

import UIKit
import GoogleMobileAds

class HomeVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Production AdMob ad Unit ID: ca-app-pub-9912048831163673/6143015722
        bannerView.adUnitID = "ca-app-pub-9912048831163673/6143015722"
        // Test AdMob ad Unit ID: ca-app-pub-3940256099942544/2934735716
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

