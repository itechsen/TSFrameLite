//
//  ZOInfomationNetworkHelper.m
//  ZolOnline
//
//  Created by chenyusen on 15/12/8.
//  Copyright © 2015年 chenyusen. All rights reserved.
//

#import "ZOInfomationNetworkHelper.h"

@implementation ZOInfomationNetworkHelper

+ (AFHTTPRequestOperation *)getInformationListWithParam:(ZOInfomationRequestModel *)param success:(void(^)(ZOInfomationResultModel *))success failure:(void(^)(NSError *error)) failure {
    return [TSNetWorkManager getWithUrl:nil param:param resultClass:[ZOInfomationResultModel class] success:success failure:failure];
}

@end
