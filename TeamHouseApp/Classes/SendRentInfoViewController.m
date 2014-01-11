//
//  SendRentInfoViewController.m
//  TeamHouseApp
//
//  Created by newhr mac mini on 14-1-11.
//  Copyright (c) 2014年 liu faliang. All rights reserved.
//

#import "SendRentInfoViewController.h"
#import "JSONKit.h"
#import "Contents.h"
#import "ASIFormDataRequest.h"
@interface SendRentInfoViewController ()
{
    RequestHelp *dataRequest;
}
@end

@implementation SendRentInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        dataRequest = [[RequestHelp alloc]init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    dataRequest.delegate = self;
    
    NSLog(@"出租发布");
    
    
    //
    
    NSMutableDictionary *contentDic = [[NSMutableDictionary alloc] init];
    [contentDic setObject:@"19293" forKey: @"userid"];
    [contentDic setObject:@"yssd" forKey: @"password"];
    
    if(0)
    {
    //出租发布
    NSMutableDictionary *sendDic2 = [[NSMutableDictionary alloc]initWithCapacity:10];
    [sendDic2 setObject:@"公寓" forKey:@"house_type"];
    [sendDic2 setObject:@"东城区" forKey: @"area_local"];
    [sendDic2 setObject:@"万科盛景" forKey: @"community"];
    [sendDic2 setObject:@"1" forKey: @"room"];
    [sendDic2 setObject:@"2" forKey: @"hall"];
    [sendDic2 setObject:@"1" forKey: @"toilet"];
    [sendDic2 setObject:@"3" forKey: @"building"];
    [sendDic2 setObject:@"7" forKey: @"alllayer"];
    [sendDic2 setObject:@"60" forKey: @"area"];
    [sendDic2 setObject:@"3000" forKey: @"house_mny"];
    [sendDic2 setObject:@"季付" forKey: @"pay_type"];
    [sendDic2 setObject:@"1个月" forKey: @"deposit_type"];
    [sendDic2 setObject:@"精装" forKey: @"decorate_status"];
    [sendDic2 setObject:@"电视" forKey: @"house_facility"];
    [sendDic2 setObject:@"良好" forKey: @"traffic_status"];
    [sendDic2 setObject:@"无" forKey: @"memo"];
    [sendDic2 setObject:@"林先生" forKey: @"linkpsn"];
    [sendDic2 setObject:@"81231278" forKey: @"tel"];
    [sendDic2 setObject:@"13545877546" forKey: @"phone"];
    [sendDic2 setObject:@"116.41004950566" forKey: @"pos_x"];
    [sendDic2 setObject:@"39.916979519873" forKey: @"pos_y"];
    [sendDic2 setObject:@"5天" forKey: @"validity_day"];
        NSMutableDictionary *sendDic = [[NSMutableDictionary alloc]initWithCapacity:10];
        [sendDic setObject:contentDic forKey:@"userkey"];
        [sendDic setObject:sendDic2 forKey:@"data"];
        NSString *sendjsonString = [sendDic JSONString];
        
        [dataRequest setPostData:sendjsonString];
        [dataRequest connectionWithAddress:@"http://115.28.49.147:8080/fang/doJsonSaveRentHouseInfo.action"];
    }else
    {
    //出售发布
    NSMutableDictionary *sendDic2 = [[NSMutableDictionary alloc]initWithCapacity:10];
    [sendDic2 setObject:@"公寓" forKey:@"house_type"];
    [sendDic2 setObject:@"东城区" forKey: @"area_local"];
    [sendDic2 setObject:@"万科盛景" forKey: @"community"];
    [sendDic2 setObject:@"1" forKey: @"room"];
    [sendDic2 setObject:@"2" forKey: @"hall"];
    [sendDic2 setObject:@"1" forKey: @"toilet"];
    [sendDic2 setObject:@"3" forKey: @"building"];
    [sendDic2 setObject:@"7" forKey: @"alllayer"];
    [sendDic2 setObject:@"60" forKey: @"area"];
    [sendDic2 setObject:@"5000000" forKey: @"house_mny"];
    [sendDic2 setObject:@"产权" forKey: @"prod_power"];
    [sendDic2 setObject:@"南北向" forKey: @"house_direction"];
    [sendDic2 setObject:@"20年" forKey: @"building_age"];
    [sendDic2 setObject:@"电视" forKey: @"house_facility"];
    [sendDic2 setObject:@"良好" forKey: @"traffic_status"];
    [sendDic2 setObject:@"无" forKey: @"memo"];
    [sendDic2 setObject:@"林先生" forKey: @"linkpsn"];
    [sendDic2 setObject:@"81231278" forKey: @"tel"];
    [sendDic2 setObject:@"13545877546" forKey: @"phone"];
    [sendDic2 setObject:@"116.41004950566" forKey: @"pos_x"];
    [sendDic2 setObject:@"39.916979519873" forKey: @"pos_y"];
    [sendDic2 setObject:@"5天" forKey: @"validity_day"];
    
    NSMutableDictionary *sendDic = [[NSMutableDictionary alloc]initWithCapacity:10];
    [sendDic setObject:contentDic forKey:@"userkey"];
    [sendDic setObject:sendDic2 forKey:@"data"];
    NSString *sendjsonString = [sendDic JSONString];
    
    [dataRequest setPostData:sendjsonString];
    [dataRequest connectionWithAddress:@"http://115.28.49.147:8080/fang/doJsonSaveSellHouseInfo.action"];
    }
    // Do any additional setup after loading the view from its nib.
}

-(void)requestFinished:(ASIHTTPRequest *)request
{
    NSLog(@"!!!%@",[request responseString]);
}


-(void)connectionFinished:(RequestHelp *)request backString:(NSString *)backXmlString
{
    NSLog(@"backXmlString %@",backXmlString);
    NSDictionary *temdic = [backXmlString objectFromJSONString];
    NSLog(@"temdic %@",temdic);
    
}
-(void)connectionFailed
{
    NSLog(@"connectionFailed");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
