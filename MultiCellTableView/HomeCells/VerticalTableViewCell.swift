//
//  VerticalTableViewCell.swift
//  MultiCellTableView
//
//  Created by Navpreet Singh on 13/11/18.
//  Copyright © 2018 Navpreet Singh. All rights reserved.
//

import UIKit

protocol VerticalTableViewCellCommunication: class {
    func touchOnVerticalTableCell()
}

class VerticalTableViewCell: UITableViewCell {

    weak var delegate: VerticalTableViewCellCommunication?

    static let identifier:String = "VerticalTableViewCell"

    @IBOutlet weak var tableView: UITableView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.backgroundColor = UIColor.red
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}

extension VerticalTableViewCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed(VerticleTableCell.identifier, owner: self, options: nil)?.first as! VerticleTableCell
        cell.backgroundColor = UIColor.orange
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.touchOnVerticalTableCell()
    }
    
}
