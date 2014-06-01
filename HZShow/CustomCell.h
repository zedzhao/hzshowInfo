//
//  CustomCell.h
//  HZShow
//
//  Created by Kun on 13-7-25.
//  Copyright (c) 2013年 Kun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UICollectionViewCell
@property (nonatomic, strong) UIImage *img;
@property (nonatomic, copy) NSString *showName;
@property (nonatomic, copy) NSString *showDate;

@property (nonatomic, strong) UIImageView *imageView;

@end
