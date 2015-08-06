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
    userdata=[[NSMutableDictionary alloc]init];
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
//    [dic setObject:@"govind300" forKey:@"uName"];
//    [dic setObject:@"login" forKey:@"action"];
//    [dic setObject:@"1" forKey:@"password"];
    
       [dic setObject:@"87" forKey:@"uId"];
       [dic setObject:@"loadHome" forKey:@"action"];
    
//        [dic setObject:@"87" forKey:@"uId"];
//        [dic setObject:@"newActivity" forKey:@"action"];
//        [dic setObject:@"text" forKey:@"type"];
//        [dic setObject:@"lovely day" forKey:@"discription"];
    
   
    service *service1=[service new];
   [service1 FSPlzcallWebServiceWithURLString: @"FS-host" ArgumentsDictionary:dic];
    
    service1.serviceBlock=^(NSMutableDictionary* responce)
    {
        if(responce)
        {
            [userdata setValuesForKeysWithDictionary:responce];
            NSLog(@"%@",userdata);
//            NSLog(@"%@",[[[[userdata objectForKey:@"responce"]objectForKey:@"activitys"]objectAtIndex:2]objectForKey:@"image"]);
            [_tblViewHome reloadData];
        }
    };
   

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(userdata)
    {return [[[userdata objectForKey:@"responce"]objectForKey:@"activitys"] count];}
    else
    {return 0;}
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//setting a hight of both cell differently
    float f;
    
    f=[[[[[userdata objectForKey:@"responce"]objectForKey:@"activitys"]objectAtIndex:indexPath.row]objectForKey:@"type"] isEqual:@"text"]?138:306;
    
    return f;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if([[[[[userdata objectForKey:@"responce"]objectForKey:@"activitys"]objectAtIndex:indexPath.row]objectForKey:@"type"] isEqual:@"text"])
    {
UITableViewCell *cell;
        cell=[tableView dequeueReusableCellWithIdentifier:@"celltwo"];
        
        UILabel *lbl=(UILabel*)[cell viewWithTag:14];
        lbl.text=[[[[userdata objectForKey:@"responce"]objectForKey:@"activitys"]objectAtIndex:indexPath.row]objectForKey:@"discription"];
        return cell;
     }
    else{
        UITableViewCell *cell;
        cell=[tableView dequeueReusableCellWithIdentifier:@"cellone"];
        
        UILabel *lbl=(UILabel*)[cell viewWithTag:4];
        lbl.text=[[[[userdata objectForKey:@"responce"]objectForKey:@"activitys"]objectAtIndex:indexPath.row]objectForKey:@"discription"];
        
         NSString *strImg=[NSString stringWithFormat:@"http://friendsgrs.net46.net/%@",[[[[userdata objectForKey:@"responce"]objectForKey:@"activitys"]objectAtIndex:indexPath.row]objectForKey:@"image"]];
       
        //NSLog(@"%@",strImg);
        
        UIImageView *img=(UIImageView*)[cell viewWithTag:5];
        img.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:strImg]]];
        
        return cell;
    }
    return nil;
    
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
