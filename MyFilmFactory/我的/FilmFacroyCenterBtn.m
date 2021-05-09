//
//  FilmFacroyCenterBtn.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/23.
//

#import "FilmFacroyCenterBtn.h"

@implementation FilmFacroyCenterBtn
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.FilmTopImgView];
        [self addSubview:self.FIlmBtomlb];
    }
    return self;
}
- (UIImageView *)FilmTopImgView{
    if (!_FilmTopImgView) {
        _FilmTopImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
//        _FilmTopImgView.backgroundColor = LGDRedColor;
    }
    return _FilmTopImgView;
}
-(UILabel *)FIlmBtomlb{
    if (!_FIlmBtomlb) {
        _FIlmBtomlb = [[UILabel alloc]initWithFrame:CGRectZero];
        _FIlmBtomlb.textAlignment = NSTextAlignmentCenter;
        _FIlmBtomlb.textColor = LGDBLackColor;
        _FIlmBtomlb.font = [UIFont systemFontOfSize:13];
    }
    return _FIlmBtomlb;
}
-(void)layoutSubviews{
    _FilmTopImgView.frame = CGRectMake(self.bounds.size.width/2-K(20), 0, K(40), K(40));
    _FIlmBtomlb.frame = CGRectMake(0, CGRectGetMaxY(_FilmTopImgView.frame)+K(5), self.bounds.size.width, K(15));
}
@end
