#ParallaxTableView

A table view with a moving background (parallax effect).. 

![ParallaxTableView sample](https://dl.dropbox.com/s/arujryzugb9mlfb/parallaxdemo.gif "ParallaxTableView in action")

This is definitely bare bones but it looks pretty awesome when you try it out. This kind of parallax effect looks much better than weird stretchy table header views found in other "parallax" libraries, in my opinion. This is just a start... I plan on building a more full featured solution, possibly in the form of a controller but we will see.

## Usage

###Wherever you need it
```objc
    #import "ParallaxTableView.h"
```
###Set parallax table and image
```objc
    eg. self.tableView = [[ParallaxTableView alloc] initWithFrame:someRect
                                                   parallaxImage:yourImage
                                                     andDelegate:self];     
```
## License

MIT
