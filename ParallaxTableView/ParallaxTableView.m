//
//  ParallaxTableView.m
//  ParallaxTableViewDemo
//
//  Created by Cameron Clendenin on 7/16/13.
//  Copyright (c) 2013 Cameron Clendenin. All rights reserved.
//

#import "ParallaxTableView.h"

@implementation ParallaxTableView

@synthesize parallaxDelegate = _parallaxDelegate;
@synthesize parallaxImageView = _parallaxImageView;
@synthesize parallaxScrollSpeed = _parallaxScrollSpeed;


- (id)initWithFrame:(CGRect)frame_
      parallaxImage:(UIImage *)parallaxImage_
        andDelegate:(id<UITableViewDelegate>)parallaxDelegate_
{
    self = [super initWithFrame:frame_ style:UITableViewStyleGrouped];
    if (self) {
        self.backgroundView = [UIView new];
        self.parallaxDelegate = parallaxDelegate_;
        _parallaxImageView = [[UIImageView alloc] initWithImage:parallaxImage_];
        _parallaxImageView.contentMode = UIViewContentModeScaleAspectFill;
        _parallaxImageView.clipsToBounds = NO;
        _parallaxImageView.frame = frame_;
        [self.backgroundView addSubview:_parallaxImageView];
        [self setDelegate:self];
        
        self.parallaxScrollSpeed = ParallaxScrollSpeedNormal;
    }
    return self;
}

-(void) updateParallexOffset
{
    CGRect frame = _parallaxImageView.frame;
    frame.origin.y = parallaxOffsetY / _parallaxScrollSpeed;
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
