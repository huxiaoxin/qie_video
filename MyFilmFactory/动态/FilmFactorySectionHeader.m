//
//  FilmFactorySectionHeader.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/20.
//

#import "FilmFactorySectionHeader.h"
@interface FilmFactorySectionHeader ()
@property(nonatomic,strong) UIView * FilmFacotyCirle;
@property(nonatomic,strong) UILabel * FilmFacotyTimelb;
@end
@implementation FilmFactorySectionHeader
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.FilmFacotyCirle];
        [self addSubview:self.FilmFacotyTimelb];
    }
    return self;
}
- (UIView *)FilmFacotyCirle{
    if (!_FilmFacotyCirle) {
        _FilmFacotyCirle = [[UIView alloc]initWithFrame:CGRectMake(K(10), K(0), K(20), K(20))];
        _FilmFacotyCirle.backgroundColor = [UIColor clearColor];
        _FilmFacotyCirle.layer.borderColor = LGDMianColor.CGColor;
        _FilmFacotyCirle.layer.borderWidth = 2;
        _FilmFacotyCirle.layer.masksToBounds = YES;
        _FilmFacotyCirle.layer.cornerRadius = K(10);
    }
    return _FilmFacotyCirle;
}
- (UILabel *)FilmFacotyTimelb{
    if (!_FilmFacotyTimelb) {
        _FilmFacotyTimelb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_FilmFacotyCirle.frame)+K(4), CGRectGetMidY(_FilmFacotyCirle.frame)-K(7.5), K(250), K(15))];
        _FilmFacotyTimelb.textColor = [UIColor blackColor];
        _FilmFacotyTimelb.font = [UIFont systemFontOfSize:14];
        _FilmFacotyTimelb.text = @"08日 2021年05月";
    }
    return _FilmFacotyTimelb;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
