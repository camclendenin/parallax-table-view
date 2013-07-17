//
//  ParallaxTableView.m
//  ParallaxTableViewDemo
//
//  Created by Cameron Clendenin on 7/16/13.
//  Copyright (c) 2013 Cameron Clendenin. All rights reserved.
//

#import "ParallaxTableView.h"

static CGFloat const parallaxSlownessModifier = 3; // higher == slower

@implementation ParallaxTableView

@synthesize parallaxDelegate = _parallaxDelegate;
@synthesize parallaxImageView = _parallaxImageView;

- (id)initWithFrame:(CGRect)frame_
      parallaxImage:(UIImage *)parallaxImage_
        andDelegate:(id<UITableViewDelegate>)parallaxDelegate_
{
    self = [super initWithFrame:frame_ style:UITableViewStyleGrouped];
    if (self) {
        self.parallaxDelegate = parallaxDelegate_;
        _parallaxImageView = [[UIImageView alloc] initWithImage:parallaxImage_];
        _parallaxImageView.contentMode = UIViewContentModeCenter;
        _parallaxImageView.frame = frame_;
        [self.backgroundView addSubview:_parallaxImageView];        
        [self setDelegate:self];
    }
    return self;
}

-(void) updateParallexOffset
{
    CGRect frame = _parallaxImageView.frame;
    frame.origin.y = parallaxOffsetY / parallaxSlownessModifier;
    [UIView animateWithDuration:.05 animations:^{
        [_parallaxImageView setFrame:frame];
    }];
}


#pragma mark -
#pragma mark ScrollViewDelegate

- (void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    parallaxOffsetY = - scrollView.contentOffset.y;
    [self updateParallexOffset];
}


#pragma mark -
#pragma mark TableViewDelegate

- (NSInteger) numberOfRowsInSection:(NSInteger)section
{
    return self.numberOfSections;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if ([_parallaxDelegate respondsToSelector:@selector(tableView:heightForFooterInSection:)])
        return [_parallaxDelegate tableView:tableView heightForFooterInSection:section];
    return 0;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if ([_parallaxDelegate respondsToSelector:@selector(tableView:heightForHeaderInSection:)])
        return [_parallaxDelegate tableView:tableView heightForHeaderInSection:section];
    return 0;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [_parallaxDelegate tableView:tableView heightForRowAtIndexPath:indexPath];
}


@end
