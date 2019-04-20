//
//  ViewController.swift
//  messagingapp
//
//  Created by Yasin Ehsan on 4/19/19.
//  Copyright © 2019 Yasin Ehsan. All rights reserved.
//

import UIKit
import FirebaseDatabase


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var ref: DatabaseReference!
    var refHandle: DatabaseHandle = 0
    
    var postData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        
        //Set the firebase reference
        ref = Database.database().reference()
        
        //retrive the post
        refHandle = ref.child("Posts").observe(.childAdded, with: { (snapshot) in
//            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
            
            //Code to execute when a child is  under "Posts"
            
            //Take the value from the sanpshot and added it to the postData array
            let post = snapshot.value as? String
            
            if let actualPost = post {
                // Append the data to our postData array
                self.postData.append(actualPost)
                
                // reload the table view
                self.tableView.reloadData()
            }
            
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
        cell?.textLabel?.text = postData[indexPath.row]
        
        return cell!
    }
    


}

