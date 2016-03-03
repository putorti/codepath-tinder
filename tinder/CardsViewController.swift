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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardGesture = UIPanGestureRecognizer(target: self, action: "dragCard:")
        ryanOriginalCenter = ryanGosling.center
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dragCard(sender: UIPanGestureRecognizer) {
        var point = sender.locationInView(view)
        var velocity = sender.velocityInView(view)
        var translation = sender.translationInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            print("Gesture began at: \(point)")
        } else if sender.state == UIGestureRecognizerState.Changed {
            print("Gesture changed at: \(point)")
            ryanGosling.center = CGPoint(x: ryanOriginalCenter.x + translation.x, y: ryanOriginalCenter.y + translation.y)
        } else if sender.state == UIGestureRecognizerState.Ended {
            print("Gesture ended at: \(point)")
        }
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
