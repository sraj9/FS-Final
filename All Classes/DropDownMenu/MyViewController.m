//
//  MyViewController.m
//  DropdownMenu-Example
//
//  Created by Nils Mattisson on 1/13/14.
//  Copyright (c) 2014 Nils Mattisson. All rights reserved.
//

#import "MyViewController.h"
#import "MyDropdownMenuController.h"

<<<<<<< HEAD
@interface MyViewController () 
=======
@interface MyViewController ()<UITableViewDataSource,UITableViewDelegate>
>>>>>>> b3a92c7e0e27a4ae4d3174d43459b272843bbb50

@end

@implementation MyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Customize your menubar programmatically here.
    MyDropdownMenuController* menu = (MyDropdownMenuController *) [self parentViewController];
    [menu setMenubarTitle:self.titleLabel.text];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellone"];
    return cell;
   
}


@end
