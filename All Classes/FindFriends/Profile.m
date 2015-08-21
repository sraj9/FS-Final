//
//  Profile.m
//  FriendsSpotFinal
//
//  Created by indianic on 20/08/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import "Profile.h"

@interface Profile ()

@end

@implementation Profile

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"profile=%@",_profileDetails);
    [self userProfile];
   
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)userProfile{
    
    _lblName.text=[_profileDetails  objectForKey:@"fName"];
    _lblSirname.text=[_profileDetails  objectForKey:@"lName"];
    _lblGender.text=[_profileDetails objectForKey:@"gender"];
    _lblCity.text=[_profileDetails objectForKey:@"city"];
    _lblState.text=[_profileDetails objectForKey:@"state"];
    _lblCountry.text=[_profileDetails objectForKey:@"country"];
    _lblContact.text=[_profileDetails objectForKey:@"contact"];
    
   
    
    
    if (![[_profileDetails objectForKey:@"profilePic"] isEqualToString:@""]) {
        _imgUserProfle.layer.cornerRadius=30;
        
        NSString *strImg=[NSString stringWithFormat:@"http://friendsgrs.net46.net/%@",
                          [_profileDetails objectForKey:@"profilePic"]];
        
        
        [_imgUserProfle sd_setImageWithURL:[NSURL URLWithString:strImg]
                placeholderImage:[UIImage imageNamed:strImg]
                       completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL)
         {
             _imgUserProfle.image=image;
         }];

        
        
        
        
           }else{
        
        
       _imgUserProfle.image= [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"user" ofType:@"png"]];
        
        
    }

    
    
    
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
