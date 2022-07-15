//
//  CustomTableViewCell.swift
//  Test_task_MacPaw
//
//  Created by Dmytro on 15.07.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet var numberOfDayLabel: UILabel!
    @IBOutlet var lossPersonelLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
