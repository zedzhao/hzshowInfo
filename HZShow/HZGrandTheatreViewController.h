//
//  HZGrandTheatreViewController.h
//  HZShow
//
//  Created by Kun on 14-3-28.
//  Copyright (c) 2014年 Kun. All rights reserved.
//

#import "HZViewController.h"

@interface HZGrandTheatreViewController : HZViewController <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
