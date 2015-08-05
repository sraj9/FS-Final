//
//  UserHome.m
//  FriendsSpotFinal
//
//  Created by indianic on 17/07/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import "UserHome.h"
#import "service.h"
@interface UserHome ()

@end

@implementation UserHome

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
//    [dic setObject:@"govind300" forKey:@"uName"];
//    [dic setObject:@"login" forKey:@"action"];
//    [dic setObject:@"1dfds" forKey:@"password"];
    
       [dic setObject:@"87" forKey:@"uId"];
       [dic setObject:@"loadHome" forKey:@"action"];
    
//        [dic setObject:@"87" forKey:@"uId"];
//        [dic setObject:@"newActivity" forKey:@"action"];
//        [dic setObject:@"text" forKey:@"type"];
//        [dic setObject:@"lovely day" forKey:@"discription"];
    
   
    service *service1=[service new];
    
    NSMutableDictionary *dic1=[[NSMutableDictionary alloc]initWithDictionary:[service1 FSPlzcallWebServiceWithURLString: @"http://friendsgrs.net46.net/" ArgumentsDictionary:dic]];

    NSLog(@"responce=%@",dic1);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
