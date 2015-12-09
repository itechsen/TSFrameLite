//
//  ZOInfomationResultModel.h
//  ZolOnline
//
//  Created by chenyusen on 15/12/8.
//  Copyright © 2015年 chenyusen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZOInfomationResultListModel : NSObject
@property(nonatomic, copy) NSString *stitle;
@property(nonatomic, copy) NSString *sdate;
@property(nonatomic, copy) NSString *type;
@property(nonatomic, copy) NSString *joinPeople;
@property(nonatomic, copy) NSString *url;
@property(nonatomic, copy) NSString *ID;
@property(nonatomic, copy) NSString *imgsrc;
@property(nonatomic, copy) NSString *imgsrc2;
@property(nonatomic, strong) NSNumber *comment_num;
@property(nonatomic, copy) NSString *arrow_pic;

@end

@interface ZOInfomationResultPicsModel : NSObject
@property(nonatomic, copy) NSString *stitle;
@property(nonatomic, copy) NSString *type;
@property(nonatomic, copy) NSString *url;
@property(nonatomic, copy) NSString *ID;
@property(nonatomic, copy) NSString *imgsrc;
@property(nonatomic, copy) NSString *imgsrc2;
@end


@interface ZOInfomationResultModel : NSObject

@property(nonatomic, strong) NSArray *list;
@property(nonatomic, copy) NSString *num;
@property(nonatomic, copy) NSString *doc_update_nums;
@property(nonatomic, strong) NSArray *pics;
@property(nonatomic, copy) NSString *resVersion;



@end
