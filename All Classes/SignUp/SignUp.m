//
//  SignUp.m
//  FriendsSpotFinal
//
//  Created by indianic on 16/07/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import "SignUp.h"

NSArray *arrayFieldNames;

@interface SignUp ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightOfContentView;
@end

@implementation SignUp


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
//                                    [UIColor whiteColor],NSForegroundColorAttributeName,
//                                    [UIColor whiteColor],NSBackgroundColorAttributeName,nil];
//    
//    self.navigationController.navigationBar.titleTextAttributes = textAttributes;
//    self.title = @"Rigister Form";
//    
//    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:104.0/255.0 green:21.0/255.0 blue:32.0/255.0 alpha:1.0];
//    self.navigationController.navigationBar.translucent = NO;
//    
    arrayField=[[NSArray alloc]initWithObjects:_txtFname,_txtLname,_txtContact,_txtCountry,_txtState,_txtCity,_txtEmail,_txtUserName,_txtPassword,_txtRpassword, nil];
    
  
    arrayFieldNames=[[NSArray alloc]initWithObjects:@"Firstname",@"LastName",@"Contact",@"Country",@"State",@"City",@"Email",@"Username",@"Password",@"Rpassword", nil];
  
    
  self.scroll_View.contentSize = CGSizeMake(_scroll_View.frame.size.width,500);
    
    
    // Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    _heightOfContentView.constant = _scroll_View.contentSize.height;

}
-(BOOL)textFieldShouldReturn:(UITextField *) textField{
    
     [textField resignFirstResponder];
    if (textField.tag==6) {
        [self btnSubmitClicked:@""];
    }
    
    
        return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
   
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnClearClicked:(id)sender {
    
    for (int i=0;i<arrayField.count;i++)
    {
    UITextField *field=[arrayField objectAtIndex:i];
    field.text=nil;
    }
    
}

-(void)getAlert:(NSString*)message{

    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

-(BOOL)fieldValidation{
    
    //chacking for empty Textbox values
    for (int i=0;i<arrayField.count; i++)
    {
       UITextField *field=[arrayField objectAtIndex:i];
        
        if ([field.text isEqualToString:@""])
        {
            NSString *strAlert=[NSString stringWithFormat:@"%@ should not remain empty.",[arrayFieldNames objectAtIndex:i]];
            [self getAlert:strAlert];
            return NO;
        }
  
    }
    //chacking end
    
    if([_txtPassword.text isEqualToString: _txtRpassword.text]){
        }else{
            UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 16, 16)];
            imgView.image = [UIImage imageNamed:@"XT_problem.png"];
            _txtRpassword.rightView = imgView;
            _txtRpassword.rightViewMode =  UITextFieldViewModeAlways;
            [_txtRpassword becomeFirstResponder];
            [self getAlert:@"both password should be match each other."];
            return NO;
        }
    
    if (![self NSStringIsValidEmail:_txtEmail.text]) {
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 16, 16)];
        imgView.image = [UIImage imageNamed:@"XT_problem.png"];
        _txtEmail.rightView=imgView;
        _txtEmail.rightViewMode=UITextFieldViewModeAlways;
        [_txtEmail becomeFirstResponder];
        [self getAlert:@"Enter valid email."];
        return NO;
        }
    
    if ([_txtPassword.text length]<=7) {
        
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 16, 16)];
        imgView.image = [UIImage imageNamed:@"XT_problem.png"];
        _txtPassword.rightView=imgView;
        _txtPassword.rightViewMode=UITextFieldViewModeAlways;
        [_txtPassword becomeFirstResponder];
        [self getAlert:@"password should not be less then 8 in length."];
         return NO;
    }
    
    if ([_txtContact.text length]<10) {
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 16, 16)];
        imgView.image = [UIImage imageNamed:@"XT_problem.png"];
        _txtContact.rightView=imgView;
        _txtContact.rightViewMode=UITextFieldViewModeAlways;
        [_txtContact becomeFirstResponder];
        
        
        [self getAlert:@"please enter valid contect number."];
        return NO;
    }
    
        return YES;

}
    


- (IBAction)btnSubmitClicked:(id)sender {
    
        
    
    if([self fieldValidation]){
       
        
        NSMutableDictionary *aDict = [[NSMutableDictionary alloc]init];
        NSArray *keys=[[NSArray alloc]initWithObjects:@"fname",@"lname",@"contact",@"country",@"state",@"city",@"email",@"uName",@"password",nil];
        
        for (int i=0;i<(arrayField.count-1); i++)
        {
            UITextField *field=[arrayField objectAtIndex:i];
        [aDict setValue:field.text forKey:[keys objectAtIndex:i]];
        }
         if ([_segmentGender selectedSegmentIndex]==0)
         {[aDict setValue:@"Male" forKey:@"gender"];}
         else
         {[aDict setValue:@"Female" forKey:@"gender"];}
        [aDict setValue:@"signup" forKey:@"action"];
        //fname=hello&lname=gfdg&gender=fgf&contact=5365&country=gdfg&state=gdfg&city=gfgf&email=gfg&uName=gfg&password=fggfg&action=signup
        
        service *service1=[service new];
               [service1 FSPlzcallWebServiceWithURLString: @"FS-host" ArgumentsDictionary:aDict];
        //
        [_activitySignup startAnimating];
        service1.serviceBlock=^(NSMutableDictionary* responce)
        {
            if(responce)
            {
                NSLog(@"%@",responce);
                if([[[responce objectForKey:@"responce"] objectForKey:@"status"] isEqual:@"fail"])
                {
                    [self getAlert:[responce objectForKey:@"responce"]];
                    if ([[[responce objectForKey:@"responce"] objectForKey:@"reson"] isEqual:@"Email already exist"]) {
                        _txtEmail.layer.borderColor=[UIColor redColor].CGColor;
                    }
                }else if([[[responce objectForKey:@"responce"] objectForKey:@"status"] isEqual:@"success"] || [[[responce objectForKey:@"responce"] objectForKey:@"status"] isEqual:@"Deactivated"]){
                    
                                            UIViewController *loginVC=[self.storyboard instantiateViewControllerWithIdentifier:@"loginVC"];
                                            [self.navigationController pushViewController:loginVC animated:YES];
                }
            }
        [_activitySignup stopAnimating];
        };
   
    
   }
}


-(BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
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

