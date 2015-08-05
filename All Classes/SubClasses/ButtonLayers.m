//
//  ButtonLayers.m
//  FriendsSpotFinal
//
//  Created by indianic on 04/08/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import "ButtonLayers.h"

@implementation ButtonLayers


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    self.layer.borderColor = [UIColor colorWithRed:104.0/255.0 green:21.0/255.0 blue:32.0/255.0 alpha:1.0].CGColor;
    self.layer.borderWidth = 1.0;
}


@end
