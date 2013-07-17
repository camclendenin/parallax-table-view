//
//  ParallaxTableView.h
//  ParallaxTableViewDemo
//
//  Created by Cameron Clendenin on 7/16/13.
//  Copyright (c) 2013 Cameron Clendenin. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface ParallaxTableView : UITableView <UITableViewDelegate> {
    
    CGFloat parallaxOffsetY;    
}

- (id)initWithFrame:(CGRect)frame
      parallaxImage:(UIImage *)parallaxImage
        andDelegate:(id<UITableViewDelegate>)parallaxDelegate;

@property (weak, nonatomic) id <UITableViewDelegate> parallaxDelegate;
@property (strong, nonatomic) UIImageView *parallaxImageView;

@end
