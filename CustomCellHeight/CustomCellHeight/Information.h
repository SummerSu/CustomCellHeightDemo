//
//  Information.h
//  CustomCellHeight
//
//  Created by ryt on 15/5/4.
//  Copyright (c) 2015年 ryt. All rights reserved.
//

#import <Foundation/Foundation.h>
@class InfoFrame;
@interface Information : NSObject
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *headImage;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *picture;


- (id)initWithDict:(NSDictionary *)dict;
+ (id)infomationWithDict:(NSDictionary *)dict;

@end
