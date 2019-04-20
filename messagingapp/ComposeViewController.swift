//
//  ComposeViewController.swift
//  messagingapp
//
//  Created by Yasin Ehsan on 4/19/19.
//  Copyright © 2019 Yasin Ehsan. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ComposeViewController: UIViewController {

    @IBOutlet weak var textViw: UITextView!
    
      var ref: DatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addPosr(_ sender: Any) {
        //todo: post the data to firebase
        ref.child("Posts").childByAutoId().setValue(textViw.text)
        
        // dismiss the popover
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelPost(_ sender: Any) {
        
        // dismiss the popover
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
