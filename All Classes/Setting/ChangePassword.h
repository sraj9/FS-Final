//
//  ChangePassword.h
//  FriendsSpotFinal
//
//  Created by indianic on 04/08/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import <UIKit/UIKit.h>

NSArray *fieldArray;
NSArray *arrayFieldNames;

@interface ChangePassword : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtOldpass;
@property (weak, nonatomic) IBOutlet UITextField *txtNewpass;
@property (weak, nonatomic) IBOutlet UITextField *txtconfpass;
@property (weak, nonatomic) IBOutlet UIButton *btnSubmitClick;

@end
