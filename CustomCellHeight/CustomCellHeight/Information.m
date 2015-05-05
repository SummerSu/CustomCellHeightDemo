//
//  Information.m
//  CustomCellHeight
//
//  Created by ryt on 15/5/4.
//  Copyright (c) 2015年 ryt. All rights reserved.
//

#import "Information.h"

@implementation Information
-(id)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}


+(id)infomationWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
