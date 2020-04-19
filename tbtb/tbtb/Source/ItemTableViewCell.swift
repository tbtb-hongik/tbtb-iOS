//
//  ItemTableViewCell.swift
//  tbtb
//
//  Created by 김준성 on 2020/04/19.
//  Copyright © 2020 김준성. All rights reserved.
//
protocol CustomCellDelegate:class {
    func customcell(cell:ItemTableViewCell, didTappedThe button:UIButton?)
}

import UIKit

class ItemTableViewCell: UITableViewCell, UITableViewDelegate {
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var itemTag: UILabel!
    @IBOutlet weak var showDetailBttn: UIButton!
    
    weak var cellDelegate:CustomCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func showDetailAction(_ sender: Any) {
        cellDelegate?.customcell(cell: self, didTappedThe: sender as?UIButton)
        // here you pass data
        
        
        
    }

    
}
