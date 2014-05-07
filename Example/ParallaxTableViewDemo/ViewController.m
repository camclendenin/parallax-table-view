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
    
    myFavoritePlacesArray = @[@"New York", @"Yew Nork", @"New York", @"Yew Nork",@"New York", @"Yew Nork", @"This", @"is", @"a", @"long", @"list", @"of", @"stuff.", @"The", @"longer", @"the", @"list", @"the", @"cooler", @"it", @"looks!"];
    
    tableView = [[ParallaxTableView alloc] initWithFrame:self.view.bounds
                                           parallaxImage:[UIImage imageNamed:@"nyc.jpg"]
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
