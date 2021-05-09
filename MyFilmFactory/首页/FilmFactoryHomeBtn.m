//
//  FilmFactoryHomeBtn.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/21.
//

#import "FilmFactoryHomeBtn.h"

@implementation FilmFactoryHomeBtn
-(instancetype)initWithFrame:(CGRect)frame{
    if (self  =[super initWithFrame:frame]) {
        [self addSubview:self.FilmTopImgView];
        [self addSubview:self.FilmBtomlb];
    }
    return self;
}
- (UIImageView *)FilmTopImgView{
    if (!_FilmTopImgView) {
        _FilmTopImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
//        _FilmTopImgView.backgroundColor =  LGDLightGaryColor;
    }
    return _FilmTopImgView;
}
-(UILabel *)FilmBtomlb{
    if (!_FilmBtomlb) {
        _FilmBtomlb = [[UILabel alloc]initWithFrame:CGRectZero];
        _FilmBtomlb.textAlignment = NSTextAlignmentCenter;
        [_FilmBtomlb setTextColor:LGDBLackColor];
        _FilmBtomlb.font = [UIFont  systemFontOfSize:13];
    }
    return _FilmBtomlb;
}
-(void)layoutSubviews{
    _FilmTopImgView.frame = CGRectMake(self.bounds.size.width/2-K(20), 0, K(40),K(40));
    _FilmBtomlb.frame = CGRectMake(0, CGRectGetMaxY(_FilmTopImgView.frame)+K(6), self.bounds.size.width, K(14));
}
@end
