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
    
    @IBOutlet var restaurantNameLabel:UILabel!
    
    @IBOutlet var restaurantTypeLabel:UILabel!

    @IBOutlet var restaurantLocationLabel:UILabel!
    
    var restaurant:Restaurant!
    
//    var restaurantImage = ""
//    
//    var restaurantName = ""
//    
//    var restaurantType = ""
//    
//    var restaurantLocation = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        restaurantImageView.image = UIImage(named: restaurant.image)

//        restaurantNameLabel.text = restaurant.name
//        
//        restaurantTypeLabel.text = restaurant.type
//        
//        restaurantLocationLabel.text = restaurant.location

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4;
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
        default:
            cell.fieldLable.text = ""
            cell.valueLable.text = ""
        }
        
        return cell;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
