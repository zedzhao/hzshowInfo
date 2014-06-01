//
//  HZDetailViewController.m
//  HZShow
//
//  Created by Kun on 13-9-11.
//  Copyright (c) 2013年 Kun. All rights reserved.
//

#import "HZGrandDetailVC.h"

@interface HZGrandDetailVC (){
    UIWebView *webView;
}

@end

@implementation HZGrandDetailVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    webView = [[UIWebView alloc] init];
    webView.frame = [self.view bounds];
	[self.view addSubview:webView];
    webView.scalesPageToFit = YES;
    
    UIScreenEdgePanGestureRecognizer *recognizer = [[UIScreenEdgePanGestureRecognizer alloc]	initWithTarget:self  action:@selector(back:)];
    [self.view addGestureRecognizer:recognizer];
    
    recognizer.edges = UIRectEdgeLeft;
	// Do any additional setup after loading the view.
}

- (void)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
//	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
//    [webView loadRequest:request];
}

-(void)viewDidAppear:(BOOL)animated
{
   	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    [webView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [super viewDidUnload];
}
@end
