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
    
    NSLog(@"dic--%@",_dicMutactivityData);
    if([[_dicMutactivityData objectForKey:@"type"] isEqual:@"text"])
    {
        [_imgImageActivity removeFromSuperview];
    }else
    {
        _imgImageActivity.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://friendsgrs.net46.net/%@",[_dicMutactivityData objectForKey:@"image"] ]]]];
        
    
    }
    
    _lblImageDiscription.text=[_dicMutactivityData objectForKey:@"discription"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"commentCell"];
    
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
