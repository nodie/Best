//
//  YUTableViewController.m
//  Best
//
//  Created by 於 琦峰 on 12-09-23.
//  Copyright (c) 2012年 於 琦峰. All rights reserved.
//

#import "YUTableViewController.h"
#import "YUViewController.h"
#import "YULocateViewController.h"
#import "YUAppDelegate.h"
#import "YUXML.h"

@interface YUTableViewController ()

@end

@implementation YUTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.navigationController setToolbarHidden:NO animated:NO];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UIBarButtonItem *callModalViewButton = [[UIBarButtonItem alloc]
                                            initWithTitle:@"地域"
                                            style:UIBarButtonItemStyleBordered
                                            target:self
                                            action:@selector(callModalList:)];
    self.navigationItem.rightBarButtonItem = callModalViewButton;
    
    //self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.title = @"首页";
    
    YUXML *yuxml = [[[YUXML alloc] init] autorelease];
    [yuxml Analyze];
}

- (void) viewWillAppear:(BOOL)animated
{
    YUAppDelegate *delegate = (YUAppDelegate*) [[UIApplication sharedApplication]delegate];
    
    //NSArray *aaa = [[delegate.provinces objectAtIndex:delegate.section] objectAtIndex:delegate.row];
    //NSArray *cities = [[delegate.provinces objectAtIndex:delegate.section] objectForKey:@"Citys"];
    
    self.title = [NSString stringWithFormat:@"首页"];
    
    NSArray *pro = [[delegate.provinces objectAtIndex:delegate.section] objectForKey:@"Citys"];
    NSString *city = [[pro objectAtIndex:delegate.row] objectForKey:@"C_Name"];
    NSLog(@"首页 %d %d %d %@", delegate.section, delegate.row, [pro count], city);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...

    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }

    cell.textLabel.text = [NSString stringWithFormat:@"%drow", indexPath.row];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
    NSString *str = [NSString stringWithFormat:@"%d %d", indexPath.section, indexPath.row];
    YUViewController *vc = [[[YUViewController alloc] init] autorelease];
    vc.title = @"next page";
    [self.navigationController pushViewController:vc animated:YES];
    vc.lblinfo.text = str;
}

- (void) callModalList:(id)sender
{
    //    UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示" message:@"你点击了导航栏左按钮" delegate:self  cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    //    [alter show];
    
    YULocateViewController *locatevc = [[YULocateViewController alloc] initWithStyle:UITableViewStyleGrouped];
    locatevc.title = @"select locate";
    [self.navigationController pushViewController:locatevc animated:YES];
}

@end
