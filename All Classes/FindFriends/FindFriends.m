//
//  FindFriends.m
//  FriendsSpotFinal
//
//  Created by indianic on 13/08/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import "FindFriends.h"

@interface FindFriends () <UISearchBarDelegate>

@end

@implementation FindFriends

- (void)viewDidLoad {
    [super viewDidLoad];
    searchResult=[[NSMutableDictionary alloc]init];
    _searchbar.delegate=self;
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"%@", _searchbar.text);
    
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    
    [dic setObject:@"87" forKey:@"uId"];
    [dic setObject:_searchbar.text forKey:@"keyword"];
    [dic setObject:@"searchFriend" forKey:@"action"];
    
    
    service1=[service new];
    [service1 FSPlzcallWebServiceWithURLString: @"FS-host" ArgumentsDictionary:dic];
    
    service1.serviceBlock=^(NSMutableDictionary* responce)
    {
        if(responce)
        {
            [searchResult setValuesForKeysWithDictionary:responce];
            NSLog(@"%@",searchResult);
            }
        [_tableView reloadData];
       };
    



}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{ if(searchResult)
    {return [[[searchResult objectForKey:@"responce"] objectForKey:@"searchResult"] count];}
    else
    {return 0;
    }
    
    }

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   // UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellone"];
    
//       //changing a cell depends on activity type
//        if([[[[[searchResult objectForKey:@"responce"]objectForKey:@"activitys"]objectAtIndex:indexPath.row]objectForKey:@"type"] isEqual:@"text"])
//        {
//            UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"celltwo"];
//            
//            UILabel *lbl=(UILabel*)[cell viewWithTag:14];
//            lbl.text=[[[[searchResult objectForKey:@"responce"]objectForKey:@"activitys"]objectAtIndex:indexPath.row]objectForKey:@"discription"];
//            return cell;
//        }
//        else{
    
    
    
            UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellone"];
    
            UILabel *lbl=(UILabel*)[cell viewWithTag:11];
            lbl.text=[[[[searchResult objectForKey:@"responce"]objectForKey:@"searchResult"]objectAtIndex:indexPath.row]objectForKey:@"fName"];
       
            NSString *strImg=[NSString stringWithFormat:@"http://friendsgrs.net46.net/%@",[[[[searchResult objectForKey:@"responce"]objectForKey:@"searchResult"]objectAtIndex:indexPath.row]objectForKey:@"profilePic"]];
            
            
            
            UIImageView *img1=(UIImageView*)[cell viewWithTag:10];
            
            [img1 sd_setImageWithURL:[NSURL URLWithString:strImg]
                   placeholderImage:[UIImage imageNamed:strImg]
                          completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL)
             {
                 img1.image=image;
                 
             }];
            
            
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
