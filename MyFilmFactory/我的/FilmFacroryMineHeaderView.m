//
//  FilmFacroryMineHeaderView.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/23.
//

#import "FilmFacroryMineHeaderView.h"
#import "FilmFacroyCenterBtn.h"
@interface FilmFacroryMineHeaderView ()
@property(nonatomic,strong) UIButton   * FilmChangeBtn;
@end
@implementation FilmFacroryMineHeaderView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        UIImageView * filmBackImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, K(180))];
        filmBackImgView.image = [UIImage imageNamed:@"beijingtuda"];
        filmBackImgView.backgroundColor = LGDMianColor;
        [self addSubview:filmBackImgView];
        [self addSubview:self.FilmFacoryImgView];
        [self addSubview:self.FilmToplb];
        [self addSubview:self.FilmBtomlb];
        [self addSubview:self.FilmChangeBtn];
        NSArray * FilmBtnArr = @[@"我的发布",@"我的预约",@"我的收藏"];
        for (int index = 0; index < FilmBtnArr.count; index ++) {
            FilmFacroyCenterBtn * factorBtn = [[FilmFacroyCenterBtn alloc]initWithFrame:CGRectMake(SCREEN_Width/FilmBtnArr.count*index, K(180), SCREEN_Width/FilmBtnArr.count, K(70))];
            factorBtn.FIlmBtomlb.text = FilmBtnArr[index];
            factorBtn.FilmTopImgView.image =  [UIImage imageNamed:FilmBtnArr[index]];
            factorBtn.tag = index;
            [factorBtn addTarget:self action:@selector(FilmfacoryCenterBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:factorBtn];
        }
    }
    return self;
}
-(void)FilmfacoryCenterBtnClick:(FilmFacroyCenterBtn *)centerBtn{
    [self.delegate FilmFacroryMineHeaderViewWithBtnClickIndex:centerBtn.tag];
}
- (UIImageView *)FilmFacoryImgView{
    if (!_FilmFacoryImgView) {
        _FilmFacoryImgView = [[UIImageView alloc]initWithFrame:CGRectMake((15), (60), K(50), K(50))];
//        _FilmFacoryImgView.backgroundColor = LGDMianColor;
        _FilmFacoryImgView.layer.borderColor = [UIColor whiteColor].CGColor;
        _FilmFacoryImgView.layer.borderWidth = K(2);
        _FilmFacoryImgView.layer.cornerRadius = K(25);
        _FilmFacoryImgView.layer.masksToBounds = YES;
        _FilmFacoryImgView.userInteractionEnabled = YES;
    }
    return _FilmFacoryImgView;
}
- (UILabel *)FilmToplb{
    if (!_FilmToplb) {
        _FilmToplb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_FilmFacoryImgView.frame)+K(10), CGRectGetMinY(_FilmFacoryImgView.frame)+K(10), K(200), K(17))];
        _FilmToplb.font = [UIFont boldSystemFontOfSize:14];
        _FilmToplb.textColor =[UIColor whiteColor];
        _FilmToplb.text = @"博文哥儿";
    }
    return _FilmToplb;
}
- (UILabel *)FilmBtomlb{
    if (!_FilmBtomlb) {
        _FilmBtomlb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_FilmFacoryImgView.frame)+K(10), CGRectGetMaxY(_FilmToplb.frame)+K(5), K(200), K(13))];
        _FilmBtomlb.font = [UIFont systemFontOfSize:12];
        _FilmBtomlb.textColor =[UIColor whiteColor];
        _FilmBtomlb.text = @"uid:52737379";
        
    }
    return _FilmBtomlb;
}
- (UIButton *)FilmChangeBtn{
if (!_FilmChangeBtn) {
            
    _FilmChangeBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_Width-K(40), CGRectGetMidY(_FilmFacoryImgView.frame)-K(10), K(20), K(20))];
    [_FilmChangeBtn setBackgroundImage:[UIImage imageNamed:@"gai"] forState:UIControlStateNormal];
    _FilmChangeBtn.adjustsImageWhenHighlighted =  NO;
    [_FilmChangeBtn addTarget:self action:@selector(FilmChangeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _FilmChangeBtn;
}
-(void)FilmChangeBtnClick{
    NSLog(@"%s",__func__);
    [self.delegate FilmFacroryMineHeaderViewChangeInfo];
 
}
@end
