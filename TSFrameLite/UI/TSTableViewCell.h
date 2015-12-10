//
//  TSTableViewCell.h
//  TSFrameLiteDemo
//
//  Created by chenyusen on 15/12/10.
//  Copyright © 2015年 chenyusen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSHeader.h"
@interface TSTableViewCellLayout : NSObject

@property(nonatomic, assign) CGFloat cellHeight;

@end

@interface TSTableViewCell : UITableViewCell

@property(nonatomic, strong) TSTableViewCellLayout *layout;

@end
