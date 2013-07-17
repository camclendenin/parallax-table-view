//
//  ParallaxTableView.h
//  ParallaxTableViewDemo
//
//  Created by Cameron Clendenin on 7/16/13.
//  Copyright (c) 2013 Cameron Clendenin. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  ParallaxScrollSpeed
 *
 *  Adjusts the delta in movement between tableview scrolling
 *  and the amount the background moves
 */
typedef enum {
    ParallaxScrollSpeedFast = 2,
    ParallaxScrollSpeedNormal, // default speeed
    ParallaxScrollSpeedSlow,
} ParallaxScrollSpeed;


@interface ParallaxTableView : UITableView <UITableViewDelegate> {
    
    CGFloat parallaxOffsetY;    
}

- (id)initWithFrame:(CGRect)frame
      parallaxImage:(UIImage *)parallaxImage
        andDelegate:(id<UITableViewDelegate>)parallaxDelegate;

@property (weak, nonatomic) id <UITableViewDelegate> parallaxDelegate;
@property (strong, nonatomic) UIImageView *parallaxImageView;
@property (assign, nonatomic) ParallaxScrollSpeed parallaxScrollSpeed;

@end
