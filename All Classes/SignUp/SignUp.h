//
//  SignUp.h
//  FriendsSpotFinal
//
//  Created by indianic on 16/07/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "service.h"


@interface SignUp : UIViewController<UITextFieldDelegate>
{
    NSArray *arrayField;
    NSArray *arrayFieldNames;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scroll_View;


@property (weak, nonatomic) IBOutlet UITextField *txtFname;
@property (weak, nonatomic) IBOutlet UITextField *txtLname;

@property (weak, nonatomic) IBOutlet UITextField *txtContact;
@property (weak, nonatomic) IBOutlet UITextField *txtCountry;
@property (weak, nonatomic) IBOutlet UITextField *txtState;
@property (weak, nonatomic) IBOutlet UITextField *txtCity;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtUserName;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UITextField *txtRpassword;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activitySignup;

//-(IBAction)btnSubmitClicked:(id)sender;



@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentGender;

@end
