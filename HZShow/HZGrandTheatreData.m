//
//  HZGrandTheatreData.m
//  HZShow
//
//  Created by Kun on 14-3-16.
//  Copyright (c) 2014年 Kun. All rights reserved.
//

#import "HZGrandTheatreData.h"
#import "HZGrandTheatre.h"
#import "TFHpple.h"

@implementation HZGrandTheatreData

+ (NSMutableArray*) getShowData
{
    NSURL *theatreURL = [NSURL URLWithString:@"http://www.hzdjy.com/"];
    NSData *theatreHtmlData = [NSData dataWithContentsOfURL:theatreURL];
    
    
    if (theatreHtmlData == nil) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Newwork Error" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles: nil];
        [alert show];
    }
    
    TFHpple *HZGrandTheatreParser = [TFHpple hppleWithHTMLData:theatreHtmlData];
    NSString *showDataXpathQueryString = @"//div[@class='touming']";
    
    NSArray *HZGrandTheatreNodes = [HZGrandTheatreParser searchWithXPathQuery:showDataXpathQueryString];
    
    NSMutableArray *newTheatre = [[NSMutableArray alloc] initWithCapacity:0];
    
    //get show name and date;
    for(TFHppleElement *element in HZGrandTheatreNodes){
        HZGrandTheatre *theTheatre = [[HZGrandTheatre alloc] init];
        [newTheatre addObject:theTheatre];
        
        for(TFHppleElement *child in element.children){
            if ([child.tagName isEqualToString:@"p"]) {
                theTheatre.showName = [[child firstChild] content];
                
            }
            
            if ([child.tagName isEqualToString:@"span"]) {
                theTheatre.showDate = [[child firstChild] content];
            }
        }
    }
    
    //get show pic url
    NSString *showImageUrlXpathQueryString = @"//div[@class='list_list']/a/img";
    NSArray *HZGrandTheatrePicUrlNodes = [HZGrandTheatreParser searchWithXPathQuery:showImageUrlXpathQueryString];
    int index = 0;
    for(TFHppleElement *element in HZGrandTheatrePicUrlNodes){
        if ([element.tagName isEqualToString:@"img"]) {
            HZGrandTheatre *theTheatre = [newTheatre objectAtIndex:index++];
            theTheatre.imgUrl = [HZ_GRAND_THEATRE stringByAppendingString:[element objectForKey:@"src"]];
        }
    }
    
    NSString *showDetailUrlXpathQueryString = @"//div[@class='list_list']/a";
    index = 0;
    NSArray *HZGrandTheatreDetailUrlNodes = [HZGrandTheatreParser searchWithXPathQuery:showDetailUrlXpathQueryString];
    
    for (TFHppleElement *element in HZGrandTheatreDetailUrlNodes){
        if ([element.tagName isEqualToString:@"a"]) {
            HZGrandTheatre *theTheatre = [newTheatre objectAtIndex:index++];
            theTheatre.linkUrl = [HZ_GRAND_THEATRE stringByAppendingString:[element objectForKey:@"href"]];
        }
    }
    
    return  newTheatre;
    
}

+ (NSMutableArray*) getHZTheatreData
{
    NSURL *theatreURL = [NSURL URLWithString:HZ_THEATRE];
    NSData *theatreHtmlData = [NSData dataWithContentsOfURL:theatreURL];
    
    
    if (theatreHtmlData == nil) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Newwork Error" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles: nil];
        [alert show];
    }
    
    TFHpple *theatreParser = [TFHpple hppleWithHTMLData:theatreHtmlData];
    NSString *showDataXpathQueryString = @"//td[@class='zbtitle']";
	NSArray *nodes = [theatreParser searchWithXPathQuery:showDataXpathQueryString];
    NSMutableArray *resultData = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (TFHppleElement *element in nodes){
//        NSLog(@"%element: @", element.tagName);
        for (TFHppleElement *child in element.children)
        {
            if ([child.tagName isEqualToString:@"a"]) {
                NSLog(@"%@", child.firstChild.content);
                NSLog(@"%@", [child objectForKey:@"href"]);
            }
//            NSLog(@"child: %@", child.tagName);
        }
    }
    
    NSString *imageQueryString = @"//img[@class='ijmimg']";
    NSArray *imgNodes = [theatreParser searchWithXPathQuery:imageQueryString];
    
    for (TFHppleElement *element in imgNodes)
    {
    	NSLog(@"%@", [element objectForKey:@"src"]);
        NSLog(@"%@", element);
    }
    return resultData;
}


@end
