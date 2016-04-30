//
//  AddUserController.swift
//  GuessGame
//
//  Created by Raúl T on 14/04/16.
//  Copyright © 2016 rtc. All rights reserved.
//

import UIKit

var player = ""

protocol  AddUserDelegate: class {
    
    func addUserDelegateCancel(controller: AddUserController)
    func addUserDelegate(controller: AddUserController, finishAddingUser user: UsersList)
}


class AddUserController: UITableViewController {

    weak var delegate: AddUserDelegate?
    
    @IBOutlet var userNameText: UITextField!
    
    @IBAction func CancelButton(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
        delegate?.addUserDelegateCancel(self)
    }
    
    @IBAction func DoneButton(sender: AnyObject) {
        
        let user = UsersList()
        
        user.texto = userNameText.text!
        
        user.score = superScore
        
        //player = userNameText.text!
        
        print(userNameText)
        
        delegate?.addUserDelegate(self, finishAddingUser: user)
                
        userNameText.text = ""
        
        //dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    
    // antes de que se seleccione la celda
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        
        return nil
    }
    // una vez seleccionada la celda
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
