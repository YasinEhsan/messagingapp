# messagingapp
Learning Firebase thru Youtube tutorial.

__Features__ Used breakpoints

__Takeaways__ 

__Challenges__ 

## [Video Link](https://www.youtube.com/watch?v=PMbqo7ue_u0&list=PLMRqhzcHGw1ZRUB86rmNqG15Sr5jV-2NU&index=1)

## Notes
- FIRApp.configure() __renamed to__ FirebaseApp.configure()
- Quick Navagation / tab abr controlelr setup : Click on Moon > click on editor > embed > click controller of choice
- Hard code cell hack : click table view > click shield > set / increment prototype cells 



## Useful Links
- [Read and write firebase real time database docs](https://firebase.google.com/docs/database/ios/read-and-write?authuser=0)
-


## Latest and greatest new code learned
```Swift

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

```
