//
//  InfoFrame.h
//  CustomCellHeight
//
//  Created by ryt on 15/5/4.
//  Copyright (c) 2015年 ryt. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@class Information;


@interface InfoFrame : NSObject

@property(nonatomic,assign)CGRect headImageF;
@property(nonatomic,assign)CGRect nameF;
@property(nonatomic,assign)CGRect textF;
@property(nonatomic,assign)CGRect pictureF;
@property(nonatomic,assign)CGFloat cellHeight;
@property(nonatomic,strong)Information * infomation;


@end
