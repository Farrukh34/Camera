//
//  Functions.swift
//  Camera
//
//  Created by Farrukh Khan on 19/06/2015.
//  Copyright (c) 2015 Farrukh. All rights reserved.
//

import Foundation
import UIKit


//Simple Generic alert function to avoid writing all lthe code each time.
func showMyAlert(myAlertTitle:String, myAlertTxt:String, myCloseView: BooleanType) {
    let alertController = UIAlertController(title: myAlertTitle, message: myAlertTxt, preferredStyle: .Alert)
    
    let defaultAction = UIAlertAction(title: "OK", style: .Default){(ACTION) in
        if (myCloseView) {
            println("OK button clicked on Error.")
            (UIApplication.sharedApplication().delegate as! AppDelegate).window!.rootViewController!.topMostViewController().dismissViewControllerAnimated(true, completion: nil)
        }
    }
    alertController.addAction(defaultAction)
    
    //To make the presenViewController work it needed to be attached with to viewcontroller.. so simply(ha ha) attached it to the root one... had to add code at the bottom of AppDelegate.
    (UIApplication.sharedApplication().delegate as! AppDelegate).window!.rootViewController!.topMostViewController().presentViewController(alertController, animated: true, completion: nil)
    
    //USE THE FIRST PART OF THE LINE ABOVE AND USE TO DISMISS... FIND ORIGINAL FUNCTION.
}
