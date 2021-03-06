//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by PO-CHUN CHEN on 2016/3/28.
//  Copyright © 2016年 PO-CHUN CHEN. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var restaurantImageView:UIImageView!
    
    @IBOutlet var tableView:UITableView!
    
    var restaurant:Restaurant!

    override func viewDidLoad() {
        super.viewDidLoad()

        restaurantImageView.image = UIImage(named: restaurant.image)
        
        tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.2)
        
        tableView.tableFooterView = UIView(frame: CGRectZero)
        
        tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.8)
        
        tableView.estimatedRowHeight = 36.0
        
        tableView.rowHeight = UITableViewAutomaticDimension
        
        title = restaurant.name
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    //not show status bar code
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! RestaurantDetialTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.fieldLable.text = "Name"
            cell.valueLable.text = restaurant.name
        case 1:
            cell.fieldLable.text = "Type"
            cell.valueLable.text = restaurant.type
        case 2:
            cell.fieldLable.text = "Location"
            cell.valueLable.text = restaurant.location
        case 3:
            cell.fieldLable.text = "Been here"
            cell.valueLable.text = (restaurant.isVisited) ? "Yes, I've been here before."  : "No."
        case 4:
            cell.fieldLable.text = "Phone"
            cell.valueLable.text = restaurant.phonenumber
        default:
            cell.fieldLable.text = ""
            cell.valueLable.text = ""
        }
        
        cell.backgroundColor = UIColor.clearColor()
        
        return cell;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(segue:UIStoryboardSegue) {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
