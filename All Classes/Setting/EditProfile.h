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

@end
