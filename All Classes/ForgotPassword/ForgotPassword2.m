//
//  ForgotPassword2.m
//  FriendsSpotFinal
//
//  Created by indianic on 21/07/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import "ForgotPassword2.h"


@interface ForgotPassword2 ()
@property (weak, nonatomic) IBOutlet UIView *subviewReset;


@end

@implementation ForgotPassword2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.subviewReset.layer.cornerRadius=10;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)ResetClick:(id)sender {
    
    self.subviewReset.alpha = 0.0;
    [UIView animateWithDuration:1.0 animations:^{
            self.subviewReset.frame=CGRectMake(8,141,304,327);
            self.subviewReset.alpha=1.0;
    }];
    
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
