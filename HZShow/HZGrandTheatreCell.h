//
//  HZGrandTheatreCell.h
//  HZShow
//
//  Created by Kun on 14-3-28.
//  Copyright (c) 2014年 Kun. All rights reserved.
//

#import <UIKit/UIKit.h>

static CGFloat const kCEllHeight = 80;

@interface HZGrandTheatreCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *showImage;
@property (weak, nonatomic) IBOutlet UILabel *showName;
@property (weak, nonatomic) IBOutlet UILabel *showDate;

@end
