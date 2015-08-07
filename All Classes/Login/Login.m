//
//  Login.m
//  FriendsSpotFinal
//
//  Created by indianic on 16/07/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import "Login.h"
#import "service.h"
@interface Login ()


@end

@implementation Login



- (void)viewDidLoad {
    [super viewDidLoad];
  
     _imgLogo.layer.cornerRadius=50;
    _btnLogin.layer.cornerRadius=10;
    _btnForgotPassword.layer.cornerRadius=10;
    
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
    else
    {
    
        service *service1=[service new];
        NSMutableDictionary *adic = [[NSMutableDictionary alloc]init];
        [adic setObject:_txtUserName.text forKey:@"uName"];
        [adic setObject:_txtPassword.text forKey:@"password"];
        [adic setObject:@"login" forKey:@"action"];
        
        
        [service1 FSPlzcallWebServiceWithURLString: @"FS-host" ArgumentsDictionary:adic];
//
        service1.serviceBlock=^(NSMutableDictionary* responce)
        {
            if(responce)
            {
                NSLog(@"%@",responce);
                NSLog(@"%@",[[responce objectForKey:@"responce" ] objectForKey:@"status"]);
                
                
                if ([[[responce objectForKey:@"responce" ] objectForKey:@"status"] isEqualToString: @"success"]) {
                    
                    NSMutableDictionary *dicroot=[[NSMutableDictionary alloc]init];
                    NSString *aSt=[[[responce objectForKey:@"responce" ] objectForKey:@"userDetail"]objectForKey:@"id"];
                    
                    [dicroot setObject:aSt forKey:@"id"];
                    aSt=[[[responce objectForKey:@"responce" ] objectForKey:@"userDetail"]objectForKey:@"uName"];
                    [dicroot setObject:aSt forKey:@"uName"];
                    NSLog(@"%@",dicroot);
                    
                    [dicroot writeToFile:[[self applicationDocumentsDirectory] stringByAppendingPathComponent:@"FS_PList.plist"] atomically:YES];
//                     Do any additional setup after loading the view, typically from a nib.
                    
                 
                    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:[[self applicationDocumentsDirectory] stringByAppendingPathComponent:@"FS_PList.plist"]];
                    NSLog(@"%@",dict);
                    
                    
                    
                }
                

                
                else {
                    NSLog(@"nikal");
                }
            }
        };
    
    }
    
}
-(NSString *)applicationDocumentsDirectory {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    return basePath;
    
    
}

@end
