//
//  service.m
//  FriendsSpotFinal
//
//  Created by indianic on 04/08/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import "service.h"

@implementation service

-(void)FSPlzcallWebServiceWithURLString:(NSString*)url ArgumentsDictionary:(NSMutableDictionary*)arguments
{
    url=[url isEqual:@"FS-host"]?@"http://friendsgrs.net46.net/":url;
    NSURL *aURL = [NSURL URLWithString:url];
    
    NSData *aData = [NSJSONSerialization dataWithJSONObject:arguments options:NSJSONWritingPrettyPrinted error:nil];
    
    NSMutableURLRequest *aMutRequest = [[NSMutableURLRequest alloc]initWithURL:aURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
    [aMutRequest setHTTPMethod:@"POST"];
    [aMutRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [aMutRequest setHTTPBody:aData];
    [aMutRequest setValue:[NSString stringWithFormat:@"%lu",(unsigned long)[aData length]] forHTTPHeaderField:@"Content-Length"];
    
    NSMutableDictionary *returnDic =[[NSMutableDictionary alloc]init];
   
    [NSURLConnection sendAsynchronousRequest:aMutRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             
             
             [returnDic setObject:[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil] forKey:@"responce"];
             
            //calling a block to send responce data to that view controller
            self.serviceBlock(returnDic);
         }
         
     }];
    
}



@end

