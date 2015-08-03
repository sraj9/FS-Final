//
//  MesaageVC.h
//  FriendsSpotFinal
//
//  Created by indianic on 30/07/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MesaageVC : UIViewController <UITableViewDataSource,UITableViewDelegate>
{

}

@property (weak, nonatomic) IBOutlet UITableView *TableView;

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet UIButton *btnSendclicked;

@end
