//
//  ViewController.swift
//  TestCountry
//
//  Created by Ariane Clarke on 26/04/2023.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create an instance
        let hiyaWorld: HiyaWorld = Countries()
        
        //get an Array the Countries names
        let _ = hiyaWorld.getCountriesNames()
        
        //get and Array with the Countries Alpha 2 codes
        let _ = hiyaWorld.getCountriesAlfa2Code()
        
        //get a String with the Alpha Name of the specific country
        let _ = hiyaWorld.getAlfa2Code(byCountryName: "Australia")
        
        
        if hiyaWorld.getCountriesNames().count > 0 {
            //you need to request for offline usage with the syncronizeCountries method
        }
        
        //syncronize the offline database with the online one so it's up to date returning an optional error
        hiyaWorld.syncronizeCountries { error in
            //to do after the syncronization finishes
        }
       
        
    }
}

