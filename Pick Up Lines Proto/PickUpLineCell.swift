//
//  PickUpLineCell.swift
//  Pick Up Lines Proto
//
//  Created by Kyle Lee on 10/14/17.
//  Copyright © 2017 Kilo Loco. All rights reserved.
//

import UIKit

class PickUpLineCell: UITableViewCell {

    @IBOutlet weak var lineLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    func configure(with pickUpLine: PickUpLine) {
        lineLabel.text = pickUpLine.line
        scoreLabel.text = pickUpLine.scoreString()
        emailLabel.text = pickUpLine.email
    }

}
