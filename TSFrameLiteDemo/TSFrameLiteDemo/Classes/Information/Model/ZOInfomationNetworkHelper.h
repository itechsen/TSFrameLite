//
//  ZOInfomationNetworkHelper.h
//  ZolOnline
//
//  Created by chenyusen on 15/12/8.
//  Copyright © 2015年 chenyusen. All rights reserved.
//

#import "TSNetWorkManager.h"
#import "ZOInfomationRequestModel.h"
#import "ZOInfomationResultModel.h"
@interface ZOInfomationNetworkHelper : NSObject
+ (AFHTTPRequestOperation *)getInformationListWithParam:(ZOInfomationRequestModel *)param success:(void(^)(ZOInfomationResultModel *result))success failure:(void(^)(NSError *error)) failure;
@end
