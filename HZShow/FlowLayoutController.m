//
//  FlowLayoutController.m
//  HZShow
//
//  Created by Kun on 13-7-25.
//  Copyright (c) 2013年 Kun. All rights reserved.
//

#import "FlowLayoutController.h"

#define CELL_WIDTH 130
#define CELL_HEIGHT 185

@implementation FlowLayoutController

-(id) init{
    self = [super init];
    if (self) {
		self.itemSize = CGSizeMake(CELL_WIDTH, CELL_HEIGHT);
        self.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
        self.scrollDirection  = UICollectionViewScrollDirectionVertical	;
        self.minimumInteritemSpacing = 20;
    }
    return self;
}

@end
