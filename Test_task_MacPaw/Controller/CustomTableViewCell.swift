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
    
    @IBOutlet var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.layer.cornerRadius = cellView.frame.size.height / 2.5
    }
    
}
