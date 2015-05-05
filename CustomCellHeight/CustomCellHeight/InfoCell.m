//
//  InfoCell.m
//  CustomCellHeight
//
//  Created by ryt on 15/5/4.
//  Copyright (c) 2015年 ryt. All rights reserved.
//

#import "InfoCell.h"
#import "Information.h"
#import "InfoFrame.h"


@interface InfoCell ()
@property(nonatomic,strong)UIImageView * headImageView;
@property(nonatomic,strong)UIImageView * pictureView;
@property(nonatomic,strong)UILabel * nameLabel;
@property(nonatomic,strong)UILabel * contextLabel;


@end

@implementation InfoCell
+(instancetype)cellWithTableView:(UITableView *)tableView{
static NSString * identifier = @"INFOCELL";
    InfoCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[InfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //自定义控件创建
        _headImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:_headImageView];
        
        _nameLabel = [[UILabel alloc]init];
        [self.contentView addSubview:_nameLabel];
        
        _contextLabel = [[UILabel alloc]init];
        _contextLabel.numberOfLines = 0;
        _contextLabel.font = NJTextFont;
        [self.contentView addSubview:_contextLabel];
        
        _pictureView = [[UIImageView alloc]init];
        [self.contentView addSubview:_pictureView];
    }
    return self;
}

-(void)setInfoFrame:(InfoFrame *)infoFrame{

    _infoFrame = infoFrame;
    [self settingData];
    [self settingFrame];
    
}

-(void)settingData{
    Information *setInfo = _infoFrame.infomation;
    _headImageView.image = [UIImage imageNamed:setInfo.headImage];
    _nameLabel.text = setInfo.name;
    _contextLabel.text = setInfo.text;
    if (setInfo.picture) {
        _pictureView.image = [UIImage imageNamed:setInfo.picture];
        _pictureView.hidden = NO;
    }else{
        _pictureView.hidden = YES;
    }
}

-(void)settingFrame{

    _headImageView.frame = _infoFrame.headImageF;
    _nameLabel.frame = _infoFrame.nameF;
    [_nameLabel sizeToFit];
    NSLog(@"nameFrame=%@",NSStringFromCGRect(_nameLabel.frame));
    //_nameLabel.backgroundColor = [UIColor yellowColor];
    _contextLabel.frame = _infoFrame.textF;

    if (_infoFrame.infomation.picture) {
        _pictureView.frame = self.infoFrame.pictureF;
    }
}

//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//    
//    [self settingFrame];
//}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
