//
//  FilmacroryMineTableViewCell.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/23.
//

#import "FilmacroryMineTableViewCell.h"
@interface FilmacroryMineTableViewCell ()
@property(nonatomic,strong) UIImageView * XiaoxinSetingIcon;
@property(nonatomic,strong) UILabel * XiaoxinIconlb;
@property(nonatomic,strong) UIView * FilmLine;
@end
@implementation FilmacroryMineTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle =  UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.XiaoxinSetingIcon];
        [self.contentView addSubview:self.XiaoxinIconlb];
        [self.contentView addSubview:self.XiaoxinRightlb];
        [self.contentView addSubview:self.FilmLine];

    }
    return self;
}
- (UILabel *)XiaoxinRightlb{
    if (!_XiaoxinRightlb) {
        _XiaoxinRightlb = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_Width-RealWidth(120+50),  RealWidth(15), RealWidth(100+50), RealWidth(20))];
        _XiaoxinRightlb.textAlignment = NSTextAlignmentRight;
        _XiaoxinRightlb.font = [UIFont systemFontOfSize:13];
        _XiaoxinRightlb.textColor = LGDGaryColor;

    }
    return _XiaoxinRightlb;
}
-(UIImageView *)XiaoxinSetingIcon{
    if (!_XiaoxinSetingIcon) {
        _XiaoxinSetingIcon = [[UIImageView alloc]initWithFrame:CGRectMake(RealWidth(20), RealWidth(15), RealWidth(20), RealWidth(20))];
    }
    return _XiaoxinSetingIcon;
}
-(UILabel *)XiaoxinIconlb{
    if (!_XiaoxinIconlb) {
        _XiaoxinIconlb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_XiaoxinSetingIcon.frame)+RealWidth(10), CGRectGetMidY(_XiaoxinSetingIcon.frame)-RealWidth(7), RealWidth(200), RealWidth(14))];
        _XiaoxinIconlb.textColor = LGDBLackColor;
        _XiaoxinIconlb.font = [UIFont systemFontOfSize:14];
    }
    return _XiaoxinIconlb;
}
- (UIView *)FilmLine{
    if (!_FilmLine) {
        _FilmLine = [[UIView alloc]initWithFrame:CGRectMake(K(15), K(49.5), SCREEN_Width-K(30), K(0.5))];
        _FilmLine.backgroundColor = LGDLightGaryColor;
    }
    return _FilmLine;
}
-(void)setXiaoxinIconStr:(NSString *)xiaoxinIconStr{
    _xiaoxinIconStr = xiaoxinIconStr;
    _XiaoxinIconlb.text =  xiaoxinIconStr;
    _XiaoxinSetingIcon.image = [UIImage imageNamed:xiaoxinIconStr];
    
}
@end
