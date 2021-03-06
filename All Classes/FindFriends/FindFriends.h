//
//  FindFriends.h
//  FriendsSpotFinal
//
//  Created by indianic on 13/08/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "service.h"
#import "UIImageView+WebCache.h"
#import "Profile.h"
#import "SWRevealViewController.h"
@interface FindFriends :UIViewController
{
    service *service1;
    NSMutableDictionary *searchResult;
    NSMutableDictionary *sendRequest;
    NSNumber *uId;
}
@property (weak, nonatomic) IBOutlet UISearchBar *searchbar;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *slideBar;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
//@property (weak, nonatomic) IBOutlet UITableView *cellone;
@end
