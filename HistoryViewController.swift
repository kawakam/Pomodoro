//
//  HistoryViewController.swift
//  Pomodoro
//
//  Created by 川上智樹 on 2016/02/02.
//  Copyright © 2016年 yatuhasiumai. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var history: [Int] = [1]
    var tableView = UITableView()
    let dateLabel = UILabel()
    var year: Int!
    var month: Int!
    var day: Int!
    var hour: Int!
    var minute: Int!
    var second: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "myCell")
    }
    
    override func viewWillAppear(animated: Bool) {
        date()
        
        super.viewWillAppear(true)
        tableView.frame.size.width = view.frame.size.width
        tableView.frame.size.height = view.frame.size.height + 50
        tableView.center.x = view.center.x
        tableView.center.y = view.center.y + 50
        view.addSubview(tableView)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "History"
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell") as! TableViewCell
        let historyLabel = cell.viewWithTag(1) as! UILabel
        historyLabel.text = dateLabel.text
        return cell
    }
    
    func date() {
        let now = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Year, .Month, .Day, .Hour, .Minute, .Second], fromDate: now)
        
        year = components.year
        month = components.month
        day = components.day
        hour = components.hour
        minute = components.minute
        second = components.second
        
        dateLabel.text = "\(year).\(month).\(day)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
