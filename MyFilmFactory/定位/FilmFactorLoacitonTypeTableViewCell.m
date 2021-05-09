//
//  FilmFactorLoacitonTypeTableViewCell.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/23.
//

#import "FilmFactorLoacitonTypeTableViewCell.h"
@interface FilmFactorLoacitonTypeTableViewCell ()
@property(nonatomic,strong) UIImageView * FilmFactoryThubImgView;
@property(nonatomic,strong) UILabel     * FilmFactoryToplb;
@property(nonatomic,strong) UILabel     * FilmFactoryTaglb;
@property(nonatomic,strong) UILabel     * FilmFactoryTagTwolb;
@property(nonatomic,strong) UILabel     * FilmFactoryStatulb;
@property(nonatomic,strong) UILabel     *  FilmFactoryColletecdNumlb;
@property(nonatomic,strong) UIView      *  FilmLine;
@property(nonatomic,strong) UILabel     *  FimlTimelb;
@property(nonatomic,strong) UILabel     * FilmLoactiolb;
@end
@implementation FilmFactorLoacitonTypeTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.FilmFactoryThubImgView];
        [self.contentView addSubview:self.FilmFactoryToplb];
        [self.contentView addSubview:self.FilmFactoryTaglb];
        [self.contentView addSubview:self.FilmFactoryTagTwolb];
        [self.contentView addSubview:self.FilmFactoryStatulb];
        [self.contentView addSubview:self.FilmFactoryColletecdNumlb];
        [self.contentView addSubview:self.FilmLine];
        [self.contentView addSubview:self.FimlTimelb];
        [self.contentView addSubview:self.FilmLoactiolb];
    }
    return self;
}
- (UIImageView *)FilmFactoryThubImgView{
    if (!_FilmFactoryThubImgView) {
        _FilmFactoryThubImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(10), K(10), K(150), K(100))];
        _FilmFactoryThubImgView.backgroundColor = LGDLightGaryColor;
        _FilmFactoryThubImgView.layer.masksToBounds = YES;
        _FilmFactoryThubImgView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _FilmFactoryThubImgView;
}
- (UILabel *)FilmFactoryToplb{
    if (!_FilmFactoryToplb) {
        _FilmFactoryToplb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_FilmFactoryThubImgView.frame)+K(10), K(10), SCREEN_Width-CGRectGetMaxX(_FilmFactoryThubImgView.frame)-K(20), K(40))];
        _FilmFactoryToplb.numberOfLines = 0;
        NSString * FirstStr =  @"钱红孙:百威雇主品牌建设经验分享";
        NSString * SecondStr = @" (公开课|雇主)";
        
        NSMutableAttributedString * FilmMutableAtt = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@%@",FirstStr,SecondStr]];
        [FilmMutableAtt addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, FirstStr.length)];
        [FilmMutableAtt addAttribute:NSForegroundColorAttributeName value:LGDBLackColor range:NSMakeRange(0, FirstStr.length)];

        [FilmMutableAtt addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(FirstStr.length, SecondStr.length)];
        [FilmMutableAtt addAttribute:NSForegroundColorAttributeName value:LGDLightBLackColor range:NSMakeRange(FirstStr.length, SecondStr.length)];

        _FilmFactoryToplb.attributedText = FilmMutableAtt;
    }
    return _FilmFactoryToplb;
}
- (UILabel *)FilmFactoryTaglb{
    if (!_FilmFactoryTaglb) {
        _FilmFactoryTaglb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_FilmFactoryThubImgView.frame)+K(10), CGRectGetMaxY(_FilmFactoryToplb.frame)+K(10), K(50), K(20))];
        _FilmFactoryTaglb.layer.borderColor = LGDMianColor.CGColor;
        _FilmFactoryTaglb.layer.borderWidth = K(1);
        _FilmFactoryTaglb.layer.cornerRadius = K(5);
        _FilmFactoryTaglb.layer.masksToBounds = YES;
        _FilmFactoryTaglb.text = @"招聘配置";
        _FilmFactoryTaglb.textAlignment = NSTextAlignmentCenter;
        _FilmFactoryTaglb.font = [UIFont systemFontOfSize:12];
        _FilmFactoryTaglb.textColor = LGDMianColor;
    }
    return _FilmFactoryTaglb;
}
- (UILabel *)FilmFactoryTagTwolb{
    if (!_FilmFactoryTagTwolb) {
        _FilmFactoryTagTwolb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_FilmFactoryTaglb.frame)+K(10), CGRectGetMaxY(_FilmFactoryToplb.frame)+K(10), K(50), K(20))];
        _FilmFactoryTagTwolb.layer.borderColor = LGDMianColor.CGColor;
        _FilmFactoryTagTwolb.layer.borderWidth = K(1);
        _FilmFactoryTagTwolb.layer.cornerRadius = K(5);
        _FilmFactoryTagTwolb.layer.masksToBounds = YES;
        _FilmFactoryTagTwolb.text = @"招聘配置";
        _FilmFactoryTagTwolb.textAlignment = NSTextAlignmentCenter;
        _FilmFactoryTagTwolb.font = [UIFont systemFontOfSize:12];
        _FilmFactoryTagTwolb.textColor = LGDMianColor;
    }
    return _FilmFactoryTagTwolb;
}
- (UILabel *)FilmFactoryStatulb{
    if (!_FilmFactoryStatulb) {
        _FilmFactoryStatulb =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_FilmFactoryThubImgView.frame)+K(10), CGRectGetMaxY(_FilmFactoryTaglb.frame)+K(10), K(80), K(20))];
        _FilmFactoryStatulb.backgroundColor = [UIColor colorWithHexString:@"e6e6e6" Alpha:0.5];
