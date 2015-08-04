//
//  UserHome.m
//  FriendsSpotFinal
//
//  Created by indianic on 17/07/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import "UserHome.h"

@interface UserHome ()

@end

@implementation UserHome

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    [dic setObject:@"uId" forKey:@"87"];
    [dic setObject:@"action" forKey:@"loadHome"];
    
    NSArray *responce=[[NSArray alloc]initWithArray:[self GovindPlzcallWebServiceWithURLString: @"http://friendsgrs.net46.net" ArgumentsDictionary:dic]];
    NSLog(@"responce=%@",responce);
    NSLog(@"responce=");

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSMutableArray*)GovindPlzcallWebServiceWithURLString:(NSString*)url ArgumentsDictionary:(NSDictionary*)arguments
{
    NSLog(@"vfkv");
    NSURL *aURL = [NSURL URLWithString:url];
    
    NSData *aData = [NSJSONSerialization dataWithJSONObject:arguments options:NSJSONWritingPrettyPrinted error:nil];
    
    NSMutableURLRequest *aMutRequest = [[NSMutableURLRequest alloc]initWithURL:aURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
    [aMutRequest setHTTPMethod:@"POST"];
    [aMutRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [aMutRequest setHTTPBody:aData];
    [aMutRequest setValue:[NSString stringWithFormat:@"%lu",(unsigned long)[aData length]] forHTTPHeaderField:@"Content-Length"];
    
    NSMutableArray *returnArr;
//    [self.actLoading startAnimating];
    [NSURLConnection sendAsynchronousRequest:aMutRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
          {
              if (data.length > 0 && connectionError == nil)
              {
                 [returnArr addObject:[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil] ];
//                     [self.actLoading stopAnimating];
              }
          }];
    return returnArr;

}

#pragma TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellone"];
    return cell;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
