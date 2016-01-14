//
//  ViewController.swift
//  KASlideShow-Swift
//
//  Created by O-mkar on 14/01/16.
//  Copyright © 2016 LetsApp. All rights reserved.
//

import UIKit

class ViewController: UIViewController, KASlideShowDelegate {

    @IBOutlet weak var slideShow: KASlideShow!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // UI
        self.startStopButton.layer.cornerRadius = 25
        self.previousButton.layer.cornerRadius = 25
        self.nextButton.layer.cornerRadius = 25
        
        //KASlideshow
        slideShow.delegate = self
        slideShow.delay = 1 // Delay between transitions
        slideShow.transitionDuration = 0.5 // Transition duration
        slideShow.transitionType = KASlideShowTransitionType.Fade // Choose a transition type (fade or slide)
        slideShow.imagesContentMode = .ScaleAspectFill // Choose a content mode for images to display
        slideShow.addImagesFromResources(["test_1.jpeg", "test_2.jpeg", "test_3.jpeg"]) // Add images from resources
        slideShow.addGesture(KASlideShowGestureType.Tap) // Gesture to go previous/next directly on the image (Tap or Swipe)

        slideShow.start()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    //KASlideShow delegate

    func kaSlideShowWillShowNext(slideshow: KASlideShow) {
        NSLog("kaSlideShowWillShowNext")
    }
    
    func kaSlideShowWillShowPrevious(slideshow: KASlideShow) {
        NSLog("kaSlideShowWillShowPrevious")
    }
    
    func kaSlideShowDidShowNext(slideshow: KASlideShow) {
        NSLog("kaSlideShowDidNext")
    }
    
    func kaSlideShowDidShowPrevious(slideshow: KASlideShow) {
        NSLog("kaSlideShowDidPrevious")
    }
    
    //Button methods

    @IBAction func previous(sender: AnyObject) {
        slideShow.previous()
    }
    @IBAction func next(sender: AnyObject) {
        slideShow.next()
    }
    @IBAction func startStop(sender: AnyObject) {
        let Button:UIButton = sender as! UIButton

        if Button.titleLabel!.text == "▸" {
            slideShow.start()
            startStopButton.setTitle("■", forState: UIControlState.Normal)
        }else{
            slideShow.stop()
            startStopButton.setTitle("▸", forState: UIControlState.Normal)

        }
    }
    @IBAction func switchType(sender: AnyObject) {
        let control:UISegmentedControl = sender as! UISegmentedControl
        if control.selectedSegmentIndex == 0{
            slideShow.transitionType = KASlideShowTransitionType.Fade
            slideShow.gestureRecognizers = nil
            slideShow.addGesture(KASlideShowGestureType.Tap)
        }else {
            slideShow.transitionType = KASlideShowTransitionType.Slide
            slideShow.gestureRecognizers = nil
            slideShow.addGesture(KASlideShowGestureType.Swipe)
        }
    }


}

