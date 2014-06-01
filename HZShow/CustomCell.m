//
//  CustomCell.m
//  HZShow
//
//  Created by Kun on 13-7-25.
//  Copyright (c) 2013年 Kun. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell
{
//    UIImage *image;
//    UILabel *label;
}

@synthesize img = _img, showDate=_showDate, showName=_showName;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.imageView = [[UIImageView alloc] initWithFrame:[self bounds]];
        
      	[self setBackgroundView:self.imageView];
    }
    return self;
}

-(void) setImg:(UIImage *)img{
    
    
    self.imageView = [[UIImageView alloc] initWithImage:img];
    [self setBackgroundView:self.imageView];
    [self setNeedsDisplay];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
