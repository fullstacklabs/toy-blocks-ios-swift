//
//  NodeTableViewCell.swift
//  toy-blocks
//
//  Created by James Rhodes on 7/15/20.
//  Copyright © 2020 James Rhodes. All rights reserved.
//

import UIKit

class NodeTableViewCell: UITableViewCell {
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
