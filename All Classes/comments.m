//
//  comments.m
//  FriendsSpotFinal
//
//  Created by indianic on 06/08/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import "comments.h"

@interface comments ()

@end

@implementation comments

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadAllStuffs];
     self.navigationItem.hidesBackButton = YES;
    

    self.navigationItem.leftBarButtonItem =_backButtonBar;
    

       }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(self.dicMutactivityData){
        return ([[_dicMutactivityData objectForKey:@"comments"] count]+1);
    }else{
        return 0;}
}





- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float f;
    f=([[_dicMutactivityData objectForKey:@"comments"] count]>indexPath.row)?73:57;
    return f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    if ([[_dicMutactivityData objectForKey:@"comments"] count]>indexPath.row) {
        cell=[tableView dequeueReusableCellWithIdentifier:@"imageCommentsCell"];
        UIImageView *userImg=(UIImageView*)[cell viewWithTag:1];
        userImg.layer.cornerRadius=15;
        if (![[[[_dicMutactivityData objectForKey:@"comments"]objectAtIndex:indexPath.row] objectForKey:@"profilePic"] isEqualToString:@""] )
        {
            
            NSString *uImg=[NSString stringWithFormat:@"http://friendsgrs.net46.net/%@",[[[_dicMutactivityData objectForKey:@"comments"]objectAtIndex:indexPath.row] objectForKey:@"profilePic"]];
            
            [userImg sd_setImageWithURL:[NSURL URLWithString:uImg]
                       placeholderImage:[UIImage imageNamed:uImg]
                              completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL)
             {
                 userImg.image=image;
             }];
            
        }else
        {
            userImg.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"user" ofType:@"png"]];
        }
        
        UILabel *lbl=(UILabel*)[cell viewWithTag:4];
        lbl.text=[[[_dicMutactivityData objectForKey:@"comments"]objectAtIndex:indexPath.row]objectForKey:@"comment" ];
        
        //setting user name
        UILabel *lbl3=(UILabel*)[cell viewWithTag:2];
        NSString *fullname=[NSString stringWithFormat:@"%@ %@",[[[_dicMutactivityData objectForKey:@"comments"]objectAtIndex:indexPath.row]objectForKey:@"fName" ],[[[_dicMutactivityData objectForKey:@"comments"]objectAtIndex:indexPath.row]objectForKey:@"lName" ]];
        lbl3.text=fullname;
        
        //setting date
        UILabel *lbl4=(UILabel*)[cell viewWithTag:3];
        lbl4.text=[[[_dicMutactivityData objectForKey:@"comments"]objectAtIndex:indexPath.row]objectForKey:@"date" ];
    }else
    {
    cell=[tableView dequeueReusableCellWithIdentifier:@"emptyCell"];
    }
    
   
    return cell;
}



-(void)loadAllStuffs
{
    _viewNewComment.frame=CGRectMake(0,510,400,58);
    [self.view addSubview:_viewNewComment];
    
    
    NSLog(@"dic--%@",_dicMutactivityData);
    if([[_dicMutactivityData objectForKey:@"type"] isEqual:@"text"])
    {
        [_imgImageActivity removeFromSuperview];
    }else
    {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            UIImage *img=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://friendsgrs.net46.net/%@",[self.dicMutactivityData objectForKey:@"image"] ]]]];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                _imgImageActivity.image=img;
            });
        });
        
    }
    
    
    _imgUserPic.layer.cornerRadius=20;
    if (![[_dicMutactivityData objectForKey:@"profilePic"] isEqualToString:@""] )
    {
        
        NSString *uImg=[NSString stringWithFormat:@"http://friendsgrs.net46.net/%@",[_dicMutactivityData objectForKey:@"profilePic"]];
        
        [_imgUserPic sd_setImageWithURL:[NSURL URLWithString:uImg]
                   placeholderImage:[UIImage imageNamed:uImg]
                          completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL)
         {
             _imgUserPic.image=image;
         }];
        
    }else
    {
        _imgUserPic.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"user" ofType:@"png"]];
    }
    
    NSString *fullname=[NSString stringWithFormat:@"%@ %@",[_dicMutactivityData objectForKey:@"fName"],[_dicMutactivityData objectForKey:@"lName"]];
    _lblUserName.text=fullname;
    _lblDate.text=[_dicMutactivityData objectForKey:@"date"];
    //number of likes
   
    
    NSString *list =[_dicMutactivityData objectForKey:@"likersId"];
    NSArray *listItems = [list componentsSeparatedByString:@","];
    int likes=([listItems count]>1)?(int)[listItems count]:0;
    _lblActivityLikes.text=[NSString stringWithFormat:@"(%lu)",(unsigned long)likes];
    _lblImageDiscription.text=[_dicMutactivityData objectForKey:@"discription"];
    
    
}
- (IBAction)backBar:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
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

