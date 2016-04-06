//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by PO-CHUN CHEN on 2016/3/22.
//  Copyright © 2016年 PO-CHUN CHEN. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var restaurants:[Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "cafedeadend.jpg", isVisited: false, phonenumber:"OOXX"),
        Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image: "homei.jpg", isVisited: false, phonenumber:"OOXX"),
        Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha.jpg", isVisited: false, phonenumber:"OOXX"),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "cafeloisl.jpg", isVisited: false, phonenumber:"OOXX"),
        Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster.jpg", isVisited: false, phonenumber:"OOXX"),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image: "forkeerestaurant.jpg", isVisited: false, phonenumber:"OOXX"),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "posatelier.jpg", isVisited: false, phonenumber:"OOXX"),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "Sydney", image: "bourkestreetbakery.jpg", isVisited: false, phonenumber:"OOXX"),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image: "haighschocolate.jpg", isVisited: false, phonenumber:"OOXX"),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "palominoespresso.jpg", isVisited: false, phonenumber:"OOXX"),
        Restaurant(name: "Upstate", type: "American", location: "New York", image: "upstate.jpg", isVisited: false, phonenumber:"OOXX"),
        Restaurant(name: "Traif", type: "American", location: "New York", image: "traif.jpg", isVisited: false, phonenumber:"OOXX"),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "grahamavenuemeats.jpg", isVisited: false, phonenumber:"OOXX"),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image: "wafflewolf.jpg", isVisited: false, phonenumber:"OOXX"),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "fiveleaves.jpg", isVisited: false, phonenumber:"OOXX"),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "cafelore.jpg", isVisited: false, phonenumber:"OOXX"),
        Restaurant(name: "Confessional", type: "Spanish", location: "New York", image: "confessional.jpg", isVisited: false, phonenumber:"OOXX"),
        Restaurant(name: "Barrafina", type: "Spanish", location: "London", image: "barrafina.jpg", isVisited: false, phonenumber:"OOXX"),
        Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "donostia.jpg", isVisited: false, phonenumber:"OOXX"),
        Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak.jpg", isVisited: false, phonenumber:"OOXX"),
        Restaurant(name: "Thai Cafe", type: "Thai", location: "London", image: "thaicafe.jpg", isVisited: false, phonenumber:"OOXX")
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //not show status bar code
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! RestaurantTableViewCell

        cell.nameLabel?.text = restaurants[indexPath.row].name
        cell.locationLabel?.text = restaurants[indexPath.row].location
        cell.typeLabel?.text = restaurants[indexPath.row].type
        cell.thumbnailImageView?.image = UIImage(named: restaurants[indexPath.row].image)
        
        cell.thumbnailImageView.layer.cornerRadius = 30.0
        cell.thumbnailImageView.clipsToBounds = true

//        if restaurantIsVisited[indexPath.row] {
//            cell.accessoryType = .Checkmark
//        }else {
//            cell.accessoryType = .None
//        }
        cell.accessoryType = restaurants[indexPath.row].isVisited ? .Checkmark : .None
        
        return cell
    }
    
    //Segue data to next ViewController
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destinationViewController as! RestaurantDetailViewController
                destinationController.restaurant = restaurants[indexPath.row]
            }
        }
    }

    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        //share social network
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default , title: "Share", handler: {(action, indexPath) -> Void in
            let defaultText = "Just checking in at " + self.restaurants[indexPath.row].name
            if let imageToShare = UIImage(named: self.restaurants[indexPath.row].image) {
                let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
                self.presentViewController(activityController, animated: true, completion: nil)
            }
        })
        
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete", handler: {(action,indexPath) -> Void in
            
            self.restaurants.removeAtIndex(indexPath.row)
            
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        })
        
        shareAction.backgroundColor = UIColor(red: 28.0/255.0, green: 165.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        
    
        return[deleteAction,shareAction]
    }
}

/*
 // Override to support conditional editing of the table view.
 override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
 // Return false if you do not want the specified item to be editable.
 return true
 }
 */


/*
 // Override to support rearranging the table view.
 override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
 
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
 // Return false if you do not want the item to be re-orderable.
 return true
 }
 */

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */


/*
 // Override to support editing the table view.  原先用commitEditingStyle來實作往左滑，會顯示Delete的選項
 override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
 if editingStyle == .Delete {
 // Delete the row from the data source
 //            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
 restaurantNames.removeAtIndex(indexPath.row)
 restaurantImages.removeAtIndex(indexPath.row)
 restaurantLocations.removeAtIndex(indexPath.row)
 restaurantTypes.removeAtIndex(indexPath.row)
 restaurantIsVisited.removeAtIndex(indexPath.row)
 }
 //        else if editingStyle == .Insert {
 //            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 //        }
 
 tableView.reloadData()
 //        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
 
 print("Total item: \(restaurantNames.count)")
 for name in restaurantNames {
 print(name)
 }
 }
 */

//拔掉第10章節的UIAlertController功能
//    override func tableView(tableView: UITableView,didSelectRowAtIndexPath indexPath: NSIndexPath) {
//
////        let optionMeun = UIAlertController(title: nil, message: "What do you want to do ?", preferredStyle: .Alert)
//        let optionMeun = UIAlertController(title: "Notification Message", message: "What do you want to do ?", preferredStyle: .ActionSheet)
//
//        let finishActionHandler = {(action:UIAlertAction!) -> Void in
//            let alertFinishMessage = UIAlertController(title: "FoodPin", message: "Test alert is Finish.", preferredStyle: .Alert)
//            alertFinishMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
//            self.presentViewController(alertFinishMessage, animated: true, completion: nil)
//        }
//
//        let callActionHandler = {(action:UIAlertAction!) -> Void in
//            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .Alert)
//            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: finishActionHandler))
//            self.presentViewController(alertMessage, animated: true, completion: nil)
//        }
//        let callAction = UIAlertAction(title: "Call : " + "09XX XXX XXX\(indexPath.row)", style: UIAlertActionStyle.Default, handler: callActionHandler)
//        optionMeun.addAction(callAction)
//
//
//        let isVisitedAction = UIAlertAction(title: "I've been here.", style: .Default, handler: {
//            (action:UIAlertAction) -> Void in
//            let cell = tableView.cellForRowAtIndexPath(indexPath)
//            cell?.accessoryType = .Checkmark
//            self.restaurantIsVisited[indexPath.row] = true
//        })
//
//        let isCancelVisitedAction = UIAlertAction(title: "I've not been here.", style: .Default, handler: {
//            (action:UIAlertAction) -> Void in
//            let cell = tableView.cellForRowAtIndexPath(indexPath)
//            cell?.accessoryType = .None
//            self.restaurantIsVisited[indexPath.row] = false
//        })
//
//        if restaurantIsVisited[indexPath.row] {
//            optionMeun.addAction(isCancelVisitedAction)
//        }else {
//            optionMeun.addAction(isVisitedAction)
//        }
//
//        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
//        optionMeun.addAction(cancelAction)
//
//        self.presentViewController(optionMeun, animated: true, completion: nil)
//
//        tableView.deselectRowAtIndexPath(indexPath, animated: false)
//    }
