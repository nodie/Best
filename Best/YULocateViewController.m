//
//  YULocateViewController.m
//  Best
//
//  Created by 於 琦峰 on 12-09-23.
//  Copyright (c) 2012年 於 琦峰. All rights reserved.
//

#import "YULocateViewController.h"
#import "YUAppDelegate.h"

@interface YULocateViewController ()

@end

@implementation YULocateViewController
@synthesize provinces;

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    YUAppDelegate *delegate = (YUAppDelegate*) [[UIApplication sharedApplication]delegate];
    
    provinces = [delegate provinces];
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
    return [provinces count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSArray *cities = [[provinces objectAtIndex:section] objectForKey:@"Citys"];
    return [cities count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *CellIdentifier = @"Cell";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //if (cell == nil) {
    //    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    //}
    
    // Configure the cell...
    
    
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    
    NSArray *cities = [[provinces objectAtIndex:section] objectForKey:@"Citys"];
    
    static NSString *groupTableIndentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:groupTableIndentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:groupTableIndentifier];
    }
    
    cell.textLabel.text = [[cities objectAtIndex:row] objectForKey:@"C_Name"];
    
    
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

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *provincName = [[provinces objectAtIndex:section] objectForKey:@"p_Name"];
    return provincName;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    //  快速地域索引
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:35];
    for (NSDictionary *dict in provinces) {
        [array addObject:[dict objectForKey:@"p_Name"]];
    }
    
    return array;
}


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
    
    YUAppDelegate *delegate = (YUAppDelegate*) [[UIApplication sharedApplication]delegate];
    delegate.section = indexPath.section;
    delegate.row = indexPath.row;
    NSLog(@"%d %d", delegate.section, delegate.row);
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
