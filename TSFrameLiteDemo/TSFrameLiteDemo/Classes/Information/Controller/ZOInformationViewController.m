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
#import "ZOInformationTableViewCell.h"

@implementation ZOInformationViewController





#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];

    [self needPullDownRefreshView];
    [self needPullUpRefreshView];
    
    
    self.tableView.rowHeight = 87.0;
    
    
    
    [self.tableView registerClass:[ZOInformationTableViewCell class] forCellReuseIdentifier:NSStringFromClass([ZOInformationTableViewCell class])];
    
    
    [self headerWithRefreshingBlock:^(MJRefreshHeader *refreshHeader) {
        ZOInfomationRequestModel *param = [[ZOInfomationRequestModel alloc] init];
        param.v = @"4.0";
        param.class_id = @"0";
        param.isReviewing = @"NO";
        ZOInformationTableViewCellLayout *layout = (ZOInformationTableViewCellLayout *)self.tableViewItems.firstObject;
        if (layout) {
            param.last_time = [layout.item.sdate stringWithFormat:@"yyyy-MM-dd HH:mm"];
        }
        param.page = @"1";
        [ZOInfomationNetworkHelper getInformationListWithParam:param success:^(ZOInfomationResultModel *result) {
            for (ZOInfomationResultListModel *resultModel in result.list) {
                ZOInformationTableViewCellLayout *layout = [[ZOInformationTableViewCellLayout alloc] init];
                layout.item = resultModel;
                [self.tableViewItems addObject:layout];
            }
            [self.tableView reloadData];
            [self stopRefreshing];
        } failure:^(NSError *error) {
            
        }];
    }];
    
    [self startHeaderRefreshing];
    
    
    
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 10, 0, 10);
}


#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZOInformationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ZOInformationTableViewCell class])];
    cell.layout = self.tableViewItems[indexPath.row];
    return cell;
    
}

#pragma mark - UITableViewDelegate
@end
