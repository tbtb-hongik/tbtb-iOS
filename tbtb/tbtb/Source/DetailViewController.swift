//
//  DetailViewController.swift
//  tbtb
//
//  Created by 김준성 on 2020/04/19.
//  Copyright © 2020 김준성. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController{
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productTagLabel: UILabel!
    
    var name = ""
    var price = ""
    var tag = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
                productTagLabel.text = tag
        productPriceLabel.text = price
        productNameLabel.text = name
    }
}
