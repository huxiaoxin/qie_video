//
//  FilmFacroyHomeTableViewCell.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/21.
//

#import "FilmFacroyHomeTableViewCell.h"
@interface FilmFacroyHomeTableViewCell ()
@property(nonatomic,strong) UIView * FilmFacroContentView;
@property(nonatomic,strong) UIImageView * FilmThubImgView;
@property(nonatomic,strong) UILabel      * FilmToplb;
@property(nonatomic,strong) UILabel      * FilmBtomlb;
@property(nonatomic,strong) UILabel      * FilmTimelb;
@property(nonatomic,strong) UILabel      * FilmTagOnelb;
@property(nonatomic,strong) UILabel      * FilmTagTwolb;
@property(nonatomic,strong) UIButton     * FilmMoreBtn;
@end
@implementation FilmFacroyHomeTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle =  UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.FilmFacroContentView];
        [self.contentView addSubview:self.FilmThubImgView];
        
        [_FilmFacroContentView addSubview:self.FilmToplb];
        [_FilmFacroContentView addSubview:self.FilmBtomlb];
        [_FilmFacroContentView addSubview:self.FilmTimelb];
        [_FilmFacroContentView addSubview:self.FilmTagOnelb];
        [_FilmFacroContentView addSubview:self.FilmTagTwolb];
        [_FilmFacroContentView addSubview:self.FilmMoreBtn];
        

    }
    return self;
}
- (void)setFilmHomeMode:(FilmFacotryHomeModel *)filmHomeMode{
    _filmHomeMode = filmHomeMode;
    [_FilmThubImgView sd_setImageWithURL:[NSURL URLWithString:filmHomeMode.imgTubUrl]];
    _FilmToplb.text = filmHomeMode.famous;
    _FilmBtomlb.text =  filmHomeMode.intrduce;
    _FilmTagOnelb.text = filmHomeMode.tagOne;
    _FilmTagTwolb.text = filmHomeMode.tagTwo;
    if (filmHomeMode.tagTwo.length == 0) {
        _FilmTagTwolb.hidden =YES;
    }else{
        _FilmTagTwolb.hidden =NO;
    }
    _FilmTimelb.text = filmHomeMode.time;
}
- (UIView *)FilmFacroContentView{
    if (!_FilmFacroContentView) {
        _FilmFacroContentView = [[UIView alloc]initWithFrame:CGRectMake(K(15), K(20), SCREEN_Width-K(30), K(100))];
        _FilmFacroContentView.backgroundColor = [UIColor whiteColor];
        _FilmFacroContentView.layer.cornerRadius = K(5);
        _FilmFacroContentView.layer.masksToBounds = YES;
        [_FilmFacroContentView viewShadowPathWithColor:LGDLightGaryColor shadowOpacity:0.8 shadowRadius:5 shadowPathType:LeShadowPathAround shadowPathWidth:5];
        
    }
    return _FilmFacroContentView;
}
- (UIImageView *)FilmThubImgView{
    if (!_FilmThubImgView) {
        _FilmThubImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(20), K(10), K(105), K(105))];
        _FilmThubImgView.backgroundColor = LGDLightGaryColor;
        _FilmThubImgView.layer.cornerRadius = K(5);
        _FilmThubImgView.layer.masksToBounds = YES;
        _FilmThubImgView.contentMode = UIViewContentModeScaleAspectFill;
        
    }
    return _FilmThubImgView;
}
- (UILabel *)FilmToplb{
    if (!_FilmToplb) {
        _FilmToplb = [[UILabel alloc]initWithFrame:CGRectMake(K(120), K(10), CGRectGetWidth(_FilmFacroContentView.frame)-K(130), K(17))];
        _FilmToplb.textColor =  LGDLightBLackColor;
        _FilmToplb.font = [UIFont systemFontOfSize:13];
        _FilmToplb.text = @"美队3上映，先别忙着战队！🔥";
        
    }
    return _FilmToplb;
}
- (UILabel *)FilmBtomlb{
    if (!_FilmBtomlb) {
        _FilmBtomlb = [[UILabel alloc]initWithFrame:CGRectMake(K(120), K(5)+CGRectGetMaxY(_FilmToplb.frame), CGRectGetWidth(_FilmFacroContentView.frame)-K(130), K(30))];
        _FilmBtomlb.textColor =  LGDGaryColor;
        _FilmBtomlb.font = [UIFont systemFontOfSize:12];
        _FilmBtomlb.numberOfLines = 2;
        _FilmBtomlb.backgroundColor =  [UIColor clearColor];
        _FilmBtomlb.text = @"DC的蝙蝠侠和超人刚刚吵完架DC的蝙蝠侠和超人刚刚吵完架DC的蝙蝠侠和超人刚刚吵完架DC的蝙蝠侠和超人刚刚吵完架DC的蝙蝠侠和超人刚刚吵完架DC的蝙蝠侠和超人刚刚吵完架DC的蝙蝠侠和超人刚刚吵完架DC的蝙蝠侠和超人刚刚吵完架DC的蝙蝠侠和超人刚刚吵完架DC的蝙蝠侠和超人刚刚吵完架DC的蝙蝠侠和超人刚刚吵完架";
    }
    return _FilmBtomlb;
}
- (UILabel *)FilmTagOnelb{
    if (!_FilmTagOnelb) {
        _FilmTagOnelb = [[UILabel alloc]initWithFrame:CGRectMake(K(120), CGRectGetMaxY(_FilmBtomlb.frame)+K(10), K(40), K(20))];
        _FilmTagOnelb.textColor = LGDMianColor;
        _FilmTagOnelb.layer.borderColor = LGDMianColor.CGColor;
        _FilmTagOnelb.layer.borderWidth = K(1);
        _FilmTagOnelb.text = @"熱映";
        _FilmTagOnelb.textAlignment  =  NSTextAlignmentCenter;
        _FilmTagOnelb.font =[UIFont systemFontOfSize:13];
        _FilmTagOnelb.layer.cornerRadius = K(10);
        _FilmTagOnelb.layer.masksToBounds = YES;
    }
    return _FilmTagOnelb;
}

- (UILabel *)FilmTagTwolb{
    if (!_FilmTagTwolb) {
        _FilmTagTwolb = [[UILabel alloc]initWithFrame:CGRectMake(K(10)+CGRectGetMaxX(_FilmTagOnelb.frame), CGRectGetMaxY(_FilmBtomlb.frame)+K(10), K(60), K(20))];
        _FilmTagTwolb.textColor = LGDMianColor;
        _FilmTagTwolb.layer.borderColor = LGDMianColor.CGColor;
        _FilmTagTwolb.layer.borderWidth = K(1);
        _FilmTagTwolb.text = @"口碑好";
        _FilmTagTwolb.textAlignment  =  NSTextAlignmentCenter;
        _FilmTagTwolb.font =[UIFont systemFontOfSize:13];
        _FilmTagTwolb.layer.cornerRadius = K(10);
        _FilmTagTwolb.layer.masksToBounds = YES;
    }
    return _FilmTagTwolb;
}
- (UILabel *)FilmTimelb{
    if (!_FilmTimelb) {
        _FilmTimelb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(_FilmFacroContentView.frame)-K(130), CGRectGetMaxY(_FilmBtomlb.frame)+K(14), K(120), K(12))];
        _FilmTimelb.textAlignment = NSTextAlignmentRight;
        _FilmTimelb.font = [UIFont systemFontOfSize:12];
        _FilmTimelb.textColor = LGDGaryColor;
        _FilmTimelb.text = @"2021-04-25";
    }
    return _FilmTimelb;
}
@end
