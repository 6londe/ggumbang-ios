//
//  RequestedTableViewCell.swift
//  ggumbang-ios
//
//  Created by Changhoon Lee on 08/06/2019.
//  Copyright © 2019 6londe. All rights reserved.
//

import UIKit

class RequestedTableViewCell: UITableViewCell {

    @IBOutlet var requestedItem: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
