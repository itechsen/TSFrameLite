//
//  TSNetWorkManager.m
//  TSFrameLiteDemo
//
//  Created by chenyusen on 15/12/9.
//  Copyright © 2015年 chenyusen. All rights reserved.
//

#import "TSNetWorkManager.h"
#import <MJExtension.h>
#import "TSHeader.h"

@implementation TSNetWorkManager
singleton_m(Manager);

+ (AFHTTPRequestOperation *)getWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void(^)(id responseObj))success failure:(void(^)(NSError *error)) failure {
    return [self getWithUrl:url param:param timeoutInterval:[TSNetWorkManager sharedManager].timeoutInterval resultClass:resultClass success:success failure:failure];
}

+ (AFHTTPRequestOperation *)postWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void(^)(id responseObj))success failure:(void(^)(NSError *error)) failure {
    return [self postWithUrl:url param:param timeoutInterval:[TSNetWorkManager sharedManager].timeoutInterval resultClass:resultClass success:success failure:failure];
}

+ (AFHTTPRequestOperation *)getWithUrl:(NSString *)url param:(id)param timeoutInterval:(NSTimeInterval)timeoutInterval resultClass:(Class)resultClass success:(void(^)(id responseObj))success failure:(void(^)(NSError *error)) failure {
    return [TSBaseNetWorkManager get:[NSString stringWithFormat:@"%@%@",[TSNetWorkManager sharedManager].baseUrl?[TSNetWorkManager sharedManager].baseUrl:@"",url?url:@""] params:[param isKindOfClass:[NSDictionary class]]?param:[param mj_keyValues] timeoutInterval:timeoutInterval>0?timeoutInterval:10 success:^(id responseObj) {
        if (success) {
            if (responseObj) {
                id result = [resultClass mj_objectWithKeyValues:responseObj];
                success(result);
            }
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    

}

+ (AFHTTPRequestOperation *)postWithUrl:(NSString *)url param:(id)param timeoutInterval:(NSTimeInterval)timeoutInterval resultClass:(Class)resultClass success:(void(^)(id responseObj))success failure:(void(^)(NSError *error)) failure {
    return [TSBaseNetWorkManager post:[NSString stringWithFormat:@"%@%@",[TSNetWorkManager sharedManager].baseUrl?[TSNetWorkManager sharedManager].baseUrl:@"",url?url:@""] params:[param isKindOfClass:[NSDictionary class]]?param:[param mj_keyValues] timeoutInterval:timeoutInterval>0?timeoutInterval:10 success:^(id responseObj) {
        if (success) {
            if (responseObj) {
                id result = [resultClass mj_objectWithKeyValues:responseObj];
                success(result);
            }
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end


@implementation TSBaseNetWorkManager

+ (AFHTTPRequestOperation *)get:(NSString *)url params:(NSDictionary *)params timeoutInterval:(NSTimeInterval)timeoutInterval success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    NSInteger romdomCount = 0;
    if (![TSNetWorkManager sharedManager].closeLog) {
        romdomCount = arc4random();
        TSLog(@"url(%ld) ===============>\n%@\nparams = %@",romdomCount,url,params);
    }
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    manager.responseSerializer.acceptableContentTypes = [TSNetWorkManager sharedManager].acceptableContentTypes.count?[TSNetWorkManager sharedManager].acceptableContentTypes:[NSSet setWithArray:@[@"text/html",@"application/json"]];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = timeoutInterval;
    
    return [manager GET:url parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if (![operation isCancelled]) {
            if (success) {
                if (![TSNetWorkManager sharedManager].closeLog) {
                    TSLog(@"response(%ld) ===============> %@",romdomCount,responseObject);
                }
                success(responseObject);
            }
        }
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        if (![operation isCancelled]) {
            if (failure) {
                if (![TSNetWorkManager sharedManager].closeLog) {
                    TSLog(@"error(%ld) ===============> %@",romdomCount,error);
                }
                failure(error);
            }
        }
    }];
}
    
+ (AFHTTPRequestOperation *)post:(NSString *)url params:(NSDictionary *)params timeoutInterval:(NSTimeInterval)timeoutInterval success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    NSInteger romdomCount = 0;
    if (![TSNetWorkManager sharedManager].closeLog) {
        romdomCount = arc4random();
        TSLog(@"url(%ld) ===============>\n%@\nparams = %@",romdomCount,url,params);
    }
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [TSNetWorkManager sharedManager].acceptableContentTypes.count?[TSNetWorkManager sharedManager].acceptableContentTypes:[NSSet setWithArray:@[@"text/html",@"application/json"]];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = timeoutInterval;
    
    return [manager POST:url parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if (![operation isCancelled]) {
            if (success) {
                if (![TSNetWorkManager sharedManager].closeLog) {
                    TSLog(@"response(%ld) ===============> %@",romdomCount,responseObject);
                }
                success(responseObject);
            }
        }
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        if (![operation isCancelled]) {
            if (failure) {
                if (![TSNetWorkManager sharedManager].closeLog) {
                    TSLog(@"error(%ld) ===============> %@",romdomCount,error);
                }
                failure(error);
            }
        }
    }];
}
@end