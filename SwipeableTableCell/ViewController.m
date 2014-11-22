//
//  ViewController.m
//  SwipeableTableCell
//
//  Created by Geoff MacDonald on 2014-11-22.
//  Copyright (c) 2014 Geoff MacDonald. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UINib * cell = [UINib nibWithNibName:@"TableViewCell" bundle:nil];
    [self.tableView registerNib:cell forCellReuseIdentifier:@"Cell"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

@end
