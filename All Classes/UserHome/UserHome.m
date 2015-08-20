//
//  UserHome.m
//  FriendsSpotFinal
//
//  Created by indianic on 17/07/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import "UserHome.h"
#import "SWRevealViewController.h"
@interface UserHome ()

@end

@implementation UserHome

- (void)viewDidLoad {
    [super viewDidLoad];
    //getting userID from globle dictionary
    userId=[[[gblAppDel mutDictUserDetails] objectForKey:@"id"] integerValue];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    ref=[[UIRefreshControl alloc]init];
    [ref addTarget:self action:@selector(refreshHome) forControlEvents:UIControlEventValueChanged];
    [ _tblViewHome addSubview:ref];
    
    _btnPost.layer.cornerRadius=5;
    _bViewNewActivity.frame=CGRectMake(0,510,400,58);
    [self.view addSubview:_bViewNewActivity];
    
    self.vcfirstLoad.frame=CGRectMake(0,0,400,600);
    [self.view addSubview:self.vcfirstLoad];
    
   
    
    
    
    [self refreshHome];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(_userdata)
    {return [[[_userdata objectForKey:@"responce"]objectForKey:@"activitys"] count]+1;}
    else
    {return 0;}
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //setting a hight of both cell differently
    float f;
    if([[[_userdata objectForKey:@"responce"]objectForKey:@"activitys"] count]>indexPath.row){
        f=[[[[[_userdata objectForKey:@"responce"]objectForKey:@"activitys"]objectAtIndex:indexPath.row]objectForKey:@"type"] isEqual:@"text"]?138:306;}
    else{
        f=57;
    }
    
    return f;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TVCellCustom *cell;
    
    if([[[_userdata objectForKey:@"responce"]objectForKey:@"activitys"] count]>indexPath.row)
    {
        //changing a cell depends on activity type
        if([[[[[_userdata objectForKey:@"responce"]objectForKey:@"activitys"]objectAtIndex:indexPath.row]objectForKey:@"type"] isEqual:@"text"])
        {
            cell=[tableView dequeueReusableCellWithIdentifier:@"celltwo"];
            
            
        }
        else{
            cell=[tableView dequeueReusableCellWithIdentifier:@"cellone"];
            
            
            
            NSString *strImg=[NSString stringWithFormat:@"http://friendsgrs.net46.net/%@",[[[[_userdata objectForKey:@"responce"]objectForKey:@"activitys"]objectAtIndex:indexPath.row]objectForKey:@"image"]];
            
            
            
            
            [cell.imgActivity sd_setImageWithURL:[NSURL URLWithString:strImg]
                   placeholderImage:[UIImage imageNamed:strImg]
                          completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL)
             {
                 cell.imgActivity .image=image;
             }];
            
            
        }
        
        //number of likes and setting image
        
        NSString *list =[[[[_userdata objectForKey:@"responce"]objectForKey:@"activitys"]objectAtIndex:indexPath.row]objectForKey:@"likersId"];
        int likes;
        if(![list isEqualToString:@""])
        {
        NSArray *listItems = [list componentsSeparatedByString:@","];
            likes=([listItems count]>1)?(int)[listItems count]:1;
            //chack that a user currently logged in allready like activity or not
            if ([listItems containsObject:[NSString stringWithFormat:@"%ld",(long)userId]]) {
                [cell.btnLike setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Like1" ofType:@"png"]] forState:UIControlStateNormal];
               
            }else
            {
                
            [cell.btnLike setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Like2" ofType:@"png"]] forState:UIControlStateNormal];
            }
        }else{
                likes=0;
            [cell.btnLike setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Like2" ofType:@"png"]] forState:UIControlStateNormal];
            }
        cell.lblLikes.text=[NSString stringWithFormat:@"(%lu)",(unsigned long)likes];
        
        //number of comments
        
        if ([[[[_userdata objectForKey:@"responce"]objectForKey:@"activitys"]objectAtIndex:indexPath.row]objectForKey:@"comments"]) {
            cell.lblComments.text=[NSString stringWithFormat:@"(%lu)",(unsigned long)[[[[[_userdata objectForKey:@"responce"]objectForKey:@"activitys"]objectAtIndex:indexPath.row]objectForKey:@"comments"]count]];
        }
        
       
        //setting discription of activity
        
        cell.lblDiscription.text=[[[[_userdata objectForKey:@"responce"]objectForKey:@"activitys"]objectAtIndex:indexPath.row]objectForKey:@"discription"];
        
        //setting user name
        
        NSString *fullname=[NSString stringWithFormat:@"%@ %@",[[[[_userdata objectForKey:@"responce"]objectForKey:@"activitys"]objectAtIndex:indexPath.row]objectForKey:@"fName"],[[[[_userdata objectForKey:@"responce"]objectForKey:@"activitys"]objectAtIndex:indexPath.row]objectForKey:@"lName"]];
        cell.lblUname.text=fullname;
        
        //setting a like button method
       
         [cell.btnLike addTarget:self action:@selector(btnLikeAction:) forControlEvents:UIControlEventTouchUpInside];
        cell.btnLike.tag=[[[[[_userdata objectForKey:@"responce"]objectForKey:@"activitys"]objectAtIndex:indexPath.row]objectForKey:@"id"] integerValue];
        
        //setting date
       
        cell.lblDate.text=[[[[_userdata objectForKey:@"responce"]objectForKey:@"activitys"]objectAtIndex:indexPath.row]objectForKey:@"date"];
        
        //setting user's profile pic
        
        cell.imgUser.layer.cornerRadius=20;
        if (![[[[[_userdata objectForKey:@"responce"]objectForKey:@"activitys"]objectAtIndex:indexPath.row]objectForKey:@"profilePic"] isEqualToString:@""] )
        {
            
            NSString *uImg=[NSString stringWithFormat:@"http://friendsgrs.net46.net/%@",[[[[_userdata objectForKey:@"responce"]objectForKey:@"activitys"]objectAtIndex:indexPath.row]objectForKey:@"profilePic"]];
            
            [cell.imgUser sd_setImageWithURL:[NSURL URLWithString:uImg]
                       placeholderImage:[UIImage imageNamed:uImg]
                              completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL)
             {
                 cell.imgUser.image=image;
             }];
            
        }else
        {
            cell.imgUser.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"user" ofType:@"png"]];
        }
    }else
    {
        cell=[tableView dequeueReusableCellWithIdentifier:@"emptyCell"];
        
    }
    
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSMutableDictionary *dicToSend=[[NSMutableDictionary alloc]initWithDictionary:[[[_userdata objectForKey:@"responce"]objectForKey:@"activitys"]objectAtIndex:indexPath.row]];
    
    
    
    comments *commentsClass=(comments*)[self.storyboard instantiateViewControllerWithIdentifier:@"comments"];
    
    commentsClass.dicMutactivityData = dicToSend;
    
    [self.navigationController pushViewController:commentsClass animated:YES];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
