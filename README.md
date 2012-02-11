iPhone Keypad
=============

**Version:** 2.0<br/>
**Authors:** Craig Patchett, Adrian Kosmaczewski<br/>
**Date:** February 10, 2010<br/>
**Programming Languages:** Objective-C<br/>
**Tools:** Xcode 4.2<br/>
**Platforms:** Mac OS X Lion 10.7.3, iPhone OS 5.0+<br/>
**Repository:** Github<br/>
**License:** None, public domain, whatever you want :)

This project is a significant update of Adrian Kosmaczewski's original implementation, both of which feature a keypad taken bit by bit from the one supplied in the iPhone. As Adrian put it: "Pure copyright infringement? Not really, simply another form of flattery."

This version has been rewritten for XCode 4.2 and iOS 5 with the following changes:

* Storyboard replaces NIBs
* Retina support added
* Basic phone number formatting added (hardwired to U.S. at the moment, sorry)
* Tab bar icons replaced with Glyphish icons
* Custom app icon
* Code streamlined

I'm still going through a learning curve with iOS development, and this was done more as an exercise than anything else. As such, it has a couple of glitches at the moment, the biggest of which is with the integration of ABPeoplePickerNavigationController into the storyboard. I ended up using a wrapper controller class based on a post in StackOverflow which seems to work fine until you select a number and return to the picker. If anyone has a solution (preferably avoiding the wrapper class completely), I'd love to hear it!

In the meantime, here's a screenshot (the keys highlight on press and the DMTF tones sound as well thanks to Adrian):

![A quick screenshot]
(http://patchett.com/images/iphone-keypad.jpg).
