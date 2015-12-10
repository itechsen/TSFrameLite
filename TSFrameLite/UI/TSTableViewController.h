//
//  TSTableViewController.h
//  TSFrameLiteDemo
//
//  Created by chenyusen on 15/12/9.
//  Copyright © 2015年 chenyusen. All rights reserved.
//

#import "TSModelViewController.h"
#import <MJRefresh.h>


typedef void (^FooterWithRefreshingBlock)(MJRefreshFooter *refreshFooter);
typedef void (^HeaderWithRefreshingBlock)(MJRefreshHeader *refreshHeader);

@interface TSTableViewController : TSModelViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) NSMutableArray *tableViewItems;

/** 需要集成上拉刷新 */
- (void)needPullUpRefreshView;

/** 需要集成下拉刷新 */
- (void)needPullDownRefreshView;

/** 上拉刷新block */
- (void)footerWithRefreshingBlock:(FooterWithRefreshingBlock)footerWithRefreshingBlock;

/** 下拉刷新block */
- (void)headerWithRefreshingBlock:(HeaderWithRefreshingBlock)headerWithRefreshingBlock;

/** 停止刷新 */
- (void)stopRefreshing;

/** 开始下拉刷新 */
- (void)startHeaderRefreshing;
/** 结束下拉刷新 */
- (void)stopHeaderRefreshing;
/** 开始上拉刷新 */
- (void)startFooterRefreshing;
/** 结束上拉刷新 */
- (void)stopFooterRefreshing;

/** 自定义下拉刷新控件 */
- (MJRefreshHeader *)customRefreshHeader;

/** 自定义上拉刷新控件 */
- (MJRefreshFooter *)customRefreshFooter;
@end
