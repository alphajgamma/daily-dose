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
    @IBOutlet weak var removeAdsBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAds()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupAds() {
        if UserDefaults.standard.bool(forKey: PurchaseManager.instance.IAP_REMOVE_ADS) {
            removeAdsBtn.removeFromSuperview()
            bannerView.removeFromSuperview()
        } else {
            // Production AdMob ad Unit ID: ca-app-pub-9912048831163673/6143015722
            bannerView.adUnitID = "ca-app-pub-9912048831163673/6143015722"
            // Test AdMob ad Unit ID: ca-app-pub-3940256099942544/2934735716
            bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
            bannerView.rootViewController = self
            bannerView.load(GADRequest())
        }
    }

    @IBAction func restoreBtnPressed(_ sender: Any) {
        PurchaseManager.instance.restorePurchases { success in
            if success {
                self.setupAds()
            }
        }
    }
    
    @IBAction func removeAdsPressed(_ sender: Any) {
        // Show loading spinner - ActivityIndicator
        PurchaseManager.instance.purchaseRemoveAds { success in
            // Dismiss spinner
            if success {
                self.bannerView.removeFromSuperview()
                self.removeAdsBtn.removeFromSuperview()
            } else {
                // Show message to the user
            }
        }
    }
    
}

