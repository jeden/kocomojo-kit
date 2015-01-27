//
//  ViewController.swift
//  KocomojoApp
//
//  Created by Antonio Bello on 1/25/15.
//  Copyright (c) 2015 Elapsus. All rights reserved.
//

import UIKit
import KocomojoKit

class ViewController: UIViewController {
    private lazy var servicesManager = ServicesManager.instance
    private var countries: [Country]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.servicesManager.getCountries { result in
            switch(result) {
            case .Error(let error):
                println(error.localizedDescription)
            case .Value(let countries):
                self.countries = countries()
                println(self.countries)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

