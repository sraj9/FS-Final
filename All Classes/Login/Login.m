//
//  Login.m
//  FriendsSpotFinal
//
//  Created by indianic on 16/07/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import "Login.h"

@interface Login ()

@end

@implementation Login

- (void)viewDidLoad {
    [super viewDidLoad];
  
     _imgLogo.layer.cornerRadius=50;
    _btnLogin.layer.cornerRadius=10;
    _btnForgotPassword.layer.cornerRadius=10;
   
    // Do any additional setup after loading the view.
}



-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)alert:(NSString*)textfield{
    
    UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:@"Alert" message:textfield delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alertview show];
}
- (IBAction)btnLoginClick:(id)sender {
    if ([_txtUserName.text isEqualToString:@""] && [_txtPassword.text isEqualToString:@""]) {
        
        [self alert:@"Please enter User name and Password first."];
        
    }
    else if ([_txtPassword.text isEqualToString:@""]) {
        [self alert:@"Please enter Password first."];
    }
    else if ([_txtUserName.text isEqualToString:@""]) {
        [self alert:@"Please enter User name first."];
    }

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
