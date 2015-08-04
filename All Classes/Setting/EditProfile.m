//
//  EditProfile.m
//  FriendsSpotFinal
//
//  Created by indianic on 04/08/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import "EditProfile.h"

@interface EditProfile ()

@end

@implementation EditProfile

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.txtname.hidden=YES;
    self.btnDoneclick.hidden=YES;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btneditclick:(id)sender {
    self.lblFname.hidden=YES;
    self.txtname.hidden=NO;
    self.btnDoneclick.hidden=NO;
    self.btnEditclick.hidden=YES;
    
}
- (IBAction)btnDoneclick:(id)sender {
    self.txtname.hidden=YES;
    self.lblFname.hidden=NO;
    self.btnDoneclick.hidden=YES;
    self.btnEditclick.hidden=NO;
    
}

@end
