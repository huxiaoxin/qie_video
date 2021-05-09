//
//  FilmFactoryHomeHeaderView.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/21.
//

#import "FilmFactoryHomeHeaderView.h"
#import <KJBannerView.h>
#import "FilmFactoryMovieView.h"
#import "FilmFactoryHomeBtn.h"
#import <SDCycleScrollView.h>
@interface FilmFactoryHomeHeaderView ()<KJBannerViewDataSource,KJBannerViewDelegate,SDCycleScrollViewDelegate,FilmFactoryMovieViewDelegate>
@property(nonatomic,strong) KJBannerView   * Filmbanar;
@property(nonatomic,strong) NSMutableArray * banarModelArr;
@property(nonatomic,strong) FilmFactoryMovieView         * movieView;
@property(nonatomic,strong) SDCycleScrollView * SDCView;
@end
@implementation FilmFactoryHomeHeaderView
- (NSMutableArray *)banarModelArr{
    if (!_banarModelArr) {
        _banarModelArr = [NSMutableArray array];
    }
    return _banarModelArr;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.Filmbanar];
        [_Filmbanar kj_reloadBannerViewDatas];
        [self addSubview:self.movieView];
        
        UIView * btnView = [[UIView alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(_movieView.frame)+K(15), SCREEN_Width-K(30), K(60+20))];
        btnView.layer.cornerRadius = 5;
        btnView.backgroundColor =[UIColor whiteColor];
        [self addSubview:btnView];
        [btnView viewShadowPathWithColor:LGDLightGaryColor shadowOpacity:0.8 shadowRadius:5 shadowPathType:LeShadowPathAround shadowPathWidth:5];
        
        NSArray  * btnArr = @[@"企鹅好片",@"环球新片",@"即将上映",@"影视资讯"];
        for (int index = 0; index < btnArr.count; index ++) {
            FilmFactoryHomeBtn * homeBtn = [[FilmFactoryHomeBtn alloc]initWithFrame:CGRectMake(CGRectGetWidth(btnView.frame)/btnArr.count*index, K(10), CGRectGetWidth(btnView.frame)/btnArr.count, K(60))];
            homeBtn.FilmTopImgView.image = [UIImage imageNamed:btnArr[index]];
            homeBtn.FilmBtomlb.text = btnArr[index];
            homeBtn.tag = index;
            [homeBtn addTarget:self action:@selector(homeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [btnView addSubview:homeBtn];
        }
        
        UIImageView * FirstThubImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(btnView.frame)+K(10), SCREEN_Width-K(30), K(80))];
        FirstThubImgView.image = [UIImage imageNamed:@"line_img3"];
        [self addSubview:FirstThubImgView];
        
        int width = SCREEN_Width-K(30);
        SDCycleScrollView * SDCView = [[SDCycleScrollView alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(btnView.frame)+K(10), width, K(80))];
        SDCView.showPageControl = NO;
        SDCView.delegate = self;
        [self addSubview:SDCView];
        
        _SDCView = SDCView;
        
        
        UILabel * FilmFactoTitle = [[UILabel alloc]initWithFrame:CGRectMake(K(20), CGRectGetMaxY(SDCView.frame)+K(15), K(250), K(20))];
        FilmFactoTitle.textColor = [UIColor blackColor];
//        FilmFactoTitle.font = [UIFont boldSystemFontOfSize:20];
       
        [self addSubview:FilmFactoTitle];
        
