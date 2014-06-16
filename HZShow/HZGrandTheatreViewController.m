//
//  HZGrandTheatreViewController.m
//  HZShow
//
//  Created by Kun on 14-3-28.
//  Copyright (c) 2014年 Kun. All rights reserved.
//

#import "HZGrandTheatreViewController.h"
#import "HZGrandTheatreCell.h"
#import "HZGrandTheatreData.h"
#import "HZGrandTheatre.h"
#import "HZGrandDetailVC.h"
#import "SDWebImage/UIImageView+WebCache.h"

#define CELL_ID @"HZGrandTheatreCell"

@interface HZGrandTheatreViewController (){
    NSMutableArray *_theatreData;
}

@end

@implementation HZGrandTheatreViewController

@synthesize tableView = _tableView;

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
    // Do any additional setup after loading the view.
//    _theatreData = [HZGrandTheatreData getShowData];
    _theatreData = [HZGrandTheatreData getHZTheatreData];
    [_tableView registerNib:[UINib nibWithNibName:@"HZGrandTheatreCell" bundle:nil] forCellReuseIdentifier:CELL_ID];
    
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - table view delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_theatreData count];
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kCEllHeight;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HZGrandTheatreCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID forIndexPath:indexPath];
    if (!cell ) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HZGrandTheatreCell" owner:nil options:nil] firstObject];
    }
    HZGrandTheatre *theatreData = [_theatreData objectAtIndex:indexPath.row];
 
    [cell.showImage setImageWithURL:[NSURL URLWithString:theatreData.imgUrl]];
    cell.showName.text = theatreData.showName;
    cell.showDate.text = theatreData.showDate;
    
    [cell.showName sizeToFit];
    [cell.showDate sizeToFit];
//    [cell.showImage sizeToFit];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HZGrandDetailVC *detailVC = [[HZGrandDetailVC alloc] init];
    HZGrandTheatre *theatreData =[_theatreData objectAtIndex:indexPath.row];
    detailVC.url = theatreData.linkUrl;
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
