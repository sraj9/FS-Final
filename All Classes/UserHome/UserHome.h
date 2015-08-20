//
//  UserHome.h
//  FriendsSpotFinal
//
//  Created by indianic on 17/07/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"
#import "service.h"
#import "comments.h"
#import "TVCellCustom.h"
#import "TPKeyboardAvoidingTableView.h"

@interface UserHome : UIViewController
{
   
    service *service1;
    UIRefreshControl *ref;
    int i;
    NSInteger userId;
}
-(void)refreshHome;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UIView *vcfirstLoad;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityfirstLoad;
@property (weak, nonatomic) IBOutlet UIButton *btnPost;
@property (strong, nonatomic) IBOutlet UIVisualEffectView *bViewNewActivity;
@property (weak, nonatomic) IBOutlet UITableView *tblViewHome;
@property (strong, nonatomic) NSMutableDictionary *userdata;
@property (weak, nonatomic) IBOutlet UILabel *lblComments;

@end
