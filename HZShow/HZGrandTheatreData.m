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
        HZGrandTheatre *theTheatre = [[HZGrandTheatre alloc] init];
        [resultData addObject:theTheatre];
        TFHppleElement *pChild = element.children[1];
        theTheatre.showName = pChild.text;
		theTheatre.linkUrl = [NSString stringWithFormat:@"%@/%@", HZ_THEATRE,[pChild objectForKey:@"href"]];
    }
    
    NSString *imageQueryString = @"//img[@class='ijmimg']";
    NSArray *imgNodes = [theatreParser searchWithXPathQuery:imageQueryString];
    
    for (TFHppleElement *element in imgNodes)
    {
        HZGrandTheatre *theTheatre = [resultData objectAtIndex:[imgNodes indexOfObject:element]];
		theTheatre.imgUrl =[NSString stringWithFormat:@"%@/%@", HZ_THEATRE, [element objectForKey:@"src"]];
    }
    
    NSString *otherQueryString = @"//table[@height='120']";
    NSArray *otherNodes = [theatreParser searchWithXPathQuery:otherQueryString];
    for (TFHppleElement * element in otherNodes){
        HZGrandTheatre *theTheatre = [resultData objectAtIndex:[otherNodes indexOfObject:element]];
        TFHppleElement *aChild = element.children[1];
		theTheatre.showDate = [aChild firstChildWithTagName:@"td"].text;
        TFHppleElement *bChild = element.children[3];
		theTheatre.location = [bChild firstChildWithTagName:@"td"].text;
        TFHppleElement *cChild = element.children[5];
        theTheatre.price = [cChild firstChildWithTagName:@"td"].text;
        
    }
    return resultData;
}


@end
