//
//  VerticleTableCell.swift
//  MultiCellTableView
//
//  Created by Navpreet Singh on 14/11/18.
//  Copyright © 2018 Navpreet Singh. All rights reserved.
//

import UIKit

class VerticleTableCell: UITableViewCell {

    static let identifier:String = "VerticleTableCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.contentView.backgroundColor = UIColor.orange
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


