//
//  secondVC.swift
//  searchBar
//
//  Created by mac on 14/06/19.
//  Copyright © 2019 gammastack. All rights reserved.
//

import UIKit

class secondVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    
    var variableForName: String!
    var variableForLocation: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = variableForName
        locationLabel.text = variableForLocation
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
