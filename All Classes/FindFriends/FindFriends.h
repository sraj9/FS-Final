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
@interface FindFriends :UIViewController
{
    service *service1;
    NSMutableDictionary *searchResult;
    
    NSIndexPath *indexpath1;
}
@property (weak, nonatomic) IBOutlet UISearchBar *searchbar;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
//@property (weak, nonatomic) IBOutlet UITableView *cellone;
@end
