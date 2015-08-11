//
//  ViewController.swift
//  Tappity
//

import UIKit

class ViewController: UIViewController {

    // Hello IT1001
    // New comment for the fork activity on Tuesday
    
    // Instance variables
    // New Comment Here
    //Change background color
    func changeColor() {
        
        var colorArray = [UIColor.blackColor(), UIColor.brownColor(), UIColor.blueColor(), UIColor.darkGrayColor(), UIColor.greenColor(), UIColor.redColor(), UIColor.magentaColor(), UIColor.lightGrayColor(), UIColor.purpleColor(), UIColor.blackColor(), UIColor.orangeColor()]
        
        var randomIndex = Int(arc4random_uniform(9) + 1)
        
        view.backgroundColor = colorArray[randomIndex]
    }
    
    var score = 0
    var timeRemaining = 15
    var timerRunning = false

    // IBOutlets
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeRemainingLabel: UILabel!

    // Called when a colored button is tapped
    @IBAction func buttonTapped(sender: UIButton) {

        score++
        scoreLabel.text = String(score)

        if (timerRunning == false) {

            timeRemaining--
            timeRemainingLabel.text = String(timeRemaining)

            var theTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("timerTick:"), userInfo: nil, repeats: true)

            timerRunning = true

        }

    }

    // Called each time the NSTimer ticks (every second)
    func timerTick(sender: NSTimer) {

        timeRemaining--
        timeRemainingLabel.text = String(timeRemaining)

        if (timeRemaining <= 0) {

            sender.invalidate()
            timerRunning = false

            let gameOverAlert = UIAlertController(title: "Game Over", message: "Your score is \(score)", preferredStyle: .ActionSheet)

            let dismissAlertAction = UIAlertAction(title: "Dismiss", style: .Default, handler: {
                (alert: UIAlertAction!) -> Void in
                self.timeRemaining = 15
                self.score = 0
                self.scoreLabel.text = "0"
                self.timeRemainingLabel.text = "30"
            })
            gameOverAlert.addAction(dismissAlertAction)

            self.presentViewController(gameOverAlert, animated: true, completion: nil)

        }

    }

}

