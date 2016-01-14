#KASlideShow-Swift 

Ultra-basic slideshow for iOS (ARC only). Support manual or automatic slideshow, with fade and slide transitions. 

![Demo screenshot](http://fat.gfycat.com/MediocreVillainousBoa.gif)

##Install

###Normal install

Simply copy into your project folder :

 * KASlideShow.h
 * KASlideShow.m


###Using [cocoapods](http://cocoapods.org)

add this line to your Podfile :
`pod 'KASlideShow'`

##Usage

###Creation of a slideshow

```Swift
        slideShow.delegate = self
        slideShow.delay = 1 // Delay between transitions
        slideShow.transitionDuration = 0.5 // Transition duration
        slideShow.transitionType = KASlideShowTransitionType.Fade // Choose a transition type (fade or slide)
        slideShow.imagesContentMode = .ScaleAspectFill // Choose a content mode for images to display
        slideShow.addImagesFromResources(["test_1.jpeg", "test_2.jpeg", "test_3.jpeg"]) // Add images from resources
        slideShow.addGesture(KASlideShowGestureType.Tap) // Gesture to go previous/next directly on the image (Tap or Swipe)
```

###Other methods to add images

```Swift
        slideShow.addImagesFromResources([Array])
        slideShow.emptyAndAddImagesFromResources([Array])
        slideShow.addImage(<#T##image: UIImage!##UIImage!#>)
```

###Use of a slideshow

```Swift
 slideShow.next() // Go to the next image
 slideShow.previous() // Got to the previous image

 slideShow.start() // Start automatic slideshow
 slideShow.stop() // Stop automatic slideshow
```

### Gestures   

### KASlideShowDataSource

You can also implement this protocol to use the slideshow in a more memory efficient way.

```Swift
func slideShow(slideShow: KASlideShow, imageForPosition position: KASlideShowPosition) -> UIImage {
}
```

### KASlideShowDelegate

Don't forget to set the delegate !

```Swift
slideShow.delegate = self
```
### Delegate

```Swift

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
    
```
### References

Inspired by projects: 
- https://github.com/kirualex/KASlideShow

