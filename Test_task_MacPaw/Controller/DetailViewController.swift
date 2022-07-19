//
//  DetailViewController.swift
//  Test_task_MacPaw
//
//  Created by Dmytro on 15.07.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet private var lPersonnelLose: UILabel!
    @IBOutlet private var lChangePersonnelLose: UILabel!
    @IBOutlet private var tanksView: UIView!
    
    private let circleHelper = CircleHelper()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.title = "Статистика за 97 день війни"
        
    }
    
    private func setupUI () {
        circleHelper.createInnerCircle(startAngle: 0, endAngle: 360, view: tanksView)
        circleHelper.createCircle(startAngle: 270, endAngle: 630, view: tanksView)
    }
    
    
    
}

