//
//  CALayer.swift
//  Test_task_MacPaw
//
//  Created by Dmytro on 21.07.2022.
//

import UIKit

extension CALayer {

func addBorder(color: UIColor, thickness: CGFloat) {

    let border = CALayer()

    border.frame = CGRect(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)
    border.backgroundColor = color.cgColor
    addSublayer(border)
    }
}
