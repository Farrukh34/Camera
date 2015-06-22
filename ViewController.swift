//
//  ViewController.swift
//  Camera
//
//  Created by Farrukh Khan on 13/06/2015.
//  Copyright (c) 2015 Farrukh. All rights reserved.
//

import UIKit

var categories = ["Sports, Leisure and Games", "Books, Movies and Music", "Fashion and Accessories", "Home and Garden", "Electronics", "Cars and Motors", "Baby and Kids", "Other"]
var categorySelectedId = -1


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var photoCount = 0

    @IBOutlet var myImageView: UIImageView!
    
    @IBOutlet var Photo1: UIImageView!
    
    @IBOutlet var Photo2: UIImageView!
    
    @IBOutlet var Photo3: UIImageView!
    
    @IBOutlet var Photo4: UIImageView!
    
    @IBOutlet var AddPhotoButton: UIButton!
    
    @IBOutlet var ProductTitle: UITextField!
    
    @IBOutlet var ProductDescription: UITextView!
    
    @IBOutlet var Amount: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func SelectCategory(categoryButton: UIButton) {
        var alertController = UIAlertController(title: "", message: "", preferredStyle: .ActionSheet)
        let alert1 = UIAlertAction(title: categories[0], style: UIAlertActionStyle.Default){(ACTION) in
            self.setCategory(0, sender: categoryButton)
        }
        let alert2 = UIAlertAction(title: categories[1], style: UIAlertActionStyle.Default){(ACTION) in
            self.setCategory(1, sender: categoryButton)
        }
        let alert3 = UIAlertAction(title: categories[2], style: UIAlertActionStyle.Default){(ACTION) in
            self.setCategory(2, sender: categoryButton)
        }
        let alert4 = UIAlertAction(title: categories[3], style: UIAlertActionStyle.Default){(ACTION) in
            self.setCategory(3, sender: categoryButton)
        }
        let alert5 = UIAlertAction(title: categories[4], style: UIAlertActionStyle.Default){(ACTION) in
            self.setCategory(4, sender: categoryButton)
        }
        let alert6 = UIAlertAction(title: categories[5], style: UIAlertActionStyle.Default){(ACTION) in
            self.setCategory(5, sender: categoryButton)
        }
        let alert7 = UIAlertAction(title: categories[6], style: UIAlertActionStyle.Default){(ACTION) in
            self.setCategory(6, sender: categoryButton)
        }
        let alert8 = UIAlertAction(title: categories[7], style: UIAlertActionStyle.Default){(ACTION) in
            self.setCategory(7, sender: categoryButton)
        }
        
        let alertCancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        
        alertController.addAction(alert1)
        alertController.addAction(alert2)
        alertController.addAction(alert3)
        alertController.addAction(alert4)
        alertController.addAction(alert5)
        alertController.addAction(alert6)
        alertController.addAction(alert7)
        alertController.addAction(alert8)
        alertController.addAction(alertCancel)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    func setCategory(categoryId: Int, sender: UIButton) {
        sender.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        sender.setTitle(categories[categoryId], forState: UIControlState.Normal)
        categorySelectedId = categoryId
        println("Category set to: \(categories[categoryId])")
    }


    @IBAction func SelectPhotoButton(sender: AnyObject) {
        println("Add Photo button clicked.")
        var alertController = UIAlertController(title: "", message: "", preferredStyle: .ActionSheet)
        let cameraAction = UIAlertAction(title: "Use Camera", style: UIAlertActionStyle.Default){(ACTION) in
            self.useCamera()
        }
        let libraryAction = UIAlertAction(title: "Select Existing Photo", style: UIAlertActionStyle.Default){(ACTION) in
            self.useLibrary()
        }
        let alertCancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel){(ACTION) in
            println("Cancel Selected")
        }
        
        alertController.addAction(cameraAction)
        alertController.addAction(libraryAction)
        alertController.addAction(alertCancel)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func useCamera() {
        var myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerControllerSourceType.Camera
        self.presentViewController(myPickerController, animated: true, completion: nil)
    }
    
    
    func useLibrary() {
        var myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(myPickerController, animated: true, completion: nil)
    }

    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        if(photoCount == 0) {
            Photo1.image = info[UIImagePickerControllerOriginalImage] as?
            UIImage
        } else if(photoCount == 1) {
            Photo2.image = info[UIImagePickerControllerOriginalImage] as?
            UIImage
        } else if(photoCount == 2) {
            Photo3.image = info[UIImagePickerControllerOriginalImage] as?
            UIImage
        } else if(photoCount == 3) {
            Photo4.image = info[UIImagePickerControllerOriginalImage] as?
            UIImage
            AddPhotoButton.enabled=false
        }
        photoCount++
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func UploadPhotoButton(sender: AnyObject) {

        
        let ProdTitle = ProductTitle.text
        let ProdDescription = ProductDescription.text
        let a:Int? = Amount.text.toInt()

        
        var alertTitle = "Error"
        var alertMessage  = ""
        
        if(photoCount < 1) {
            alertMessage = "Please add a photo"
        } else if(ProdTitle == "") {
            alertMessage = "Please add a title"
        } else if(ProdDescription == "") {
            alertMessage = "Please add a description"
        } else if(categorySelectedId < 0) {
            alertMessage = "Please select a category"
        } else if(a == nil || a == 0) {
            alertMessage = "Please enter a price"
        }
        
        
        if(alertMessage != "") {
            showMyAlert(alertTitle, alertMessage, false)
            return
        }

    }
    
    
}

