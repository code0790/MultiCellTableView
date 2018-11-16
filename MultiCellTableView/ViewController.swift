//
//  ViewController.swift
//  MultiCellTableView
//
//  Created by Navpreet Singh on 13/11/18.
//  Copyright © 2018 Navpreet Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "My Libraries"
        case 1:
            return "Other Libraries"
        case 2:
            return "Recent Views"
        default:
            break
        }
        return ""
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 150
        case 1:
            return 150
        case 2:
            return 150*5
        default:
            break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
            
        case 0:
            let cell = Bundle.main.loadNibNamed(HorizontalTableViewCell.identifier, owner: self, options: nil)?.first as! HorizontalTableViewCell
            cell.delegate = self
            (cell.collectionView.cellForItem(at: indexPath) as? HorizontalCollectionViewCell)?.delegate = self
            return cell
            
        case 1:
            let cell = Bundle.main.loadNibNamed(HorizontalTableViewCell.identifier, owner: self, options: nil)?.first as! HorizontalTableViewCell
            cell.delegate = self
            return cell
            
        case 2:
            let cell = Bundle.main.loadNibNamed(VerticalTableViewCell.identifier, owner: self, options: nil)?.first as! VerticalTableViewCell
            cell.delegate = self
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}

extension ViewController: Communication {
    func buttonPressed() {
        print("Button Pressed on collection view")
    }
}

extension ViewController: HorizontalTableViewCellCellCommunication {
    func touchOnHoriZontalCell(callback: (Bool) -> Void) {
        print("in the controller")
        callback(true)
    }
}


extension ViewController: VerticalTableViewCellCommunication {
    func touchOnVerticalTableCell() {
        print("Touch on Vertical cell -> Table cell")
    }
}
