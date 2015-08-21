//
//  comments.h
//  FriendsSpotFinal
//
//  Created by indianic on 06/08/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"

@interface comments : UIViewController
{
  
}
@property (weak, nonatomic) IBOutlet UIImageView *imgImageActivity;
@property (weak, nonatomic) IBOutlet UILabel *lblImageDiscription;
@property (strong, nonatomic) IBOutlet UIVisualEffectView *viewNewComment;
@property (weak, nonatomic) IBOutlet UIImageView *imgUserPic;
@property (weak, nonatomic) IBOutlet UILabel *lblUserName;
@property (weak, nonatomic) IBOutlet UILabel *lblActivityLikes;
@property (weak, nonatomic) IBOutlet UILabel *lblDate;



@property (strong, nonatomic) IBOutlet UIBarButtonItem *backButtonBar;




@property (nonatomic,strong)NSMutableDictionary *dicMutactivityData;

@end
