//
//  TSViewController.m
//  TSFrameLiteDemo
//
//  Created by chenyusen on 15/12/9.
//  Copyright © 2015年 chenyusen. All rights reserved.
//

#import "TSViewController.h"

@interface TSViewController ()

@end

@implementation TSViewController

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary {
    self = [super init];
    if (self) {
        self.canGesturePop = YES;
    }
    return self;
}

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = self.canGesturePop;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
