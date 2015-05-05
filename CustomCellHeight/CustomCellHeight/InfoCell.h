//
//  InfoCell.h
//  CustomCellHeight
//
//  Created by ryt on 15/5/4.
//  Copyright (c) 2015年 ryt. All rights reserved.
//

#import <UIKit/UIKit.h>
@class InfoFrame;

@interface InfoCell : UITableViewCell
@property (nonatomic, strong) InfoFrame *infoFrame;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
