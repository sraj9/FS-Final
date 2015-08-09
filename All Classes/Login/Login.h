//
//  Login.h
//  FriendsSpotFinal
//
//  Created by indianic on 16/07/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyDropdownMenuController.h"
@interface Login : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imgLogo;

@property (weak, nonatomic) IBOutlet UILabel *btnForgotPassword;
@property (weak, nonatomic) IBOutlet UITextField *txtUserName;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UIButton *btnSignUp;
@property (strong, nonatomic) IBOutlet UILabel *lblErrorLogin;


@end
