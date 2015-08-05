//
//  service.h
//  FriendsSpotFinal
//
//  Created by indianic on 04/08/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface service : NSObject

-(NSMutableDictionary*)FSPlzcallWebServiceWithURLString:(NSString*)url ArgumentsDictionary:(NSMutableDictionary*)arguments;
@property (nonatomic, copy) NSDictionary* (^myblock)(NSString *mystr);


@end
