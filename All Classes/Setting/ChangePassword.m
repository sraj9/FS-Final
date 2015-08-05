//
//  ChangePassword.m
//  FriendsSpotFinal
//
//  Created by indianic on 04/08/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import "ChangePassword.h"

@interface ChangePassword ()

@end

@implementation ChangePassword

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    fieldArray=[[NSArray alloc]initWithObjects:_txtOldpass,_txtNewpass,_txtconfpass,nil];
    
    arrayFieldNames=[[NSArray alloc]initWithObjects:@"oldpassword",@"NewPassword",@"ConformPassword",nil];
    
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


-(BOOL)textFieldShouldReturn:(UITextField *) textField{
    
    [textField resignFirstResponder];
    return YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
    
    
}

-(void)getAlert:(NSString*)message{
    
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}




- (IBAction)btnSubmitClick:(id)sender {
    
    
    
    
             
    if ([_txtNewpass.text length]<=7) {
        
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 16, 16)];
        imgView.image = [UIImage imageNamed:@"XT_problem.png"];
        _txtNewpass.rightView=imgView;
        _txtNewpass.rightViewMode=UITextFieldViewModeAlways;
        [_txtNewpass becomeFirstResponder];
        [self getAlert:@"password should not be less then 8 in length."];
   
    }else
        if([_txtNewpass.text isEqualToString: _txtconfpass.text]){
        }else{
            UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 16, 16)];
            imgView.image = [UIImage imageNamed:@"XT_problem.png"];
            _txtconfpass.rightView = imgView;
            _txtconfpass.rightViewMode =  UITextFieldViewModeAlways;
            [_txtconfpass becomeFirstResponder];
            [self getAlert:@"both password should be match each other."];
   


        }
}

@end
