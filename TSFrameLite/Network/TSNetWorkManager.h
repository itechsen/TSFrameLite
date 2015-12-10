//
//  TSNetWorkManager.h
//  TSFrameLiteDemo
//
//  Created by chenyusen on 15/12/9.
//  Copyright © 2015年 chenyusen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"
#import <AFNetworking.h>
@interface TSNetWorkManager : NSObject
/** 项目请求的基本网络URL */
@property(nonatomic, copy) NSString *baseUrl;
/** 网络请求超时时间 */
@property(nonatomic, assign) NSTimeInterval timeoutInterval;
/** 接受的内容类型 */
@property(nonatomic, strong) NSSet *acceptableContentTypes;
/** 关闭网络日志打印 */
@property(nonatomic, assign) BOOL closeLog;

singleton_h(Manager);
/**
 *  get请求方法
 *
 *  @param url         请求url
 *  @param param       请求参数模型/字典
 *  @param resultClass 需要映射的对象
 *  @param success     请求成功回调
 *  @param failure     请求失败回调
 *
 *  @return 网络请求操作
 */
+ (AFHTTPRequestOperation *)getWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void(^)(id responseObj))success failure:(void(^)(NSError *error)) failure;

/**
 *  post请求方法
 *
 *  @param url         请求url
 *  @param param       请求参数模型/字典
 *  @param resultClass 需要映射的对象
 *  @param success     请求成功回调
 *  @param failure     请求失败回调
 *
 *  @return 网络请求操作
 */
+ (AFHTTPRequestOperation *)postWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void(^)(id responseObj))success failure:(void(^)(NSError *error)) failure;

/**
 *  get请求方法 自定义超时时间
 *
 *  @param url             请求url
 *  @param param           请求参数模型/字典
 *  @param timeoutInterval 超时时间
 *  @param resultClass     需要映射的对象
 *  @param success         请求成功回调
 *  @param failure         请求失败回调
 *
 *  @return 网络请求操作
 */
+ (AFHTTPRequestOperation *)getWithUrl:(NSString *)url param:(id)param timeoutInterval:(NSTimeInterval)timeoutInterval resultClass:(Class)resultClass success:(void(^)(id responseObj))success failure:(void(^)(NSError *error)) failure;

/**
 *  post请求方法 自定义超时时间
 *
 *  @param url             请求url
 *  @param param           请求参数模型/字典
 *  @param timeoutInterval 超时时间
 *  @param resultClass     需要映射的对象
 *  @param success         请求成功回调
 *  @param failure         请求失败回调
 *
 *  @return 网络请求操作
 */
+ (AFHTTPRequestOperation *)postWithUrl:(NSString *)url param:(id)param timeoutInterval:(NSTimeInterval)timeoutInterval resultClass:(Class)resultClass success:(void(^)(id responseObj))success failure:(void(^)(NSError *error)) failure;

@end


@interface TSBaseNetWorkManager : NSObject

/**
 *  get请求方式
 *
 *  @param url             请求url
 *  @param params          请求参数字典
 *  @param timeoutInterval 超时时间
 *  @param success         请求成功回调
 *  @param failure         请求失败回调
 */
+ (AFHTTPRequestOperation *)get:(NSString *)url params:(NSDictionary *)params timeoutInterval:(NSTimeInterval)timeoutInterval success:(void(^)(id responseObj))success failure:(void(^)(NSError *error)) failure;

/**
 *  post请求方式
 *
 *  @param url             请求url
 *  @param params          请求参数字典
 *  @param timeoutInterval 超时时间
 *  @param success         请求成功回调
 *  @param failure         请求失败回调
 */
+ (AFHTTPRequestOperation *)post:(NSString *)url params:(NSDictionary *)params timeoutInterval:(NSTimeInterval)timeoutInterval success:(void(^)(id responseObj))success failure:(void(^)(NSError *error)) failure;
@end
