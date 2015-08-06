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
    
    
    
    self.btnDoneclick.hidden=YES;
    self.txtname.hidden=YES;
    self.txtCity.hidden=YES;
    self.txtContact.hidden=YES;
    self.txtCountry.hidden=YES;
    self.txtState.hidden=YES;

    
        // Do any additional setup after loading the view.
}
-(BOOL)textFieldShouldReturn:(UITextField *) textField{
    
    [textField resignFirstResponder];
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated
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
    self.lblCity.hidden=YES;
    self.lblState.hidden=YES;
    self.lblCountry.hidden=YES;
    self.lblContact.hidden=YES;
    self.txtname.hidden=NO;
    self.txtCity.hidden=NO;
    self.txtState.hidden=NO;
    self.txtCountry.hidden=NO;
    self.txtContact.hidden=NO;

    self.btnDoneclick.hidden=NO;
    self.btnEditclick.hidden=YES;
    
}
- (IBAction)btnDoneclick:(id)sender {
    self.txtname.hidden=YES;
    self.txtCity.hidden=YES;
    self.txtState.hidden=YES;
    self.txtCountry.hidden=YES;
    self.txtContact.hidden=YES;
    self.lblFname.hidden=NO;
    self.lblCity.hidden=NO;
    self.lblState.hidden=NO;
    self.lblCountry.hidden=NO;
    self.lblContact.hidden=NO;
    
    self.btnDoneclick.hidden=YES;
    self.btnEditclick.hidden=NO;
    
}

@end
