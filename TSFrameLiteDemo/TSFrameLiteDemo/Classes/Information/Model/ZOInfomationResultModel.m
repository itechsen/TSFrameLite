//
//  ZOInfomationResultModel.m
//  ZolOnline
//
//  Created by chenyusen on 15/12/8.
//  Copyright © 2015年 chenyusen. All rights reserved.
//

#import "ZOInfomationResultModel.h"
#import <MJExtension.h>

@implementation ZOInfomationResultListModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"ID":@"id"
             };
}

@end

@implementation ZOInfomationResultPicsModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"ID":@"id"
             };
}

@end


@implementation ZOInfomationResultModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"list":[ZOInfomationResultListModel class],
             @"pics":[ZOInfomationResultPicsModel class],
             };
}

@end
