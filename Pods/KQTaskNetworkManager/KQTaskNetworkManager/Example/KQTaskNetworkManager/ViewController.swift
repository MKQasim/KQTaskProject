//
//  ViewController.swift
//  KQTaskNetworkManager
//
//  Created by MKQasim on 01/04/2023.
//  Copyright (c) 2023 MKQasim. All rights reserved.
//

import UIKit
import KQTaskNetworkManager

public class ViewController: UIViewController {

    @IBOutlet weak var TaskImageView: UIImageView!
  public override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let image = Services.getResources()
        if let image = Services.getResources() {
            TaskImageView.image = image
        }
        print(image)
    }

  public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

