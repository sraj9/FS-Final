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
    else
    {
        NSURL *aurl =[NSURL URLWithString:@"http://friendsgrs.net46.net"];
        
//        /?uName=govind300&password=1&action=login
        NSMutableDictionary *adic=[[NSMutableDictionary alloc]initWithObjects:[NSArray arrayWithObjects:_txtUserName.text,_txtPassword.text,@"login", nil] forKeys:[NSArray arrayWithObjects:@"uName",@"password",@"action",nil]];
        
        NSData *adata=[NSJSONSerialization dataWithJSONObject:adic options:NSJSONWritingPrettyPrinted error:nil];
        
        NSMutableURLRequest *aMutReq=[[NSMutableURLRequest alloc]initWithURL:aurl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10.0];
        [aMutReq setHTTPMethod:@"POST"];
        [aMutReq setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [aMutReq setHTTPBody:adata];
        [aMutReq setValue:[NSString stringWithFormat:@"%lu",(unsigned long)[adata length]] forHTTPHeaderField:@"Content-Length"];
        NSLog(@"Data %@",adata);
        
        NSString *astrdata =[[NSString alloc] initWithData:adata encoding:NSUTF8StringEncoding];
        NSLog(@"Data String%@",astrdata);
        
    

        //Asynchronous WebCall With Blocks
    
    [NSURLConnection sendAsynchronousRequest:aMutReq queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
         {
             if (data.length > 0 && connectionError == nil)
             {
                NSLog(@"%@",[NSString stringWithFormat:@"%@",[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil]]);
                 
             }
         }];
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
