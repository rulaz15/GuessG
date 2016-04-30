//
//  HighScoreController.swift
//  GuessGame
//
//  Created by Raúl T on 14/04/16.
//  Copyright © 2016 rtc. All rights reserved.
//

import UIKit


class HighScoreController: UITableViewController, AddUserDelegate  {
    
    
   // var indexP = NSIndexPath?

    func addNewUser (newUser: UsersList) {
        
        let nextIndex = users.count
        
        users.append(newUser)
        
        let indexPath = NSIndexPath(forRow: nextIndex, inSection: 0)
        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }
    
    
    
    // Delete rows
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        users.removeAtIndex(indexPath.row) // update model
        
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    var users: [UsersList]

    
    required init?(coder aDecoder: NSCoder) {
        //creates items array
        users = [UsersList]()
        
        //instantiate intem object
        let user = UsersList()
        
        user.texto = "Raúl"
        user.score = 10000
        
        users.append(user)
        
        //llama al mismo metodo padre init
        super.init(coder: aDecoder)
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return users.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        print("no. \(indexPath.row)")
        
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        UpdateCell(cell, user: users[indexPath.row])
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let u = users[indexPath.row]
        player = u.texto
        print(player)
        
        superScore = u.score
        print(superScore)
        
        performSegueWithIdentifier("Game", sender: nil)
    }
    
    func UpdateCell (cell: UITableViewCell, user: UsersList) {
        
        let label = cell.viewWithTag(10) as! UILabel
        label.text = user.texto
        //player = user.texto
        
        
        let scoreLabel = cell.viewWithTag(11) as! UILabel
        scoreLabel.text = "\(user.score)"
        
    }
    
    func addUserDelegateCancel(controller: AddUserController) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func addUserDelegate(controller: AddUserController, finishAddingUser user: UsersList) {
        
        addNewUser(user)
        
        /*
        let newUser = user
        
        let indexUser = users.count
        
        users.append(newUser)
        
        let indexPath = NSIndexPath(forRow: indexUser, inSection: 0)
 
        */
        
        print("----\(user.texto)---")
        
       // tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "addU" {
            
            let navigatorController = segue.destinationViewController as! UINavigationController
            let controller = navigatorController.topViewController as! AddUserController
            controller.delegate = self
        }
    }
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
