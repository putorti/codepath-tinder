//
//  CardsViewController.swift
//  tinder
//
//  Created by Jason Putorti on 3/2/16.
//  Copyright © 2016 Jason Putorti. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var ryanGosling: UIImageView!
    @IBOutlet var cardGesture: UIPanGestureRecognizer!
    var ryanOriginalCenter: CGPoint!
    var startedAtTheBottom: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardGesture = UIPanGestureRecognizer(target: self, action: "dragCard:")
        ryanOriginalCenter = ryanGosling.center
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        var profileViewController = segue.destinationViewController as! ProfileViewController
profileViewController.image = self.ryanGosling.image
    }
    
    @IBAction func dragCard(sender: UIPanGestureRecognizer) {
        var point = sender.locationInView(view)
        var velocity = sender.velocityInView(view)
        var translation = sender.translationInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            
            if point.y > ryanGosling.center.y {
                startedAtTheBottom = -1 // now we here
            } else {
                startedAtTheBottom = 1
            }

        } else if sender.state == UIGestureRecognizerState.Changed {

            ryanGosling.center = CGPoint(x: ryanOriginalCenter.x + translation.x, y: ryanOriginalCenter.y + translation.y)
            
            var rotation = translation.x * 45/320 * CGFloat(startedAtTheBottom)
            print("translation x: ", translation.x)
            
            if ryanGosling.center.x > 160 {
                ryanGosling.transform = CGAffineTransformMakeRotation(CGFloat(rotation * CGFloat(M_PI) / 180))
            } else {
                ryanGosling.transform = CGAffineTransformMakeRotation(CGFloat(rotation * CGFloat(M_PI) / 180))
            }
            
        } else if sender.state == UIGestureRecognizerState.Ended {
                
            if translation.x < -80 {
                UIView.animateWithDuration(0.2, animations: {
                    self.ryanGosling.center = CGPoint(x: -500.0, y: self.ryanGosling.center.y)
                    }
                );
            } else if translation.x > 80 {
                UIView.animateWithDuration(0.2, animations: {
                    self.ryanGosling.center = CGPoint(x: 500.0, y: self.ryanGosling.center.y)
                    }
                );
            } else {
                UIView.animateWithDuration(0.2, animations: {
                    self.ryanGosling.center = self.ryanOriginalCenter
                    }
                );
            }
        }
    }

    @IBAction func ryanTap(sender: AnyObject) {
        performSegueWithIdentifier("profileSegue", sender: self)
    }
    
    @IBAction func reset(sender: AnyObject) {
        ryanGosling.center = ryanOriginalCenter
        ryanGosling.transform = CGAffineTransformIdentity
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
