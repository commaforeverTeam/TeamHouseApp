//
//  HouseSourceViewController.h
//  TeamHouseApp
//
//  Created by 刘法亮 on 13-12-31.
//  Copyright (c) 2013年 liu faliang. All rights reserved.
//

#import "CustomViewController.h"
#import "RequestHelp.h"
#import "ASIHTTPRequestDelegate.h"
@interface HouseSourceViewController : CustomViewController<DataRequestDelegate,ASIHTTPRequestDelegate,UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UIView *fatherView;
    IBOutlet UITableView *myTableView;
    
}
@end