//
        
        NSTextAttachment * attchment = [[NSTextAttachment alloc]init];
        attchment.image = [UIImage imageNamed:@"logo"];
        attchment.bounds  = CGRectMake(0, -3, K(25), K(25));
        
        NSAttributedString * attbute =[NSAttributedString attributedStringWithAttachment:attchment];
        NSMutableAttributedString * mutablAtt = [[NSMutableAttributedString alloc]initWithString:@"企鹅追剧"];
        [mutablAtt addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:18] range:NSMakeRange(0, 4)];
        [mutablAtt addAttribute:NSForegroundColorAttributeName value:LGDBLackColor range:NSMakeRange(0, 1)];
        [mutablAtt addAttribute:NSForegroundColorAttributeName value:LGDMianColor range:NSMakeRange(1, 1)];
        [mutablAtt addAttribute:NSForegroundColorAttributeName value:LGDBLackColor range:NSMakeRange(2, 1)];
        [mutablAtt addAttribute:NSForegroundColorAttributeName value:LGDMianColor range:NSMakeRange(3, 1)];
        [mutablAtt insertAttributedString:attbute atIndex:0];
        FilmFactoTitle .attributedText = mutablAtt;
        
        
        UILabel * Filfactomorelb = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_Width-K(115), CGRectGetMaxY(SDCView.frame)+K(15), K(100), K(20))];
        Filfactomorelb.userInteractionEnabled = YES;
        Filfactomorelb.textAlignment = NSTextAlignmentRight;
        Filfactomorelb.font = [UIFont systemFontOfSize:13];
        Filfactomorelb.textColor = LGDMianColor;
        [self addSubview:Filfactomorelb];
        
        UITapGestureRecognizer * moreTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(moreInfoTapClicks)];
        
        
        [Filfactomorelb addGestureRecognizer:moreTap];
        
        NSTextAttachment * lastMent = [[NSTextAttachment alloc]init];
        lastMent.image = [UIImage imageNamed:@"gengduo"];
        lastMent.bounds  = CGRectMake(0, -2, K(12), K(12));
        NSAttributedString * lastattbute =[NSAttributedString attributedStringWithAttachment:lastMent];
        NSMutableAttributedString * lastemutablAtt = [[NSMutableAttributedString alloc]initWithString:@"查看更多"];
        [lastemutablAtt addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(0, 4)];
        [lastemutablAtt addAttribute:NSForegroundColorAttributeName value:LGDMianColor range:NSMakeRange(0, 4)];

        [lastemutablAtt insertAttributedString:lastattbute atIndex:4];
        Filfactomorelb .attributedText = lastemutablAtt;
        
        
        
    }
    return self;
}
-(void)moreInfoTapClicks{
    [self.delegate FilmFactoryHomeHeaderViewMToMoreVc];
}
#pragma mark--FilmFactoryMovieViewDelegate
-(void)FilmFactoryMovieViewtap{
    [self.delegate FilmFactoryHomeHeaderViewToMovieDetail];
}
-(FilmFactoryMovieView *)movieView{
    if (!_movieView) {
        _movieView = [[FilmFactoryMovieView alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(_Filmbanar.frame)+K(10), SCREEN_Width-K(30), K(80))];
        _movieView.backgroundColor = LGDLightGaryColor;
        _movieView.layer.cornerRadius = K(5);
        _movieView.layer.masksToBounds = YES;
        _movieView.hidden = YES;
        _movieView.delegate = self;
    }
    return _movieView;
}
- (KJBannerView *)Filmbanar{
    if (!_Filmbanar) {
        _Filmbanar = [[KJBannerView alloc]initWithFrame:CGRectMake(0, K(15), SCREEN_Width, K(150))];
        _Filmbanar.delegate = self;
        _Filmbanar.dataSource = self;
        _Filmbanar.autoTime = 2;
        _Filmbanar.isZoom = YES;
        _Filmbanar.itemSpace = -K(5);
        _Filmbanar.itemWidth = K(280);
        _Filmbanar.hidden = YES;
    }
    return _Filmbanar;
}
- (NSArray *)kj_setDatasBannerView:(KJBannerView *)banner{
    return @[@"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.ykfq.net%2Fuploads%2Fallimg%2F200313%2F1Q501X56_0.jpg&refer=http%3A%2F%2Fwww.ykfq.net&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1623126659&t=ad6ea141de5999787eac422e97c57ca3",@"https://img.zcool.cn/community/01082b5d66845ba80120526d6f6394.jpg@1280w_1l_2o_100sh.jpg",@"https://image11.m1905.cn/uploadfile/2021/0421/20210421100904690123.jpg"];
}
- (void)kj_BannerView:(KJBannerView *)banner SelectIndex:(NSInteger)index{
    [self.delegate FilmFactoryHomeHeaderViewWithTopBanarIndex:index];
}
#pragma mark--SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    [self.delegate FilmFactoryHomeHeaderViewDidSeltecdWithBanarIndex:index];
}
-(void)homeBtnClick:(FilmFactoryHomeBtn *)filmbtn{
    [self.delegate FilmFactoryHomeHeaderViewBtnClickIndex:filmbtn.tag];
}
- (void)setIsSet:(BOOL)isSet{
    _isSet = isSet;
    _SDCView.imageURLStringsGroup = @[@"https://107cine.cdn.cinehello.com/shequn/sigma/line_img3.png",@"https://107cine.cdn.cinehello.com/shequn/sigma/line_img2.png",@"https://107cine.cdn.cinehello.com/shequn/sigma/line_img1.png"];

    _movieView.hidden =NO;
    _Filmbanar.hidden = NO;
}
@end
