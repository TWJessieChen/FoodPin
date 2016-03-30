//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by PO-CHUN CHEN on 2016/3/28.
//  Copyright © 2016年 PO-CHUN CHEN. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    
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
    
        restaurantNameLabel.text = restaurant.name
        
        restaurantTypeLabel.text = restaurant.type
        
        restaurantLocationLabel.text = restaurant.location
        
//        print(restaurantName)
//        print(restaurantType)
//        print(restaurantLocation)

        // Do any additional setup after loading the view.
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
