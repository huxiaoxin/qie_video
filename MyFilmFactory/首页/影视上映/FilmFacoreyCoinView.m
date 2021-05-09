//
//  FilmFacoreyCoinView.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/27.
//

#import "FilmFacoreyCoinView.h"
#import "WWStarView.h"
@interface FilmFacoreyCoinView ()
@property(nonatomic,strong) UILabel * FilmFactorylb;
@property(nonatomic,strong) UILabel * FilmCoinNumlb;
@property(nonatomic,strong) UILabel * FilmAddcomentlb;
@property(nonatomic,strong) WWStarView  *  wwFiveStar;
@property(nonatomic,strong) WWStarView  *  wwFoureStar;
@property(nonatomic,strong) WWStarView  *  wwThreeStar;
@property(nonatomic,strong) WWStarView  *  wwSecondStar;
@property(nonatomic,strong) WWStarView  *  wwOneStar;
@property(nonatomic,strong) UIProgressView      * FiveProogrese;
@property(nonatomic,strong) UIProgressView      * FoureProogrese;
@property(nonatomic,strong) UIProgressView      * ThreeProogrese;
@property(nonatomic,strong) UIProgressView      * TwoProogrese;
@property(nonatomic,strong) UIProgressView      * OneProogrese;

@end
@implementation FilmFacoreyCoinView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.FilmFactorylb];
        [self addSubview:self.FilmCoinNumlb];
        [self addSubview:self.FilmAddcomentlb];
        [self addSubview:self.wwFiveStar];
        [self addSubview:self.wwFoureStar];
        [self addSubview:self.wwThreeStar];
        [self addSubview:self.wwSecondStar];
        [self addSubview:self.wwOneStar];

        [self addSubview:self.FiveProogrese];
        [self addSubview:self.FoureProogrese];
        [self addSubview:self.ThreeProogrese];
        [self addSubview:self.TwoProogrese];
        [self addSubview:self.OneProogrese];

    }
    return self;
}
- (UILabel *)FilmFactorylb{
    if (!_FilmFactorylb) {
        _FilmFactorylb = [[UILabel alloc]initWithFrame:CGRectMake(K(10), K(15), K(120), K(15))];
        _FilmFactorylb.textColor = LGDBLackColor;
        _FilmFactorylb.font = [UIFont boldSystemFontOfSize:14];
        _FilmFactorylb.text = @"毒舌综合评分";
    }
    return _FilmFactorylb;
}
- (UILabel *)FilmCoinNumlb{
    if (!_FilmCoinNumlb) {
        _FilmCoinNumlb = [[UILabel alloc]initWithFrame:CGRectMake(K(10), CGRectGetMaxY(_FilmFactorylb.frame)+K(10), K(120), K(30))];
        _FilmCoinNumlb.textColor = LGDMianColor;
        _FilmCoinNumlb.font = [UIFont boldSystemFontOfSize:25];
        _FilmCoinNumlb.text= @"8.2";
        
    }
    return _FilmCoinNumlb;
}
- (UILabel *)FilmAddcomentlb{
    if (!_FilmAddcomentlb) {
        _FilmAddcomentlb = [[UILabel alloc]initWithFrame:CGRectMake(K(10), CGRectGetMaxY(_FilmCoinNumlb.frame)+K(10), K(200), K(13))];
        _FilmAddcomentlb.textColor = LGDLightBLackColor;
        _FilmAddcomentlb.font =[UIFont systemFontOfSize:12];
        _FilmAddcomentlb.text = @"23,52评分";
    }
    return _FilmAddcomentlb;
}
- (WWStarView *)wwFiveStar{
    if (!_wwFiveStar) {
        _wwFiveStar = [[WWStarView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_FilmCoinNumlb.frame), CGRectGetMinY(_FilmCoinNumlb.frame)-K(20), K(60), K(15)) numberOfStars:5 currentStar:5 rateStyle:WholeStar isAnination:YES andamptyImageName:@"未评分" fullImageName:@"评分" finish:^(CGFloat currentStar) {
            
        }];
        _wwFiveStar.userInteractionEnabled = NO;
    }
    return _wwFiveStar;
}
- (WWStarView *)wwFoureStar{
    if (!_wwFoureStar) {
        _wwFoureStar = [[WWStarView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_FilmCoinNumlb.frame), CGRectGetMaxY(_wwFiveStar.frame), K(60), K(15)) numberOfStars:5 currentStar:4 rateStyle:WholeStar isAnination:YES andamptyImageName:@"未评分" fullImageName:@"评分" finish:^(CGFloat currentStar) {
        }];
        _wwFoureStar.userInteractionEnabled = NO;
    }
    return _wwFoureStar;
}
- (WWStarView *)wwThreeStar{
    if (!_wwThreeStar) {
        _wwThreeStar = [[WWStarView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_FilmCoinNumlb.frame), CGRectGetMaxY(_wwFoureStar.frame), K(60), K(15)) numberOfStars:5 currentStar:3 rateStyle:WholeStar isAnination:YES andamptyImageName:@"未评分" fullImageName:@"评分" finish:^(CGFloat currentStar) {
        }];
        _wwThreeStar.userInteractionEnabled = NO;
    }
    return _wwThreeStar;
}
- (WWStarView *)wwSecondStar{
    if (!_wwSecondStar) {
        _wwSecondStar = [[WWStarView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_FilmCoinNumlb.frame), CGRectGetMaxY(_wwThreeStar.frame), K(60), K(15)) numberOfStars:5 currentStar:2 rateStyle:WholeStar isAnination:YES andamptyImageName:@"未评分" fullImageName:@"评分" finish:^(CGFloat currentStar) {
        }];
        _wwSecondStar.userInteractionEnabled = NO;

    }
    return _wwSecondStar;
}
- (WWStarView *)wwOneStar{
    if (!_wwOneStar) {
        _wwOneStar = [[WWStarView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_FilmCoinNumlb.frame), CGRectGetMaxY(_wwSecondStar.frame), K(60), K(15)) numberOfStars:5 currentStar:1 rateStyle:WholeStar isAnination:YES andamptyImageName:@"未评分" fullImageName:@"评分" finish:^(CGFloat currentStar) {
        }];
        _wwOneStar.userInteractionEnabled = NO;
    }
    return _wwOneStar;
}
- (UIProgressView *)FiveProogrese{
    if (!_FiveProogrese) {
        _FiveProogrese = [[UIProgressView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_wwFiveStar.frame)+K(5), CGRectGetMidY(_wwFiveStar.frame)-K(4), K(140), K(10))];
        _FiveProogrese.tintColor = LGDMianColor;
        _FiveProogrese.trackTintColor = LGDGaryColor;
        _FiveProogrese.progress = 0.4;
    }
    return _FiveProogrese;
}
- (UIProgressView *)FoureProogrese{
    if (!_FoureProogrese) {
        _FoureProogrese = [[UIProgressView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_wwFiveStar.frame)+K(5), CGRectGetMidY(_wwFoureStar.frame)-K(4), K(140), K(10))];
        _FoureProogrese.tintColor = LGDMianColor;
        _FoureProogrese.trackTintColor = LGDGaryColor;
        _FoureProogrese.progress = 0.2;
    }
    return _FoureProogrese;
}
- (UIProgressView *)ThreeProogrese{
    if (!_ThreeProogrese) {
        _ThreeProogrese = [[UIProgressView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_wwFiveStar.frame)+K(5), CGRectGetMidY(_wwThreeStar.frame)-K(4), K(140), K(10))];
        _ThreeProogrese.tintColor = LGDMianColor;
        _ThreeProogrese.trackTintColor = LGDGaryColor;
        _ThreeProogrese.progress = 0.6;
    }
    return _ThreeProogrese;
}
- (UIProgressView *)TwoProogrese{
    if (!_TwoProogrese) {
        _TwoProogrese = [[UIProgressView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_wwFiveStar.frame)+K(5), CGRectGetMidY(_wwSecondStar.frame)-K(4), K(140), K(10))];
        _TwoProogrese.tintColor = LGDMianColor;
        _TwoProogrese.trackTintColor = LGDGaryColor;
        _TwoProogrese.progress = 0.6;
    }
    return _TwoProogrese;
}
- (UIProgressView *)OneProogrese{
    if (!_OneProogrese) {
        _OneProogrese = [[UIProgressView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_wwFiveStar.frame)+K(5), CGRectGetMidY(_wwOneStar.frame)-K(4), K(140), K(10))];
        _OneProogrese.tintColor = LGDMianColor;
        _OneProogrese.trackTintColor = LGDGaryColor;
        _OneProogrese.progress = 0.6;
    }
    return _OneProogrese;
}
- (void)setFilmHomeModel:(FilmFacotryHomeModel *)filmHomeModel{
    _filmHomeModel = filmHomeModel;
    
    _FilmFactorylb.text = [NSString stringWithFormat:@"%@综合评分",filmHomeModel.famous];
    
    _FilmCoinNumlb.text =  [NSString stringWithFormat:@"%.2f",filmHomeModel.DoubanNum];
    _FilmAddcomentlb.text =  [NSString stringWithFormat:@"%ld评分",(long)filmHomeModel.CoinNum];
    [_FiveProogrese setProgress :filmHomeModel.filmStar_five animated:YES];
    _FoureProogrese.progress = filmHomeModel.filmStar_foure;
    _ThreeProogrese.progress = filmHomeModel.filmStar_three;
    _TwoProogrese.progress = filmHomeModel.filmStar_two;
    _OneProogrese.progress = filmHomeModel.filmStar_one;
}
@end
