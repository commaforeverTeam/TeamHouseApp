//
//  HouseCell.h
//  TeamHouseApp
//
//  Created by 刘法亮 on 14-1-7.
//  Copyright (c) 2014年 liu faliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HouseCell : UIViewController
{
    IBOutlet UILabel *titleLab;
    IBOutlet UILabel *contentLab;
    IBOutlet UILabel *houseTypeLab;
    IBOutlet UILabel *rentPriceLab;
    
}
-(void)setCellValue :(NSDictionary *)dict;
@end
