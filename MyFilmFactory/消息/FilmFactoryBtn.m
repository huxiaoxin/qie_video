//
//  FilmFactoryBtn.m
//  FilmFactory
//
//  Created by codehzx on 2021/4/20.
//

#import "FilmFactoryBtn.h"

@implementation FilmFactoryBtn
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.FilmFacotyImgView];
        [self addSubview:self.FilmFacotrylb];
    }
    return self;
}
- (UIImageView *)FilmFacotyImgView{
    if (!_FilmFacotyImgView) {
        _FilmFacotyImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
//        _FilmFacotyImgView.backgroundColor = LGDLightGaryColor;
    }
    return _FilmFacotyImgView;
}
-(UILabel *)FilmFacotrylb{
    if (!_FilmFacotrylb) {
        _FilmFacotrylb = [[UILabel alloc]initWithFrame:CGRectZero];
        _FilmFacotrylb.textAlignment = NSTextAlignmentCenter;
        _FilmFacotrylb.textColor = [UIColor blackColor];
        _FilmFacotrylb.font = [UIFont systemFontOfSize:14];
    }
    return _FilmFacotrylb;
}
-(void)layoutSubviews{
    _FilmFacotyImgView.frame = CGRectMake(self.bounds.size.width/2-K(20), 0, K(40), K(40));
    _FilmFacotrylb.frame = CGRectMake(0, CGRectGetMaxY(_FilmFacotyImgView.frame)+K(5), self.bounds.size.width, K(15));
}
@end
