//
//  RestClockView.swift
//  Pomodoro
//
//  Created by 川上智樹 on 2016/02/02.
//  Copyright © 2016年 yatuhasiumai. All rights reserved.
//

import UIKit

class RestClockView: UIView {
    var minute: Int!
    var second: Int!
    
    override func drawRect(rect: CGRect) {
        let center = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        let radius = self.frame.height / 2
        let clockwise = true
        let startAngle = M_PI * 3 / 2
        let percent = (Double(second) + Double(minute) * 60) / 300
        let endAngle = M_PI * 3 / 2 + percent * 2 * M_PI
        
        let baseCircle = UIBezierPath(arcCenter: center, radius: radius - 15.0, startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: clockwise)
        baseCircle.lineWidth = 10
        
        UIColor(red: 134 / 255, green: 232 / 255, blue: 13 / 255, alpha: 1.0).setStroke()
        baseCircle.setLineDash([1.839, 2.0], count: 2, phase: 0)
        
        baseCircle.stroke()
        
        let aroundCircle = UIBezierPath(arcCenter: center, radius: radius - 5.0, startAngle: CGFloat(startAngle), endAngle: CGFloat(M_PI * 3 / 2 + 2 * M_PI), clockwise: clockwise)
        aroundCircle.lineWidth = 5
        UIColor(red: 134 / 255, green: 232 / 255, blue: 13 / 255, alpha: 1.0).setStroke()
        
        aroundCircle.stroke()
    }
}
