//
//  FilmFactoryMovieView.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/21.
//

#import "FilmFactoryMovieView.h"
@interface FilmFactoryMovieView ()
@property(nonatomic,strong) UILabel     * Topnamelb;
@property(nonatomic,strong) UILabel     * Btomlb;
@property(nonatomic,strong) UIImageView * thubImgView;
@property(nonatomic,strong) UILabel     * sourcelb;
@end
@implementation FilmFactoryMovieView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = LGDGaryColor;
        [self addSubview:self.Topnamelb];
        [self addSubview:self.Btomlb];
        [self addSubview:self.thubImgView];
        [self addSubview:self.thubImgView];
        [self addSubview:self.sourcelb];
        
        UITapGestureRecognizer * FilmMytap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(FilmMyTapClick)];
        [self addGestureRecognizer:FilmMytap];
    }
    return self;
}
-(void)FilmMyTapClick{
    [self.delegate FilmFactoryMovieViewtap];
}
- (UILabel *)Topnamelb{
    if (!_Topnamelb) {
        _Topnamelb =[[UILabel alloc]initWithFrame:CGRectZero];
        _Topnamelb.textColor = [UIColor blackColor];
        _Topnamelb.font = [UIFont boldSystemFontOfSize:15];
//        _Topnamelb.text = @"速度与激情  ";
        NSString * firstStr = @"超级的我  ";
        NSString * secondStr = @"5.3分";
        NSMutableAttributedString * mutableAttbute = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@%@",firstStr,secondStr]];
        [mutableAttbute addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:16] range:NSMakeRange(0, firstStr.length)];
        [mutableAttbute addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, firstStr.length)];

        [mutableAttbute addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:12] range:NSMakeRange(firstStr.length, secondStr.length)];
        [mutableAttbute addAttribute:NSForegroundColorAttributeName value:LGDMianColor range:NSMakeRange(firstStr.length, secondStr.length)];

        _Topnamelb.attributedText = mutableAttbute;
    }
    return _Topnamelb;
}
- (UILabel *)Btomlb{
    if (!_Btomlb) {
        _Btomlb = [[UILabel alloc]initWithFrame:CGRectMake(K(10), CGRectGetMaxY(_Topnamelb.frame)+K(8), self.bounds.size.width-K(20), K(13))];
        _Btomlb.textColor = LGDGaryColor;
//        _Btomlb.backgroundColor = LGDMianColor;
        _Btomlb.font = [UIFont systemFontOfSize:12];
        _Btomlb.numberOfLines = 0;
        _Btomlb.text = @"主演:王大陆/宋佳/曹炳琨/吴刚/金燕玲";
    }
    return _Btomlb;
}
- (UIImageView *)thubImgView{
    if (!_thubImgView) {
        _thubImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _thubImgView.backgroundColor = LGDLightGaryColor;
        [_thubImgView sd_setImageWithURL:[NSURL URLWithString:@"https://image11.m1905.cn/mdb/uploadfile/2021/0322/thumb_1_283_390_20210322090623344611.jpg"]];
        _thubImgView.contentMode = UIViewContentModeScaleAspectFill;
        _thubImgView.layer.masksToBounds = YES;
//        _thubImgView.layer.cornerRadius = K(5);
//        _thubImgView.layer.masksToBounds = YES;
    }
    return _thubImgView;
}
-(void)layoutSubviews{
    _Topnamelb.frame = CGRectMake(K(10), K(10), self.bounds.size.width-K(20), K(16));
    _Btomlb.frame = CGRectMake(K(10), CGRectGetMaxY(_Topnamelb.frame)+K(10),  self.bounds.size.width-K(20+60),self.bounds.size.height-K(50));
    _thubImgView.frame = CGRectMake(self.bounds.size.width-K(60), K(10), K(50), self.bounds.size.height-K(20));
}
@end
