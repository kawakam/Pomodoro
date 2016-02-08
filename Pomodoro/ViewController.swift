//
//  ViewController.swift
//  Pomodoro
//
//  Created by 川上智樹 on 2016/01/30.
//  Copyright © 2016年 yatuhasiumai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var todayCounts: UILabel!

    var minute = 25
    var second = 0
    var flag = false
    var stopFlag = false
    var counts = 0
    let clockView = ClockView()
    var timer = NSTimer()
    var check = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        clockView.minute = minute
        clockView.second = second
        let stringTime = String(String(format: "%02d:%02d", minute, second))
        timeLabel.text = stringTime

        clockView.frame.size = CGSize(width: 300, height: 300)
        clockView.center.x = view.center.x
        clockView.center.y = view.center.y - 50
        clockView.backgroundColor = UIColor.clearColor()
        clockView.userInteractionEnabled = false
        view.addSubview(clockView)
        }

    @IBAction func startButton(sender: UIButton) {
        time()
    }
    
    func time() {
        if flag == false {
            flag = true
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "count", userInfo: nil, repeats: true)
        } else {
        }
    }
    
    func count() {
        if minute != 0 || second != 0 {
            if second == 0 {
                second = 59
                minute -= 1
                
                clockView.minute = minute
                clockView.second = second
                clockView.setNeedsDisplay()
            } else {
                second -= 1
                
                clockView.minute = minute
                clockView.second = second
                clockView.setNeedsDisplay()
                
                if check == false {
                    check = true
                } else {
                    check = false
                }
            }
        } else if check == true {
            minute = 5
            second = 0
            
            clockView.minute = minute
            clockView.second = second
            clockView.setNeedsDisplay()
            
            flag = false
            counts++
            todayCounts.text = "\(counts)"
            
        } else {
            minute = 25
            second = 0
            
            clockView.minute = minute
            clockView.second = second
            clockView.setNeedsDisplay()
            
            check = true
            
            flag = false
            todayCounts.text = "\(counts)"
            timer.invalidate()
        }
        
        let stringTime = String(String(format: "%02d:%02d", minute, second))
        timeLabel.text = stringTime
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

