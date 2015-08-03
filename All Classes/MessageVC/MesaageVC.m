//
//  MesaageVC.m
//  FriendsSpotFinal
//
//  Created by indianic on 30/07/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import "MesaageVC.h"

@interface MesaageVC () <UITableViewDataSource,UITableViewDelegate>{
      NSMutableArray *mutArrDatasource ;
     UIRefreshControl *refreshControl;
}


@end

@implementation MesaageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    refreshControl = [[UIRefreshControl alloc]init];
//    
//    [refreshControl addTarget:self action:@selector(refreshHandler:) forControlEvents:UIControlEventValueChanged];
//    
//   [_tblView addSubview:refreshControl];
//    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Navigation

@end
