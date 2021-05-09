//
//  FilmFacotryMsgTableViewCell.m
//  FilmFactory
//
//  Created by codehzx on 2021/4/20.
//

#import "FilmFacotryMsgTableViewCell.h"
@interface FilmFacotryMsgTableViewCell ()
@property(nonatomic,strong) UIView * FilmFactoryView;
@property(nonatomic,strong) UIImageView * FilmFaotryuserImgView;
@property(nonatomic,strong) UILabel * FilmFactoryToplb;
@property(nonatomic,strong) UILabel * FilmFactoryBtomlb;
@property(nonatomic,strong) UILabel * FilmFactoryTimelb;
@property(nonatomic,strong) UILabel * FilmFactoryNumlb;

@end
@implementation FilmFacotryMsgTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.FilmFactoryView];
        [_FilmFactoryView addSubview:self.FilmFaotryuserImgView];
        [_FilmFactoryView addSubview:self.FilmFactoryToplb];
        [_FilmFactoryView addSubview:self.FilmFactoryBtomlb];
        [_FilmFactoryView addSubview:self.FilmFactoryTimelb];
        [_FilmFactoryView addSubview:self.FilmFactoryNumlb];
    }
    return self;
}
-(UIView *)FilmFactoryView{
    if (!_FilmFactoryView) {
        _FilmFactoryView = [[UIView alloc]initWithFrame:CGRectMake(K(15), 0, SCREEN_Width-K(30), K(70))];
        _FilmFactoryView.backgroundColor = [UIColor whiteColor];
        _FilmFactoryView.layer.cornerRadius = K(8);
        _FilmFactoryView.layer.masksToBounds = YES;
    }
    return _FilmFactoryView;
}
-(UIImageView *)FilmFaotryuserImgView{
    if (!_FilmFaotryuserImgView) {
        _FilmFaotryuserImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(15), K(15), K(40), K(40))];
        _FilmFaotryuserImgView.layer.cornerRadius = K(20);
        _FilmFaotryuserImgView.layer.masksToBounds = YES;
        _FilmFaotryuserImgView.backgroundColor = LGDLightGaryColor;
    }
    return _FilmFaotryuserImgView;
}
- (UILabel *)FilmFactoryToplb{
    if (!_FilmFactoryToplb) {
        _FilmFactoryToplb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_FilmFaotryuserImgView.frame)+K(8), CGRectGetMinY(_FilmFaotryuserImgView.frame)+K(2), K(200), K(15))];
        _FilmFactoryToplb.textColor = [UIColor blackColor];
        _FilmFactoryToplb.font = [UIFont boldSystemFontOfSize:14];
        _FilmFactoryToplb.text = @"铁臂阿童木";
    }
    return _FilmFactoryToplb;
}
- (UILabel *)FilmFactoryBtomlb{
    if (!_FilmFactoryBtomlb) {
        _FilmFactoryBtomlb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_FilmFaotryuserImgView.frame)+K(8), CGRectGetMaxY(_FilmFactoryToplb.frame)+K(7), K(250), K(13))];
        _FilmFactoryBtomlb.textColor = LGDGaryColor;
        _FilmFactoryBtomlb.font = [UIFont systemFontOfSize:12];
        _FilmFactoryBtomlb.text = @"铁臂阿童木铁臂阿童木铁臂阿童木铁臂阿童木铁臂阿童木铁臂阿童木";
    }
    return _FilmFactoryBtomlb;
}
- (UILabel *)FilmFactoryTimelb{
    if (!_FilmFactoryTimelb) {
        _FilmFactoryTimelb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(_FilmFactoryView.frame)-K(110), K(15), K(100), K(14))];
        _FilmFactoryTimelb.textAlignment=  NSTextAlignmentRight;
        _FilmFactoryTimelb.font = [UIFont systemFontOfSize:12];
        _FilmFactoryTimelb.textColor =  LGDGaryColor;
        _FilmFactoryTimelb.text = @"3秒前";
    }
    return _FilmFactoryTimelb;
}
- (UILabel *)FilmFactoryNumlb{
    if (!_FilmFactoryNumlb) {
        _FilmFactoryNumlb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(_FilmFactoryView.frame)-K(30), CGRectGetMaxY(_FilmFactoryTimelb.frame)+K(8), K(16), K(16))];
        _FilmFactoryNumlb.layer.cornerRadius = K(8);
        _FilmFactoryNumlb.layer.masksToBounds = YES;
        _FilmFactoryNumlb.font = [UIFont systemFontOfSize:12];
        [_FilmFactoryNumlb setBackgroundColor:[UIColor redColor]];
        _FilmFactoryNumlb.textAlignment = NSTextAlignmentCenter;
        _FilmFactoryNumlb.textColor = [UIColor whiteColor];
        _FilmFactoryNumlb.text = @"12";
    }
    return _FilmFactoryNumlb;
}
- (void)setFilmModel:(FilmChatMsgListModel *)FilmModel{
    _FilmModel = FilmModel;
    [_FilmFaotryuserImgView sd_setImageWithURL:[NSURL URLWithString:FilmModel.imgurl]];
    _FilmFactoryToplb.text  = FilmModel.topname;
    _FilmFactoryBtomlb.text = FilmModel.content;
    _FilmFactoryTimelb.text = FilmModel.time;
    _FilmFactoryNumlb.text=  [NSString stringWithFormat:@"%ld",FilmModel.redNum];
    _FilmFactoryNumlb.hidden = !FilmModel.isShowRed;
}
@end
