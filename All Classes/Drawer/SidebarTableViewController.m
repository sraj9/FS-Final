//
//  SidebarTableViewController.m
//  SidebarDemo
//
//  Created by Simon Ng on 10/11/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

#import "SidebarTableViewController.h"
#import "SWRevealViewController.h"
#import "PhotoViewController.h"

@interface SidebarTableViewController ()

@end

@implementation SidebarTableViewController {
    NSArray *menuItems;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //[self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    menuItems = @[@"Logo",@"Name",@"Home", @"Message", @"Friends", @"Settings", @"Logout"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    //setting a hight of both cell differently
    float f;
    
    
    
    f=(indexPath.row==0 || indexPath.row==1)?100:50;
   // f=(indexPath.row==0 || indexPath.row==1 || indexPath.row==2 || indexPath.row==3 || indexPath.row==4)?[self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine]:[self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    return f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return menuItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   

    NSString *CellIdentifier = [menuItems objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0 ) {
        [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    } if ( indexPath.row==1 ) {
        [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    } if ( indexPath.row==2 ) {
        [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    }if ( indexPath.row==3) {
        [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    }
    NSLog(@"%ld", indexPath.row);
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Set the title of navigation bar by using the menu items
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    UINavigationController *destViewController = (UINavigationController*)segue.destinationViewController;
    destViewController.title = [[menuItems objectAtIndex:indexPath.row] capitalizedString];
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row==6)
    {
        
    
    }
}

//- (void)viewWillAppear:(BOOL)animated
//{
//    [self.tblMenu setFrame:CGRectMake(0, 0, 320, 500)];
//}
@end
