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
    _lblErrorLogin.hidden=YES;
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:[[self applicationDocumentsDirectory] stringByAppendingPathComponent:@"FS_PList.plist"]];
    if ([dict objectForKey:@"id"] && ![[dict objectForKey:@"id"] isEqual:@""]) {
        
        UserHome *objHome = [UserHome new];
        objHome.uId = [[dict objectForKey:@"id"] integerValue];
        UIViewController *user=[self.storyboard instantiateViewControllerWithIdentifier:@"RevealHome"];
        [self.navigationController pushViewController:user animated:NO];
        
        
    }
    
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
                    //
                    //                    MyDropdownMenuController *aHome = [self.storyboard instantiateViewControllerWithIdentifier:@"MyDropdownMenuController"];
                    //                    [self.navigationController pushViewController:aHome animated:NO];
                    //
                    UIViewController *home=[self.storyboard instantiateViewControllerWithIdentifier:@"RevealHome"];
                    [self.navigationController pushViewController:home animated:YES];
                    
                }
                
                
                
                else {
                    NSLog(@"nikal");
                    CAKeyframeAnimation * anim = [ CAKeyframeAnimation animationWithKeyPath:@"transform" ] ;
                    anim.values = [ NSArray arrayWithObjects:
                                   [ NSValue valueWithCATransform3D:CATransform3DMakeTranslation(-10.0f, 0.0f, 0.0f) ],
                                   [ NSValue valueWithCATransform3D:CATransform3DMakeTranslation(10.0f, 0.0f, 0.0f) ],
                                   nil ] ;
                    anim.autoreverses = YES ;
                    anim.repeatCount = 3.0f ;
                    anim.duration = 0.05f ;
                    
                    [ _txtPassword.layer addAnimation:anim forKey:nil ];
                    CAKeyframeAnimation * anim2 = [ CAKeyframeAnimation animationWithKeyPath:@"transform" ] ;
                    anim2.values = [ NSArray arrayWithObjects:
                                    [ NSValue valueWithCATransform3D:CATransform3DMakeTranslation(10.0f, 0.0f, 0.0f) ],
                                    [ NSValue valueWithCATransform3D:CATransform3DMakeTranslation(-10.0f, 0.0f, 0.0f) ],
                                    nil ] ;
                    anim2.autoreverses = YES ;
                    anim2.repeatCount = 3.0f ;
                    anim2.duration = 0.05f ;
                    [ _txtUserName.layer addAnimation:anim2 forKey:nil ] ;
                    _lblErrorLogin.hidden=NO;
                    _lblErrorLogin.textColor=[UIColor redColor];
                    _lblErrorLogin.text=[[responce objectForKey:@"responce"]objectForKey:@"reson"];
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
