//
//  FilmFactoryLoactionTableViewCell.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/21.
//

#import "FilmFactoryLoactionTableViewCell.h"
@interface FilmFactoryLoactionTableViewCell ()
@property(nonatomic,strong) UIImageView * FilmFactroyThubImgView;
@property(nonatomic,strong) UILabel * FilmFactoryToplb;
@property(nonatomic,strong) UILabel * FilmFacrtorCenterlb;
@property(nonatomic,strong) UILabel * FilmFacroryBtomlb;
@property(nonatomic,strong) UIButton * FimFacoyJoinBtn;
@property(nonatomic,strong) UIView * FilmDeepline;
@end
@implementation FilmFactoryLoactionTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle =  UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.FilmFactroyThubImgView];
        [self.contentView addSubview:self.FilmFactoryToplb];
        [self.contentView addSubview:self.FilmFacroryBtomlb];
        [self.contentView addSubview:self.FilmFacrtorCenterlb];
        [self.contentView addSubview:self.FimFacoyJoinBtn];
        [self.contentView addSubview:self.FilmDeepline];

    }
    return self;
}
- (UIImageView *)FilmFactroyThubImgView{
    if (!_FilmFactroyThubImgView) {
        _FilmFactroyThubImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(15), K(10), K(80), K(80))];
        _FilmFactroyThubImgView.backgroundColor  = LGDLightGaryColor;
        _FilmFactroyThubImgView.layer.cornerRadius = K(5);
        _FilmFactroyThubImgView.layer.masksToBounds = YES;
    }
    return _FilmFactroyThubImgView;
}
- (UILabel *)FilmFactoryToplb{
    if (!_FilmFactoryToplb) {
        _FilmFactoryToplb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_FilmFactroyThubImgView.frame)+K(6), CGRectGetMinY(_FilmFactroyThubImgView.frame)+K(3), K(200), K(40))];
        _FilmFactoryToplb.numberOfLines = 2;
        _FilmFactoryToplb.textColor = LGDBLackColor;
        _FilmFactoryToplb.font = [UIFont boldSystemFontOfSize:16];
        _FilmFactoryToplb.text = @"黑泽明与杨德味 -叫熊屏电影大师见面会";
    }
    return _FilmFactoryToplb;
}
- (UILabel *)FilmFacroryBtomlb{
    if (!_FilmFacroryBtomlb) {
        _FilmFacroryBtomlb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_FilmFactroyThubImgView.frame)+K(6), CGRectGetMaxY(_FilmFactroyThubImgView.frame)-K(15), K(200), K(15))];
        _FilmFacroryBtomlb.textColor = LGDGaryColor;
        _FilmFacroryBtomlb.font = [UIFont systemFontOfSize:13];
        _FilmFacroryBtomlb.text =  @"通过电影，探寻黑泽明喝杨德昌的制作过程探寻黑泽明喝杨德昌的制作过程探寻黑泽明喝杨德昌的制作过程";
    }
    return _FilmFacroryBtomlb;
}
- (UILabel *)FilmFacrtorCenterlb{
    if (!_FilmFacrtorCenterlb) {
        _FilmFacrtorCenterlb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_FilmFactroyThubImgView.frame)+K(6), CGRectGetMinY(_FilmFacroryBtomlb.frame)-K(21), K(200), K(15))];
        _FilmFacrtorCenterlb.textColor = LGDGaryColor;
        _FilmFacrtorCenterlb.font = [UIFont systemFontOfSize:13];
        _FilmFacrtorCenterlb.text =  @"主讲人: 胡德夫";
    }
    return _FilmFacrtorCenterlb;
}
- (UIView *)FilmDeepline{
    if (!_FilmDeepline) {
        _FilmDeepline = [[UIView alloc]initWithFrame:CGRectMake(K(15), K(99), SCREEN_Width-K(30), K(.5))];
        _FilmDeepline.backgroundColor = LGDLightGaryColor;
    }
    return _FilmDeepline;
}
- (UIButton *)FimFacoyJoinBtn{
    if (!_FimFacoyJoinBtn) {
        _FimFacoyJoinBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_Width-K(15+50), CGRectGetMinY(_FilmFactroyThubImgView.frame)+K(3), K(40), K(20))];
        _FimFacoyJoinBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        _FimFacoyJoinBtn.backgroundColor = LGDMianColor;
        _FimFacoyJoinBtn.layer.cornerRadius = K(5);
        _FimFacoyJoinBtn.layer.masksToBounds = YES;
        [_FimFacoyJoinBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_FimFacoyJoinBtn setTitle:@"参与" forState:UIControlStateNormal];
        _FimFacoyJoinBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _FimFacoyJoinBtn;
}

@end
