//
//  UserHome.h
//  FriendsSpotFinal
//
//  Created by indianic on 17/07/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"
@interface UserHome : UIViewController
{
    NSMutableDictionary *userdata;
}
@property (weak, nonatomic) IBOutlet UIButton *btnPost;
@property (strong, nonatomic) IBOutlet UIVisualEffectView *bViewNewActivity;
@property (weak, nonatomic) IBOutlet UITableView *tblViewHome;
@end
