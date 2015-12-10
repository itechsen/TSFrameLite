//
//  TSTableViewController.m
//  TSFrameLiteDemo
//
//  Created by chenyusen on 15/12/9.
//  Copyright © 2015年 chenyusen. All rights reserved.
//

#import "TSTableViewController.h"

@interface TSTableViewController ()
@property(nonatomic, copy) FooterWithRefreshingBlock footerRefreshingBlock;
@property(nonatomic, copy) HeaderWithRefreshingBlock headerRefreshingBlock;

@end

@implementation TSTableViewController
#pragma mark - Life Cycle

- (void)dealloc {
    _tableView.delegate = nil;
    _tableView.dataSource = nil;
    _tableView = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}



- (NSMutableArray<TSTableViewCellLayout *> *)tableViewItems {
    if (!_tableViewItems) {
        _tableViewItems = [NSMutableArray array];
    }
    return _tableViewItems;
}
/** 需要集成上拉刷新 */
- (void)needPullUpRefreshView {
    @weakify(self);
    self.tableView.mj_footer = [NSClassFromString(self.customRefreshFooter?NSStringFromClass([self.customRefreshFooter class]):@"MJRefreshAutoNormalFooter") footerWithRefreshingBlock:^{
        @strongify(self);
        if (self.footerRefreshingBlock) {
            self.footerRefreshingBlock(self.tableView.mj_footer);
        }
    }];
}

/** 需要集成下拉刷新 */
- (void)needPullDownRefreshView {
    @weakify(self);
    self.tableView.mj_header = [NSClassFromString(self.customRefreshHeader?NSStringFromClass([self.customRefreshHeader class]):@"MJRefreshNormalHeader") headerWithRefreshingBlock:^{
        @strongify(self);
        if (self.headerRefreshingBlock) {
            self.headerRefreshingBlock(self.tableView.mj_header);
        }
    }];
}

/** 自定义下拉刷新控件 */
- (MJRefreshHeader *)customRefreshHeader {
    return nil;
}

/** 自定义上拉刷新控件 */
- (MJRefreshFooter *)customRefreshFooter {
    return nil;
}

- (void)footerWithRefreshingBlock:(FooterWithRefreshingBlock)footerWithRefreshingBlock {
    self.footerRefreshingBlock = footerWithRefreshingBlock;
}

- (void)headerWithRefreshingBlock:(HeaderWithRefreshingBlock)headerWithRefreshingBlock {
    self.headerRefreshingBlock = headerWithRefreshingBlock;
}

- (void)stopRefreshing {
    [self stopFooterRefreshing];
    [self stopHeaderRefreshing];
}

- (void)startHeaderRefreshing {
    if (![self.tableView.mj_header isRefreshing]) {
        [self.tableView.mj_header beginRefreshing];
    }
}
- (void)stopHeaderRefreshing {
    if ([self.tableView.mj_header isRefreshing]) {
        [self.tableView.mj_header endRefreshing];
    }
}

- (void)startFooterRefreshing {
    if (![self.tableView.mj_footer isRefreshing]) {
        [self.tableView.mj_footer beginRefreshing];
    }
}
- (void)stopFooterRefreshing {
    if ([self.tableView.mj_footer isRefreshing]) {
        [self.tableView.mj_footer endRefreshing];
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableViewItems.count;
}

@end
