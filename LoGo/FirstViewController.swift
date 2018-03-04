//
//  FirstViewController.swift
//  LoGo
//
//  Created by Ira Sigman on 3/4/18.
//  Copyright © 2018 Ira Sigman. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    //get defaults var
    let defaults:UserDefaults = UserDefaults.standard
    
    //get vars from UserDefaults
    let key = UserDefaults.standard.string(forKey: "key")
    
    func keyPresentInUserDefaults(key: String) -> Bool {
        return (UserDefaults.standard.string(forKey: "key")!.isEmpty)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        defaults.set("", forKey: "key")
        // Wait 3 seconds
        sleep(3)
        // see if key exists
        if(defaults.string(forKey: "key") != ""){
            // send to info view controller
            performSegue(withIdentifier: "isRegistered", sender: nil)
            
        } else {
            // send to view controller
            performSegue(withIdentifier: "notRegistered", sender: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
