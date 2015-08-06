//
//  EditProfile.h
//  FriendsSpotFinal
//
//  Created by indianic on 04/08/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditProfile : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtname;

@property (weak, nonatomic) IBOutlet UIButton *btnEditclick;
@property (weak, nonatomic) IBOutlet UIButton *btnDoneclick;
@property (weak, nonatomic) IBOutlet UILabel *lblFname;
@property (weak, nonatomic) IBOutlet UILabel *lblCity;
@property (weak, nonatomic) IBOutlet UILabel *lblState;
@property (weak, nonatomic) IBOutlet UILabel *lblCountry;
@property (weak, nonatomic) IBOutlet UILabel *lblContact;
@property (weak, nonatomic) IBOutlet UITextField *txtCity;
@property (weak, nonatomic) IBOutlet UITextField *txtState;
@property (weak, nonatomic) IBOutlet UITextField *txtCountry;
@property (weak, nonatomic) IBOutlet UITextField *txtContact;






@end
