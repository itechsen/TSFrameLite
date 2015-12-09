//
//  ZOInformationViewController.m
//  ZolOnline
//
//  Created by chenyusen on 15/12/8.
//  Copyright © 2015年 chenyusen. All rights reserved.
//

#import "ZOInformationViewController.h"
#import "ZOInfomationNetworkHelper.h"
#import <NSDate+YYAdd.h>

@implementation ZOInformationViewController


#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    self.title = @"资讯";
    
    ZOInfomationRequestModel *param = [[ZOInfomationRequestModel alloc] init];
    param.v = @"4.0";
    param.class_id = @"0";
//    param.last_time = @"2015-12-08 16:18";
    param.page = @"1";
    
    [ZOInfomationNetworkHelper getInformationListWithParam:param success:^(ZOInfomationResultModel *result) {
        NSLog(@"%@",result);
    } failure:^(NSError *error) {
        
    }];
}



@end
