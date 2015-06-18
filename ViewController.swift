//
//  ViewController.swift
//  Camera
//
//  Created by Farrukh Khan on 13/06/2015.
//  Copyright (c) 2015 Farrukh. All rights reserved.
//

import UIKit

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        println("Photos: \(photoCount)")
        println("Title: \(ProductTitle.text)")
        println("Description: \(ProductDescription.text)")

    }
    
    
}

