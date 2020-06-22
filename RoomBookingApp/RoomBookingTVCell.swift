//
//  RoomBookingTVCell.swift
//  RoomBookingApp
//
//  Created by Dadha Kumar on 21/6/20.
//  Copyright © 2020 Dadha Kumar. All rights reserved.
//

import UIKit

class RoomBookingTVCell: UITableViewCell {

    @IBOutlet weak var hotelNameOutlet: UILabel!
    @IBOutlet weak var hotelLevelOutlet: UILabel!
    @IBOutlet weak var hotelAvailabilityOutlet: UILabel!
    @IBOutlet weak var hotelCapacityOutlet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
