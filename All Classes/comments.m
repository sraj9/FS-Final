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
    
    _lblImageDiscription.text=[_dicMutactivityData objectForKey:@"discription"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(self.dicMutactivityData){
        return [[_dicMutactivityData objectForKey:@"comments"] count];
    }else{
        return 0;}
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"imageCommentsCell"];
    
    UILabel *lbl=(UILabel*)[cell viewWithTag:4];
    lbl.text=[[[_dicMutactivityData objectForKey:@"comments"]objectAtIndex:indexPath.row]objectForKey:@"comment" ];
   
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

- (IBAction)btnBackHandler:(id)sender {
   
    [self.navigationController popViewControllerAnimated:YES];
}
@end
