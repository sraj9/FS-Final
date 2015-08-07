//
//  ButtonColor.m
//  FriendsSpotFinal
//
//  Created by indianic on 07/08/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import "ButtonColor.h"

@implementation ButtonColor

-(void)awakeFromNib{
    [super awakeFromNib];
    self.backgroundColor = [UIColor colorWithRed:104.0/255.0 green:21.0/255.0 blue:32.0/255.0 alpha:1.0];
   

    
    [self setTitleColor:[UIColor colorWithRed:255.0/255.0 green:237.0/255.0 blue:248.0/255.0 alpha:1.0] forState:UIControlStateNormal];
}


@end
