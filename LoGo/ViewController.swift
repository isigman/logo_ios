//
//  ViewController.swift
//  LoGo
//
//  Created by Ira Sigman on 3/3/18.
//  Copyright © 2018 Ira Sigman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let defaults:UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    
    @IBAction func register(_ sender: UIButton) {
        //send get to server
        
        let deviceId = UIDevice.current.identifierForVendor!.uuidString
        /*
        let api_url = URL(string: "http://api.logoauthentication.com/registeruser.php?deviceID=" + deviceId)!
        var request = URLRequest(url: api_url)
        request.httpMethod = "GET"
        */
        
        //read response from the server
        do {
            let key = try String(contentsOf:URL(string: "http://api.logoauthentication.com/registeruser.php?deviceID=" + deviceId)!)
            defaults.set(key, forKey: "key")
        } catch let error {
            print("Error: \(error)")
        }
        
        //segue -> InfoViewController
    }
    
}

