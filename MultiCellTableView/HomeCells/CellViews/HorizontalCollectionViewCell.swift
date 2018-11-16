//
//  HorizontalCollectionViewCell.swift
//  MultiCellTableView
//
//  Created by Navpreet Singh on 13/11/18.
//  Copyright © 2018 Navpreet Singh. All rights reserved.
//

import UIKit

protocol Communication: class {
    func buttonPressed()
}

class HorizontalCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: Communication?
    static let identifier:String = "HorizontalCollectionViewCell"
    @IBOutlet weak var cellLable: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func buttonAction(_ sender: Any) {
        print("Button Action")
        self.delegate?.buttonPressed()
    }
}
