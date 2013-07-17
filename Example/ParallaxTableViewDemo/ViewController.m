//
//  ViewController.m
//  ParallaxTableViewDemo
//
//  Created by Cameron Clendenin on 7/16/13.
//  Copyright (c) 2013 Cameron Clendenin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    myFavoritePlacesArray = @[@"Napili, Hawaii", @"Tamarindo, Costa Rica", @"Venice, Italia", @"Edinburgh, Scottland", @"Brittany, France", @"Poipu, Hawaii", @"Yosemite National Park", @"Big Sur", @"Joshua Tree", @"Monte Verde, Costa Rica"];
    
    tableView = [[ParallaxTableView alloc] initWithFrame:self.view.bounds
                                           parallaxImage:[UIImage imageNamed:@"jungle.jpg"]
                                             andDelegate:self];
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return myFavoritePlacesArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.textColor = UIColor.whiteColor;
    }
    
    cell.textLabel.text = [myFavoritePlacesArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
