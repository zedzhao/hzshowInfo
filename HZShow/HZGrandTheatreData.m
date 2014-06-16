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
    NSString *showDataXpathQueryString = @"//div[@class='bd']/ul/li";
    
    NSArray *HZGrandTheatreNodes = [HZGrandTheatreParser searchWithXPathQuery:showDataXpathQueryString];
    
    NSMutableArray *newTheatre = [[NSMutableArray alloc] initWithCapacity:0];
    
    //get show name and date;
    for(TFHppleElement *element in HZGrandTheatreNodes){
        @autoreleasepool {
            
        HZGrandTheatre *theTheatre = [[HZGrandTheatre alloc] init];
        assert(element.children.count >= 3);
        TFHppleElement *infoChild = element.firstChild;
        TFHppleElement *dateChild = element.children[1];
        TFHppleElement *priceChild = element.children[2];
        
        theTheatre.linkUrl = [NSString stringWithFormat:@"%@/%@", HZ_GRAND_THEATRE,[infoChild objectForKey:@"href"]]; // page url
        theTheatre.imgUrl = [NSString stringWithFormat:@"%@/%@", HZ_GRAND_THEATRE,[infoChild.firstChild objectForKey:@"src"]]; //img url
		
        TFHppleElement *nChild = infoChild.children[1];
        theTheatre.showName = nChild.firstChild.text; // show name
        
        theTheatre.showDate = dateChild.firstChild.text; // show date
        theTheatre.price = priceChild.text; // price
        [newTheatre addObject:theTheatre];
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
