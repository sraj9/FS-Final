//
//  UserHome.h
//  FriendsSpotFinal
//
//  Created by indianic on 17/07/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UserHome : UIViewController
{
    NSMutableDictionary *userdata;
}
@property (weak, nonatomic) IBOutlet UITableView *tblViewHome;
@end
