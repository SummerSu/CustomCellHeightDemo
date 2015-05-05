//
//  InfoFrame.m
//  CustomCellHeight
//
//  Created by sunsu on 15/5/4.
//  Copyright (c) 2015年 sunsu. All rights reserved.
//

#import "InfoFrame.h"

#import "Information.h"
@interface InfoFrame()

@end

@implementation InfoFrame
-(void)setInfomation:(Information *)infomation{
    
    _infomation = infomation;
    
    //头像
    CGFloat padding = 10;
    CGFloat headImageViewX = 10;
    CGFloat headImageViewY = 10;
    CGFloat headImageViewW = 40;
    _headImageF = CGRectMake(headImageViewX, headImageViewY, headImageViewW, headImageViewW);
    
    //名称
    CGFloat nameLabelX = CGRectGetMaxX(_headImageF)+padding;
    
    CGSize nameSize = [self sizeWithString:_infomation.name font:NJNameFont maxSize:CGSizeMake(MAXFLOAT,MAXFLOAT)];
    CGFloat nameLabelWidth = nameSize.width;
    CGFloat nameLabelHeight = nameSize.height;
    CGFloat nameLabelY = headImageViewY + (headImageViewW - nameLabelHeight) * 0.5;
    _nameF = CGRectMake(nameLabelX, nameLabelY, nameLabelWidth, nameLabelHeight);
    
    //文字
    CGFloat textLabelX = headImageViewX;
    CGFloat textLabelY = CGRectGetMaxY(_headImageF)+padding;
    CGSize textSize =  [self sizeWithString:_infomation.text font:NJTextFont maxSize:CGSizeMake(SCREEN_WIDTH-2*padding, MAXFLOAT)];
    _textF = CGRectMake(textLabelX, textLabelY, textSize.width, textSize.height);
    
    //配图
    _cellHeight = 0;
    if (_infomation.picture) {
        CGFloat pictureViewX = headImageViewX;
        CGFloat pictureViewY = CGRectGetMaxY(_textF)+padding;
        CGFloat pictureViewW = 100;
        CGFloat pictureViewH = 100;
        _pictureF = CGRectMake(pictureViewX, pictureViewY, pictureViewW, pictureViewH);
        _cellHeight = CGRectGetMaxY(_pictureF)+padding;
    }else{
    self.cellHeight = CGRectGetMaxY(self.textF) + padding;
    }
}


-(CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize{
    NSDictionary *dict = @{NSFontAttributeName : font};
    CGSize size =  [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size;
}


@end