-(void)refreshHome
{
    
   
    _userdata=[[NSMutableDictionary alloc]init];
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    
    [dic setObject:[ NSNumber numberWithInt:(int)userId] forKey:@"uId"];
    [dic setObject:@"loadHome" forKey:@"action"];
    
    
    service1=[service new];
    [service1 FSPlzcallWebServiceWithURLString: @"FS-host" ArgumentsDictionary:dic];
    
    service1.serviceBlock=^(NSMutableDictionary* responce)
    {
        if(responce)
        {
            [_userdata setValuesForKeysWithDictionary:responce];
            NSLog(@"%@",_userdata);
            
            [_tblViewHome reloadData];
            [ref endRefreshing];
            [self.activityfirstLoad stopAnimating];
            [self.vcfirstLoad removeFromSuperview];
        }
        
    };
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
    // [self.navigationController setNavigationBarHidden:YES animated:NO];
}

-(void)viewDidLoad:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

-(void)btnLikeAction:(UIButton*)sender
{
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    
    [dic setObject:[NSNumber numberWithInt:(int)userId] forKey:@"uId"];
    [dic setObject:[NSNumber numberWithInt:(int)sender.tag] forKey:@"aId"];
    [dic setObject:@"likeActivity" forKey:@"action"];
    
    //service class for call web services
    service1=[service new];
    [service1 FSPlzcallWebServiceWithURLString: @"FS-host" ArgumentsDictionary:dic];
    
    //block that returns web service responce
    service1.serviceBlock=^(NSMutableDictionary* responce)
    {
        if(responce)
        {
            if ([[[responce objectForKey:@"responce"] objectForKey:@"status"] isEqualToString:@"success"]) {
                [sender setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Like1" ofType:@"png"]] forState:UIControlStateNormal];
                TVCellCustom *ce=(TVCellCustom*)[[sender superview] superview];
                UITableView *tb=(UITableView*)[[ce superview] superview];
                NSIndexPath *ip=(NSIndexPath*)[tb indexPathForCell:ce];
                //NSLog(@"%ld",ip.row);
                
                NSMutableString *str=[[[[_userdata objectForKey:@"responce"]objectForKey:@"activitys"]objectAtIndex:ip.row]objectForKey:@"likersId"];
                int likes2;
                NSArray *listItems = [str componentsSeparatedByString:@","];
                
                NSString *st=[NSString stringWithFormat:@",%ld",userId];
                [[[[_userdata objectForKey:@"responce"]objectForKey:@"activitys"]objectAtIndex:ip.row] setObject:[str stringByAppendingString:st] forKey:@"likersId"];
                
                str=[[[[_userdata objectForKey:@"responce"]objectForKey:@"activitys"]objectAtIndex:ip.row]objectForKey:@"likersId"];
                
                
                if(![str isEqualToString:@""])
                {
                    listItems = [str componentsSeparatedByString:@","];
                    likes2=([listItems count]>1)?(int)[listItems count]:1;
                }else
                {
                    likes2=1;
                }
                
                
                ce.lblLikes.text=[NSString stringWithFormat:@"(%d)",likes2];
                
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
