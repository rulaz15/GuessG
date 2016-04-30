//
//  ViewController.swift
//  GuessGame
//
//  Created by Raúl T on 14/03/16.
//  Copyright © 2016 rtc. All rights reserved.
//

import UIKit
/*
protocol PlayerDelegate {
    func ModifyPlayerCancel(controller: ViewController, player: UsersList, ip: NSIndexPath) {

    }
 
}
 */

var superScore = 1

class ViewController: UIViewController {
    
    @IBOutlet var playerNameLabel: UILabel!

    @IBOutlet weak var randomNumber: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var round: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!

    var targetValue = 0
    var roundNumber = 1
    var scoreCounter = 0
    var points = 0
    var difference = 0
    
    
    @IBAction func hitMe(sender: AnyObject) {
        
        getScore()
       // let currentValue = Int(slider.value)

        //generateRandomNumber()
        slider.value = 50
        
        //scoreLabel.text = String(scoreCounter)
        
        showMessage()
        
    }
    
    func showMessage() {
        
        
        
        var title = ""
        
        if difference == 0 {
            title = "perfect"
        }
        else if difference < 5 {
            title = "muy cerca"
        }
        else if difference < 10 {
            title = "casi"
        }
        else {
            title = "nada bien"
        }
        
        // crea el mensaje de alerta
        let alert = UIAlertController(title: title, message: "You scored \(points) points", preferredStyle: UIAlertControllerStyle.Alert)
        
        //crea el boton para la alerta
        let action = UIAlertAction(title: "Ok", style: .Default, handler: { action in
            
            self.generateRandomNumber()
            self.slider.value = 50
            self.scoreLabel.text = String(self.scoreCounter)
            self.roundNumber += 1
            self.round.text = "\(self.roundNumber)"

        })
        
        //añade la accion para que aparezca el boton
        alert.addAction(action)
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    func getScore(){
        
        difference = abs(Int(slider.value) - targetValue)
        //scoreCounter = (100 - difference)
       // print(difference)
        points = (100 - difference)
        scoreCounter += points
        
        superScore = scoreCounter
        
        
    }
    
    @IBAction func starOver(sender: AnyObject) {
        
        roundNumber = 1
        scoreCounter = 0
        round.text = "\(roundNumber)"

        generateRandomNumber()
        slider.value = 50
        
        scoreLabel.text = String(scoreCounter)
        
       // performSegueWithIdentifier("startOver", sender: superScore)
        
    }
    
    
    func generateRandomNumber()  {
        
        targetValue = 1 + Int(arc4random_uniform(100))
        randomNumber.text = String(targetValue)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        generateRandomNumber()
        scoreCounter = 0
        slider.value = 50
        scoreLabel.text = String(scoreCounter)
        round.text = "1"
        
        playerNameLabel.text = player
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

