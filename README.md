#ParallaxTableView

A table view with a moving background (parallax effect).. 


## Usage

###Wherever you need it
```objc
    #import "ParallaxTableView.h"
```
###Set parallax table and image
```objc
    eg. self.tableView = [ParallaxTableView alloc] initWithFrame:someRect
                                                   parallaxImage:[UIImage imageNamed:@"yourImage"]
                                                     andDelegate:self];     
```
## License

MIT
