//
//  CollectionTableViewCell.swift
//  MultiCellTableView
//
//  Created by Navpreet Singh on 13/11/18.
//  Copyright © 2018 Navpreet Singh. All rights reserved.
//

import UIKit

protocol HorizontalTableViewCellCellCommunication: class {
    func touchOnHoriZontalCell(callback: (Bool) -> Void)
}

class HorizontalTableViewCell: UITableViewCell {

    weak var delegate: HorizontalTableViewCellCellCommunication?

    static let identifier:String = "HorizontalTableViewCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        
        //Collection View Class Registering
        //self.collectionView.register(HorizontalCollectionViewCell.self, forCellWithReuseIdentifier: HorizontalCollectionViewCell.identifier)
        
        //Collection View Nib Registering
        self.collectionView.register(UINib(nibName: HorizontalCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: HorizontalCollectionViewCell.identifier)
    }
}


extension HorizontalTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.touchOnHoriZontalCell(callback: {(status: Bool) in
            print("Inside rec -> \(status)")
            
            //Get the cell item and do the changes
            guard let getCell = collectionView.cellForItem(at: indexPath) as? HorizontalCollectionViewCell else {
                print("Did not get the cell")
                return
            }
            getCell.cellLable.isHidden = status
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: self.bounds.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalCollectionViewCell.identifier, for: indexPath)
        cell.contentView.backgroundColor = UIColor.orange
        return cell
    }
    
}
