#ParallaxTableView

Parallax scrolling for iOS. 


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
