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
 
    
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.slideBar setTarget: self.revealViewController];
        [self.slideBar setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
    
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
    
    [searchBar resignFirstResponder];


}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(searchResult)
    {
        return [[[searchResult objectForKey:@"responce"] objectForKey:@"searchResult"] count];
    }
    else
    {
        return 0;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Profile *pro=(Profile*)[self.storyboard instantiateViewControllerWithIdentifier:@"profile"];
    
    pro.profileDetails=[[[searchResult objectForKey:@"responce"]objectForKey:@"searchResult"]objectAtIndex: indexPath.row];

   [ self.navigationController pushViewController:pro animated:YES];
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
            UITableViewCell *cell;
    
         cell=[tableView dequeueReusableCellWithIdentifier:@"cellone"];
    
      //User Image
    UIImageView *img1=(UIImageView*)[cell viewWithTag:10];
    if (![[[[[searchResult objectForKey:@"responce"]objectForKey:@"searchResult"]objectAtIndex:indexPath.row]objectForKey:@"profilePic"]isEqualToString:@""]) {
        img1.layer.cornerRadius=30;
   
    NSString *strImg=[NSString stringWithFormat:@"http://friendsgrs.net46.net/%@",[[[[searchResult objectForKey:@"responce"]objectForKey:@"searchResult"]objectAtIndex:indexPath.row]objectForKey:@"profilePic"]];
        
              [img1 sd_setImageWithURL:[NSURL URLWithString:strImg]
                   placeholderImage:[UIImage imageNamed:strImg]
                          completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL)
             {
                 img1.image=image;
               }];
    
    }else{
        
        
         img1.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"user" ofType:@"png"]];
        
        
    }
      //Name label
    
      UILabel *lbl=(UILabel*)[cell viewWithTag:11];
    
      NSString *fullname=[NSString stringWithFormat:@"%@ %@",[[[[searchResult objectForKey:@"responce"]objectForKey:@"searchResult"]objectAtIndex: indexPath.row]objectForKey:@"fName"],
        [[[[searchResult objectForKey:@"responce"]objectForKey:@"searchResult"]objectAtIndex: indexPath.row] objectForKey:@"lName"]];
    
    lbl.text=fullname;
    
    //Add Friends Clicked
    
    UIButton *btnSendRequest=(UIButton*)[cell viewWithTag:12];
    
    
    btnSendRequest.tag=[[[[[searchResult objectForKey:@"responce"]objectForKey:@"searchResult"]objectAtIndex:indexPath.row] objectForKey:@"id"]integerValue];
    
    [btnSendRequest addTarget:self action:@selector(navigatePics:) forControlEvents:UIControlEventTouchUpInside];
  
    
    
 return cell;
 }

-(void)navigatePics:(UIButton *)sender
{
    
    NSLog(@"%ld",(long)sender.tag);
    
    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
     [dict setObject:@"87" forKey:@"senderId"];
      [dict setObject:[NSNumber numberWithInt:(int)sender.tag] forKey:@"uId"];

      [dict setObject:@"sendRequest" forKey:@"action"];
     [dict setObject:@"Please accept requsest" forKey:@"requestMessage"];
    
    service1=[service new];
    [service1 FSPlzcallWebServiceWithURLString: @"FS-host" ArgumentsDictionary:dict];
    
    service1.serviceBlock=^(NSMutableDictionary* responce)
    {
        if(responce)
        {
            NSLog(@"%@",responce);
            if ([[[responce objectForKey:@"responce"] objectForKey:@"status"] isEqualToString:@"success"]) {
                [sender setEnabled:NO];
                [sender setTitle:@"Requested" forState:UIControlStateDisabled];
                [sender setBackgroundColor:[UIColor colorWithRed:170.0/255 green:170.0/255 blue:170.0/255 alpha:1]];
                
            }
        }
        
    };

    
    
    
    
    
    
    

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