//        [_FilmFactoryStatulb setText:@"活动已结束"];
        _FilmFactoryStatulb.layer.cornerRadius =K(5);
        _FilmFactoryStatulb.layer.masksToBounds = YES;
        _FilmFactoryStatulb.textAlignment = NSTextAlignmentCenter;
        _FilmFactoryStatulb.textColor = [UIColor redColor];
        _FilmFactoryStatulb.font = [UIFont systemFontOfSize:12];
    }
    return _FilmFactoryStatulb;
}
- (UILabel *)FilmFactoryColletecdNumlb{
    if (!_FilmFactoryColletecdNumlb) {
        _FilmFactoryColletecdNumlb = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_Width-K(115), CGRectGetMaxY(_FilmFactoryTaglb.frame)+K(13), K(100), K(15))];
        _FilmFactoryColletecdNumlb.textAlignment = NSTextAlignmentRight;
        _FilmFactoryColletecdNumlb.font = [UIFont systemFontOfSize:12];
//        _FilmFactoryColletecdNumlb.textColor = [UIColor redColor];
//        _FilmFactoryColletecdNumlb.text = @"1234";
        
        NSTextAttachment * attment = [[NSTextAttachment alloc]init];
        attment.image = [UIImage imageNamed:@"shoucang"];
        attment.bounds = CGRectMake(0, -2, K(10), K(10));
        NSAttributedString * Attbute =[NSAttributedString attributedStringWithAttachment:attment];
        NSMutableAttributedString * mutableAttbute =[[NSMutableAttributedString alloc]initWithString:@"  1234"];
        [mutableAttbute addAttribute:NSForegroundColorAttributeName value:LGDGaryColor range:NSMakeRange(2, 4)];
        [mutableAttbute insertAttributedString:Attbute atIndex:0];
        _FilmFactoryColletecdNumlb.attributedText = mutableAttbute;
        
    }
    return _FilmFactoryColletecdNumlb;
}
- (UIView *)FilmLine{
    if (!_FilmLine) {
        _FilmLine = [[UIView alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(_FilmFactoryThubImgView.frame)+K(10), SCREEN_Width-K(30), 1)];
        _FilmLine.backgroundColor = LGDLightGaryColor;
    }
    return _FilmLine;
}
- (UILabel *)FimlTimelb{
    if (!_FimlTimelb) {
        _FimlTimelb = [[UILabel alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(_FilmLine.frame)+K(10), SCREEN_Width-K(30), K(15))];
        
        
        _FimlTimelb.font = [UIFont systemFontOfSize:14];
        _FimlTimelb.textColor = [UIColor redColor];
        
        NSString * Str = [NSString stringWithFormat:@"  %@",@"活动时间:12/4 6:21:29 至 12/31 11:59:21"];

        NSTextAttachment * attment = [[NSTextAttachment alloc]init];
        attment.image = [UIImage imageNamed:@"shoucang"];
        attment.bounds = CGRectMake(0, -4, K(15), K(15));
        NSAttributedString * Attbute =[NSAttributedString attributedStringWithAttachment:attment];
        NSMutableAttributedString * mutableAttbute =[[NSMutableAttributedString alloc]initWithString:Str];
        [mutableAttbute addAttribute:NSForegroundColorAttributeName value:LGDGaryColor range:NSMakeRange(0, Str.length)];

        [mutableAttbute insertAttributedString:Attbute atIndex:0];
        _FimlTimelb.attributedText = mutableAttbute;

    }
    return _FimlTimelb;
}
- (UILabel *)FilmLoactiolb{
    if (!_FilmLoactiolb) {
        _FilmLoactiolb = [[UILabel alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(_FimlTimelb.frame)+K(10), SCREEN_Width-K(30), K(15))];
        
        _FilmLoactiolb.font = [UIFont systemFontOfSize:14];
        _FilmLoactiolb.textColor = [UIColor redColor];
        
        NSString * Str = [NSString stringWithFormat:@"  %@",@"活动地点：长春市朝阳区卡斯顿精品酒店四层上海厅"];
        NSTextAttachment * attment = [[NSTextAttachment alloc]init];
        attment.image = [UIImage imageNamed:@"shoucang"];
        attment.bounds = CGRectMake(0, -4, K(15), K(15));
        NSAttributedString * Attbute =[NSAttributedString attributedStringWithAttachment:attment];
        NSMutableAttributedString * mutableAttbute =[[NSMutableAttributedString alloc]initWithString:Str];
        [mutableAttbute addAttribute:NSForegroundColorAttributeName value:LGDGaryColor range:NSMakeRange(0, Str.length)];

        [mutableAttbute insertAttributedString:Attbute atIndex:0];
        _FilmLoactiolb.attributedText = mutableAttbute;

    }
    return _FilmLoactiolb;
}
- (void)setLoactionModel:(FilmFactortLoactionModel *)loactionModel{
    _loactionModel = loactionModel;
    [_FilmFactoryThubImgView sd_setImageWithURL:[NSURL URLWithString:loactionModel.FilmThubImgView]];
    NSString * FirstStr =  loactionModel.title;
    NSString * SecondStr = [NSString stringWithFormat:@" %@",loactionModel.titleDesc];
    
    NSMutableAttributedString * FilmMutableAtt = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@%@",FirstStr,SecondStr]];
    [FilmMutableAtt addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, FirstStr.length)];
    [FilmMutableAtt addAttribute:NSForegroundColorAttributeName value:LGDBLackColor range:NSMakeRange(0, FirstStr.length)];

    [FilmMutableAtt addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(FirstStr.length, SecondStr.length)];
    [FilmMutableAtt addAttribute:NSForegroundColorAttributeName value:LGDLightBLackColor range:NSMakeRange(FirstStr.length, SecondStr.length)];
    _FilmFactoryToplb.attributedText = FilmMutableAtt;
    
    _FilmFactoryTaglb.text = loactionModel.tageOne;
    _FilmFactoryTagTwolb.text = loactionModel.tagTwo;
    _FilmFactoryTagTwolb.hidden = loactionModel.tagTwo.length == 0 ? YES : NO;
    _FilmFactoryStatulb.text =  loactionModel.isStart ? @"活动已结束" :@"活动进行中";
    
    
    NSTextAttachment * attment1 = [[NSTextAttachment alloc]init];
    attment1.image = [UIImage imageNamed:@"shoucang"];
    attment1.bounds = CGRectMake(0, -2, K(10), K(10));
    NSString * thrreStr = [NSString stringWithFormat:@"  %ld",loactionModel.colltecdNum];

    NSAttributedString * Attbute1 =[NSAttributedString attributedStringWithAttachment:attment1];
    NSMutableAttributedString * mutableAttbute1 =[[NSMutableAttributedString alloc]initWithString:thrreStr];
    [mutableAttbute1 addAttribute:NSForegroundColorAttributeName value:LGDGaryColor range:NSMakeRange(0, thrreStr.length)];
    [mutableAttbute1 insertAttributedString:Attbute1 atIndex:0];
    _FilmFactoryColletecdNumlb.attributedText = mutableAttbute1;

    
    
    
    NSString * Str = [NSString stringWithFormat:@"  %@",[NSString stringWithFormat:@"活动时间:%@",loactionModel.joinTime]];

    NSTextAttachment * attment2 = [[NSTextAttachment alloc]init];
    attment2.image = [UIImage imageNamed:@"shijian"];
    attment2.bounds = CGRectMake(0, -2, K(15), K(15));
    NSAttributedString * Attbute2 =[NSAttributedString attributedStringWithAttachment:attment2];
    NSMutableAttributedString * mutableAttbute2 =[[NSMutableAttributedString alloc]initWithString:Str];
    [mutableAttbute2 addAttribute:NSForegroundColorAttributeName value:LGDGaryColor range:NSMakeRange(0, Str.length)];

    [mutableAttbute2 insertAttributedString:Attbute2 atIndex:0];
    _FimlTimelb.attributedText = mutableAttbute2;
    
    
    NSString * Str2 = [NSString stringWithFormat:@"  %@",[NSString stringWithFormat:@"活动地点：%@",loactionModel.loaction]];
    NSTextAttachment * attment3 = [[NSTextAttachment alloc]init];
    attment3.image = [UIImage imageNamed:@"didian"];
    attment3.bounds = CGRectMake(0, -2, K(15), K(15));
    NSAttributedString * Attbute3 =[NSAttributedString attributedStringWithAttachment:attment3];
    NSMutableAttributedString * mutableAttbute3 =[[NSMutableAttributedString alloc]initWithString:Str2];
    [mutableAttbute3 addAttribute:NSForegroundColorAttributeName value:LGDGaryColor range:NSMakeRange(0, Str2.length)];

    [mutableAttbute3 insertAttributedString:Attbute3 atIndex:0];
    _FilmLoactiolb.attributedText = mutableAttbute3;
    
    
    
}
@end
