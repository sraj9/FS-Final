//
//  comments.h
//  FriendsSpotFinal
//
//  Created by indianic on 06/08/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface comments : UIViewController
{
  
}
@property (weak, nonatomic) IBOutlet UIImageView *imgImageActivity;
@property (weak, nonatomic) IBOutlet UILabel *lblImageDiscription;
@property (strong,nonatomic)id(^myImgblock)(NSData* data);




@property (nonatomic,strong)NSMutableDictionary *dicMutactivityData;

@end
