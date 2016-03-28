//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by PO-CHUN CHEN on 2016/3/22.
//  Copyright © 2016年 PO-CHUN CHEN. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "Thai Cafe"]
    
    var restaurantImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]

    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    var restaurantIsVisited = [Bool](count: 21, repeatedValue: false)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! RestaurantTableViewCell

        cell.nameLabel?.text = restaurantNames[indexPath.row]
        cell.locationLabel?.text = restaurantLocations[indexPath.row]
        cell.typeLabel?.text = restaurantTypes[indexPath.row]
        cell.thumbnailImageView?.image = UIImage(named: restaurantImages[indexPath.row])
        
        cell.thumbnailImageView.layer.cornerRadius = 30.0
        cell.thumbnailImageView.clipsToBounds = true

//        if restaurantIsVisited[indexPath.row] {
//            cell.accessoryType = .Checkmark
//        }else {
//            cell.accessoryType = .None
//        }
        cell.accessoryType = restaurantIsVisited[indexPath.row] ? .Checkmark : .None
        
        return cell
    }
    
    //not show status bar code
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destinationViewController as!
                RestaurantDetailViewController
                    destinationController.restaurantImage = restaurantImages[indexPath.row]
            }
        }
    }
    
    
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
 
    /*
    // Override to support editing the table view.
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
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        
        print("Total item: \(restaurantNames.count)")
        for name in restaurantNames {
            print(name)
        }
    }
    */
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        //share social network
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default , title: "Share", handler: {(action, indexPath) -> Void in
            let defaultText = "Just checking in at " + self.restaurantNames[indexPath.row]
            if let imageToShare = UIImage(named: self.restaurantImages[indexPath.row]) {
                let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
                self.presentViewController(activityController, animated: true, completion: nil)
            }
        })
        
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete", handler: {(action,indexPath) -> Void in
            self.restaurantNames.removeAtIndex(indexPath.row)
            self.restaurantImages.removeAtIndex(indexPath.row)
            self.restaurantLocations.removeAtIndex(indexPath.row)
            self.restaurantTypes.removeAtIndex(indexPath.row)
            self.restaurantIsVisited.removeAtIndex(indexPath.row)
            
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        })
        
        shareAction.backgroundColor = UIColor(red: 28.0/255.0, green: 165.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        
    
        return[deleteAction,shareAction]
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

}
