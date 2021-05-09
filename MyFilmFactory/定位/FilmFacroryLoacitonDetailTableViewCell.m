//
//  FilmFacroryLoacitonDetailTableViewCell.m
//  FilmFactory
//
//  Created by codehzx on 2021/4/25.
//

#import "FilmFacroryLoacitonDetailTableViewCell.h"
@interface FilmFacroryLoacitonDetailTableViewCell ()
@property(nonatomic,strong) UILabel * FimlTitle;
@end
@implementation FilmFacroryLoacitonDetailTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor =[UIColor whiteColor];
        [self.contentView addSubview:self.FimlTitle];
        self.selectionStyle =  UITableViewCellSelectionStyleNone;
        
    }
    return self;
}
-(UILabel *)FimlTitle{
    if (!_FimlTitle) {
        _FimlTitle  =[[UILabel alloc]initWithFrame:CGRectMake(K(15), 0, SCREEN_Width-K(30), K(30))];
        _FimlTitle.textColor = [UIColor blueColor];
        _FimlTitle.font = [UIFont systemFontOfSize:14];
        _FimlTitle.text = @"报名时间 | 4/24 00:00 至 5/13 00：00";
    }
    return _FimlTitle;
}
- (void)setFilmStr:(NSString *)FilmStr{
    _FilmStr = FilmStr;
    
    NSMutableAttributedString * MutablAttr = [[NSMutableAttributedString alloc]initWithString:FilmStr];
//
//    [MutablAttr addAttribute:NSFontAttributeName value:LGDMianColor range:NSMakeRange(0, 4)];
//    [MutablAttr addAttribute:NSFontAttributeName value:LGDGaryColor range:NSMakeRange(4, FilmStr.length-4)];

    
    _FimlTitle.attributedText = MutablAttr;
//    _FimlTitle.text = FilmStr;
}
-(void)FilmFacroryLoacitonDetailTableViewCellConfig:(NSMutableArray *)leftArr FilmoIndex:(NSIndexPath *)index{
    
    NSString * myStr  =leftArr[index.row];
    NSString * firstStr;
    
    if (index.row == 0) {
        firstStr = @"报名时间";
    }else if (index.row == 1){
        firstStr = @"活动时间";
    }else if (index.row == 2){
        firstStr = @"活动地点";
    }else{
        firstStr = @"联系电话";
    }
    NSString * SeconStr = [NSString stringWithFormat:@"  %@",myStr];
    
    NSMutableAttributedString * mutablAtr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@%@",firstStr,SeconStr]];
    [mutablAtr addAttribute:NSForegroundColorAttributeName value:LGDRedColor range:NSMakeRange(0, firstStr.length)];
    [mutablAtr addAttribute:NSForegroundColorAttributeName value:LGDGaryColor range:NSMakeRange(firstStr.length, SeconStr.length)];

    _FimlTitle.attributedText = mutablAtr;
    
}
@end
