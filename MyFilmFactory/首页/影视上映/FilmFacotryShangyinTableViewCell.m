//
//  FilmFacotryShangyinTableViewCell.m
//  FilmFactory
//
//  Created by codehzx on 2021/4/26.
//

#import "FilmFacotryShangyinTableViewCell.h"
#import "WWStarView.h"
@interface FilmFacotryShangyinTableViewCell ()
@property(nonatomic,strong) UIImageView * FilmThubImgView;
@property(nonatomic,strong) UILabel     * FilmToptitle;
@property(nonatomic,strong) UILabel     * FilmCenterlb;
@property(nonatomic,strong) UILabel     * FilmDeeplb;
@property(nonatomic,strong) UIView      * FilmStarView;
@property(nonatomic,strong) UIButton    * FilmWatchBtn;
@property(nonatomic,strong) WWStarView  * FilmstarView;
@end
@implementation FilmFacotryShangyinTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        UIImageView * FilmThubImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(15), K(10), K(80), K(100))];
        FilmThubImgView.layer.cornerRadius = K(5);
        FilmThubImgView.layer.masksToBounds = YES;
        FilmThubImgView.backgroundColor = LGDLightGaryColor;
        [self.contentView addSubview:FilmThubImgView];
        self.FilmThubImgView = FilmThubImgView;
        
        UILabel * FilmToplb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(FilmThubImgView.frame)+K(8), CGRectGetMinY(FilmThubImgView.frame)+K(5), SCREEN_Width-CGRectGetMaxX(FilmThubImgView.frame)-K(10), K(16))];
        FilmToplb.textColor = LGDBLackColor;
        FilmToplb.font = [UIFont boldSystemFontOfSize:15];
        FilmToplb.text = @"前臊";
        [self.contentView addSubview:FilmToplb];
        self.FilmToptitle = FilmToplb;
        
        
        UILabel * FilmCentlb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(FilmThubImgView.frame)+K(8), CGRectGetMaxY(FilmToplb.frame)+K(10), SCREEN_Width-CGRectGetMaxX(FilmThubImgView.frame)-K(10), K(15))];
        FilmCentlb.textColor = LGDLightBLackColor;
        FilmCentlb.font = [UIFont systemFontOfSize:13];
        FilmCentlb.text = @"汤姆。哈迪 米歇尔 威廉姆斯";
        [self.contentView addSubview:FilmCentlb];
        self.FilmCenterlb = FilmCentlb;
        
        UILabel * FilmDeeplb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(FilmThubImgView.frame)+K(8), CGRectGetMaxY(FilmCentlb.frame)+K(10), SCREEN_Width-CGRectGetMaxX(FilmThubImgView.frame)-K(10), K(15))];
        FilmDeeplb.textColor = LGDLightBLackColor;
        FilmDeeplb.font = [UIFont systemFontOfSize:13];
        FilmDeeplb.text = @"动作/科幻/惊悚/英语";
        [self.contentView addSubview:FilmDeeplb];
        self.FilmDeeplb  = FilmDeeplb;
        
        WWStarView * FilmStarview =[[WWStarView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(FilmThubImgView.frame)+K(8), CGRectGetMaxY(FilmDeeplb.frame)+K(10),K(100), K(15)) numberOfStars:5 currentStar:0 rateStyle:WholeStar isAnination:NO andamptyImageName:@"未评分" fullImageName:@"评分" finish:^(CGFloat currentStar) {
        }];
        FilmStarview.userInteractionEnabled =NO;
        [self.contentView addSubview:FilmStarview];
        _FilmstarView =  FilmStarview;
        
        
        UIButton * FilmWatchBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_Width-K(60), CGRectGetMaxY(FilmDeeplb.frame)+K(8), K(50), K(20))];
        FilmWatchBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [FilmWatchBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        FilmWatchBtn.titleLabel.font =[UIFont systemFontOfSize:12];
        FilmWatchBtn.layer.cornerRadius = K(5);
        FilmWatchBtn.layer.masksToBounds = YES;
        [FilmWatchBtn setBackgroundColor:[UIColor redColor]];
        [FilmWatchBtn setTitle:@"我想看" forState:UIControlStateNormal];
        [FilmWatchBtn addTarget:self action:@selector(FilmWatchBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:FilmWatchBtn];

    }
    return self;
}
- (void)setFilmHomeModel:(FilmFacotryHomeModel *)filmHomeModel{
    _filmHomeModel = filmHomeModel;
    [_FilmThubImgView sd_setImageWithURL:[NSURL URLWithString:filmHomeModel.imgTubUrl]];
    _FilmToptitle.text = filmHomeModel.famous;
    _FilmCenterlb.text =  filmHomeModel.articlList;
    _FilmstarView.currentStar = filmHomeModel.total_Num;

}
-(void)FilmWatchBtnClick{
    [self.delegate FilmFacotryShangyinTableViewCellWithbtnClick:self.tag];
}
@end
