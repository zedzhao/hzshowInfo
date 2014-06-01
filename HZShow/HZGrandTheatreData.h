//
//  HZGrandTheatreData.h
//  HZShow
//
//  Created by Kun on 14-3-16.
//  Copyright (c) 2014年 Kun. All rights reserved.
//

#import <Foundation/Foundation.h>

#define HZ_GRAND_THEATRE @"http://www.hzdjy.com/"
#define HZ_THEATRE @"http://www.hzjy.cn/"

@interface HZGrandTheatreData : NSObject

+ (NSMutableArray*) getShowData;
+ (NSMutableArray*) getHZTheatreData;
@end
