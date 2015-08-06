//
//  service.m
//  FriendsSpotFinal
//
//  Created by indianic on 04/08/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import "service.h"

@implementation service

-(NSMutableDictionary*)FSPlzcallWebServiceWithURLString:(NSString*)url ArgumentsDictionary:(NSMutableDictionary*)arguments
{
    NSLog(@"vfkv");
    NSURL *aURL = [NSURL URLWithString:url];
    
    NSData *aData = [NSJSONSerialization dataWithJSONObject:arguments options:NSJSONWritingPrettyPrinted error:nil];
    
    NSMutableURLRequest *aMutRequest = [[NSMutableURLRequest alloc]initWithURL:aURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
    [aMutRequest setHTTPMethod:@"POST"];
    [aMutRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [aMutRequest setHTTPBody:aData];
    [aMutRequest setValue:[NSString stringWithFormat:@"%lu",(unsigned long)[aData length]] forHTTPHeaderField:@"Content-Length"];
    
    NSMutableDictionary *returnDic =[[NSMutableDictionary alloc]init];
    //    [self.actLoading startAnimating];
    
    //Create Object
    //Set Block
    //    {
    //        ///Code
    //    }
    [NSURLConnection sendAsynchronousRequest:aMutRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             
             
             [returnDic setObject:[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil] forKey:@"responce"];
             
             NSLog(@"%@",[NSString stringWithFormat:@"%@",[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil]]);
             //                     [self.actLoading stopAnimating];
           //@property (nonatomic, copy) returnType (^blockName)(parameterTypes);
             
             
         }
         
     }];
    
    
    return returnDic;
}



@end

