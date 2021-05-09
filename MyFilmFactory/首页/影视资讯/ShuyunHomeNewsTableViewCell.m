//
//  ShuyunHomeNewsTableViewCell.m
//  ShuyunSport
//
//  Created by codehzx on 2020/10/21.
//

#import "ShuyunHomeNewsTableViewCell.h"
@interface ShuyunHomeNewsTableViewCell ()
@property(nonatomic,strong) UIImageView * ShuyunThubImgView;
@property(nonatomic,strong) UILabel * ShuyunBallNamelb;
@property(nonatomic,strong) UILabel * ShuyunTimelb;
@end
@implementation ShuyunHomeNewsTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIImageView * ShuyunThubImgView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_Width-K(122+16), K(14), K(122), K(91.5))];
        ShuyunThubImgView.backgroundColor = LGDLightGaryColor;
        [self.contentView addSubview:ShuyunThubImgView];
        _ShuyunThubImgView = ShuyunThubImgView;
        
        
        UIView * Shuyunline = [[UIView alloc]initWithFrame:CGRectMake(K(16), K(118), SCREEN_Width-K(32), K(1))];
        Shuyunline.backgroundColor =  LGDLightGaryColor;
        [self.contentView addSubview:Shuyunline];
        
        UILabel * ShuyunBallNamelb = [[UILabel alloc]initWithFrame:CGRectMake(K(16), K(13), K(200), K(66.5))];
        ShuyunBallNamelb.numberOfLines = 0;
        ShuyunBallNamelb.text = @"中超-特谢拉低射破门AK27头槌追平 当代1-1苏宁中超-特谢拉低射破门…";
        ShuyunBallNamelb.textColor = LGDLightBLackColor;
        ShuyunBallNamelb.font = KBlFont(16);
        [self.contentView addSubview:ShuyunBallNamelb];
        _ShuyunBallNamelb = ShuyunBallNamelb;
        
        UILabel * ShuyunTimelb = [[UILabel alloc]initWithFrame:CGRectMake(K(16), K(90.5), K(200), K(15))];
        ShuyunTimelb.text = @"浏览：3201";
        ShuyunTimelb.textColor = [UIColor colorWithHexString:@"#888888"];
        ShuyunTimelb.font = KBlFont(11);
        [self.contentView addSubview:ShuyunTimelb];
        _ShuyunTimelb = ShuyunTimelb;
        
    }
    return self;
}
-(void)setNewsModel:(ShuyunHomeNewsModel *)newsModel{
    _newsModel = newsModel;
    [_ShuyunThubImgView sd_setImageWithURL:[NSURL URLWithString:newsModel.imgUrl]];
    _ShuyunBallNamelb.text = newsModel.title;
    _ShuyunTimelb.text = newsModel.time;
}
@end
