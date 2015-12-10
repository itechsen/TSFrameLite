//
//  ZOInformationTableViewCell.m
//  TSFrameLiteDemo
//
//  Created by chenyusen on 15/12/10.
//  Copyright © 2015年 chenyusen. All rights reserved.
//

#import "ZOInformationTableViewCell.h"
#import <UIImageView+WebCache.h>
#import <NSDate+YYAdd.h>
//图片
static const CGFloat pictureViewLeft = 10;
static const CGFloat pictureViewTop = 10;
static const CGFloat pictureViewTopWidth = 90;
static const CGFloat pictureViewTopHeight = 67;


@implementation ZOInformationTableViewCellLayout : TSTableViewCellLayout


@end


@interface ZOInformationTableViewCell ()

@property(nonatomic, strong) UIImageView *pictureView;

@property(nonatomic, strong) UILabel *titleLabel;

@property(nonatomic, strong) UILabel *dateLabel;


@end


@implementation ZOInformationTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _pictureView = [[UIImageView alloc] initWithFrame:CGRectMake(pictureViewLeft, pictureViewTop, pictureViewTopWidth, pictureViewTopHeight)];
        [self.contentView addSubview:_pictureView];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_pictureView.right + 10, _pictureView.top, SCREEN_WIDTH - _pictureView.right - 20, 50)];
        _titleLabel.numberOfLines = 2;
        _titleLabel.font = [UIFont systemFontOfSize:18];
        _titleLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_titleLabel];
        
        _dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(_titleLabel.left, _titleLabel.bottom + 5, 100, 11)];
        _dateLabel.font = [UIFont systemFontOfSize:11];
        _dateLabel.textColor = HEX_COLOR(0x999999);
        [self.contentView addSubview:_dateLabel];
        


    }
    return self;
}


- (void)setLayout:(TSTableViewCellLayout *)layout {
    if (self.layout != layout) {
        [super setLayout:layout];
        ZOInformationTableViewCellLayout *infoLayout = (ZOInformationTableViewCellLayout *)layout;
        [_pictureView sd_setImageWithURL:[NSURL URLWithString:infoLayout.item.imgsrc]];
        
        _titleLabel.text = infoLayout.item.stitle;
        
        _dateLabel.text = [infoLayout.item.sdate stringWithFormat:@"MM-dd"];
   
    }
    
    
}




@end
