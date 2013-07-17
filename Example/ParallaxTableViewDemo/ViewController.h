//
//  ViewController.h
//  ParallaxTableViewDemo
//
//  Created by Cameron Clendenin on 7/16/13.
//  Copyright (c) 2013 Cameron Clendenin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParallaxTableView.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {

    UITableView *tableView;
        
    NSArray *myFavoritePlacesArray;
}

@end
