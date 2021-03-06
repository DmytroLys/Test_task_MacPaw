//
//  CircleHelper.swift
//  Test_task_MacPaw
//
//  Created by Dmytro on 19.07.2022.
//

import UIKit

public struct CircleHelper {
    
    private func createSegment(startAngle: CGFloat, endAngle: CGFloat, view: UIView) -> UIBezierPath {
        return UIBezierPath(arcCenter: CGPoint(x: view.bounds.midX , y: view.frame.midY - 10 ), radius: 40, startAngle: startAngle.toRadians(), endAngle: endAngle.toRadians(), clockwise: true)
    }
    
    func createCircle(startAngle: CGFloat, endAngle: CGFloat, view:UIView) {
        let segmentPath = createSegment(startAngle: startAngle, endAngle: endAngle,view: view)
        let segmentLayer = CAShapeLayer()
        segmentLayer.path = segmentPath.cgPath
        segmentLayer.lineWidth = 5
        segmentLayer.strokeColor = UIColor.red.cgColor
        segmentLayer.fillColor = UIColor.clear.cgColor
        segmentLayer.cornerRadius =  40
        
        addAnimation(to: segmentLayer)
        
        view.layer.addSublayer(segmentLayer)
    }
    
    
    
   private func addAnimation(to layer: CALayer) {
        let drawAnimation = CABasicAnimation(keyPath: "strokeEnd")
        drawAnimation.duration = 1.5
        drawAnimation.repeatCount = 1.0
        drawAnimation.isRemovedOnCompletion = false
        drawAnimation.fromValue = 0
        drawAnimation.toValue = 1
        drawAnimation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        layer.add(drawAnimation, forKey: "drawCircleAnimation")
    }
    
     func createInnerCircle(startAngle: CGFloat, endAngle: CGFloat, view: UIView) {
        let segmentPath = createSegment(startAngle: startAngle, endAngle: endAngle,view: view)
        let segmentLayer = CAShapeLayer()
        segmentLayer.path = segmentPath.cgPath
        segmentLayer.lineWidth = 5
        segmentLayer.strokeColor = UIColor.black.cgColor
        segmentLayer.fillColor = UIColor.clear.cgColor
         segmentLayer.cornerRadius = 40
        
        view.layer.addSublayer(segmentLayer)
    }
    
}
