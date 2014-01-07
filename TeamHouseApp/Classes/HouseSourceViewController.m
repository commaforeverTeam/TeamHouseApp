//
//  HouseSourceViewController.m
//  TeamHouseApp
//
//  Created by 刘法亮 on 13-12-31.
//  Copyright (c) 2013年 liu faliang. All rights reserved.
//

#import "HouseSourceViewController.h"
#import "JSONKit.h"
#import "Contents.h"
#import "ASIFormDataRequest.h"
#import "HouseCell.h"
@interface HouseSourceViewController ()
{
    RequestHelp *dataRequest;
    NSMutableArray *dataArr;
}
@end

@implementation HouseSourceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        dataRequest = [[RequestHelp alloc]init];
        dataArr = [[NSMutableArray alloc]initWithCapacity:10];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"LoadView");
    
    dataRequest.delegate = self;
    
    NSLog(@"房源");
    
    
    //个人中心接口   19293
    
    
    
    [self requestData];
    
}


#pragma mark- 接口请求   数据返回

-(void)requestData
{
    NSMutableDictionary *contentDic = [[NSMutableDictionary alloc] init];
    [contentDic setObject:@"5510" forKey: @"userid"];
    [contentDic setObject:@"sjht1" forKey: @"password"];
    
    
    
    
    NSMutableDictionary *sendDic2 = [[NSMutableDictionary alloc]initWithCapacity:10];
    [sendDic2 setObject:@"20" forKey: @"pagesize"];
    [sendDic2 setObject:@"1" forKey: @"pageno"];
    [sendDic2 setObject:@"116.41004950566" forKey: @"pos_y"];
    [sendDic2 setObject:@"39.916979519873" forKey: @"pos_x"];
    
    
    NSMutableDictionary *sendDic = [[NSMutableDictionary alloc]initWithCapacity:10];
    [sendDic setObject:contentDic forKey:@"userkey"];
    [sendDic setObject:sendDic2 forKey:@"data"];
    NSString *sendjsonString = [sendDic JSONString];
    
    
    [dataRequest setPostData:sendjsonString];
    [dataRequest connectionWithAddress:@"http://115.28.49.147:8080/fang/doJsonPageHouse.action"];
}

-(void)requestFinished:(ASIHTTPRequest *)request
{
    NSLog(@"%@",[request responseString]);
}


-(void)connectionFinished:(RequestHelp *)request backString:(NSString *)backXmlString
{
    NSLog(@"backXmlString %@",backXmlString);
    NSDictionary *temdic = [backXmlString objectFromJSONString];
    NSLog(@"temdic %@",temdic);
    
}
-(void)connectionFailed
{
    
}

#pragma mark- UITableViewDataSource,UITableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}
-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    HouseCell *mcell = nil;
    if (mcell == nil) {
        mcell = [[HouseCell alloc]initWithNibName:@"HouseCell" bundle:nil];
    }
    cell = (UITableViewCell *)mcell.view;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [mcell setCellValue:[dataArr objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
