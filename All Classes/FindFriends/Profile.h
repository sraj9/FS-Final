//
//  Profile.h
//  FriendsSpotFinal
//
//  Created by indianic on 20/08/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"
#import "service.h"


@interface Profile : UIViewController
{
   
    service *service2;
    NSNumber *uId;
    
}
@property (strong,nonatomic) NSMutableDictionary *profileDetails;
@property (weak, nonatomic) IBOutlet UIImageView *imgUserProfle;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblSirname;
@property (weak, nonatomic) IBOutlet UILabel *lblGender;
@property (weak, nonatomic) IBOutlet UILabel *lblCity;
@property (weak, nonatomic) IBOutlet UILabel *lblState;
@property (weak, nonatomic) IBOutlet UILabel *lblCountry;
@property (weak, nonatomic) IBOutlet UILabel *lblContact;


@end
