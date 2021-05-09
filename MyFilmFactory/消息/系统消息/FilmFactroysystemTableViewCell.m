//
//  FilmFactroysystemTableViewCell.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/26.
//

#import "FilmFactroysystemTableViewCell.h"
@interface FilmFactroysystemTableViewCell ()
@property(nonatomic,strong) UILabel * FilmFactroyTimelb;
@property(nonatomic,strong) UIView  * FilmFactroyContentView;
@property(nonatomic,strong) UILabel * FilmFactroyTopTitle;
@property(nonatomic,strong) UILabel * FilmFactryDetailb;
@property(nonatomic,strong) UIView  * FilmLineView;
@property(nonatomic,strong) UILabel * FilmWatchlb;
@end
@implementation FilmFactroysystemTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor =  LGDLightGaryColor;
        [self.contentView addSubview:self.FilmFactroyTimelb];
        [self.contentView addSubview:self.FilmFactroyContentView];
        [_FilmFactroyContentView addSubview:self.FilmFactroyTopTitle];
        [_FilmFactroyContentView addSubview:self.FilmFactryDetailb];
        [_FilmFactroyContentView addSubview:self.FilmLineView];
        [_FilmFactroyContentView addSubview:self.FilmWatchlb];

        //hongdian
    }
    return self;
}
- (UILabel *)FilmFactroyTimelb{
    if (!_FilmFactroyTimelb) {
        _FilmFactroyTimelb = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_Width/2-K(70), K(10), K(140), K(25))];
        _FilmFactroyTimelb.textAlignment = NSTextAlignmentCenter;
        _FilmFactroyTimelb.font = [UIFont systemFontOfSize:K(13)];
        _FilmFactroyTimelb.textColor = [UIColor whiteColor];
        _FilmFactroyTimelb.text = @"2021-04-26 12:00:00";
        _FilmFactroyTimelb.layer.cornerRadius = K(12.5);
        _FilmFactroyTimelb.layer.masksToBounds = YES;
        _FilmFactroyTimelb.backgroundColor  =  LGDGaryColor;
    }
    return _FilmFactroyTimelb;
}
- (UIView *)FilmFactroyContentView{
    if (!_FilmFactroyContentView) {
        _FilmFactroyContentView  = [[UIView alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(_FilmFactroyTimelb.frame)+K(10), SCREEN_Width-K(30), K(120))];
        _FilmFactroyContentView.layer.cornerRadius = K(5);
        _FilmFactroyContentView.layer.masksToBounds = YES;
        _FilmFactroyContentView.layer.borderColor = LGDGaryColor.CGColor;
        _FilmFactroyContentView.backgroundColor = [UIColor whiteColor];
        _FilmFactroyContentView.layer.borderWidth = K(1);
    }
    return _FilmFactroyContentView;
}
- (UILabel *)FilmFactroyTopTitle{
    if (!_FilmFactroyTopTitle) {
        _FilmFactroyTopTitle = [[UILabel alloc]initWithFrame:CGRectMake(K(10), K(10), SCREEN_Width-K(30), K(20))];
//        _FilmFactroyTopTitle.textAlignment = NSTextAlignmentCenter;
        _FilmFactroyTopTitle.font = [UIFont systemFontOfSize:K(14)];
        _FilmFactroyTopTitle.textColor =  LGDBLackColor;
        NSTextAttachment * attment = [[NSTextAttachment alloc]init];
        attment.image = [UIImage imageNamed:@"hongdian"];
        attment.bounds = CGRectMake(0, 0, K(10), K(10));
        NSAttributedString * Attbute = [NSAttributedString attributedStringWithAttachment:attment];
        NSString  * TottalTitleStr = @"  关于5月3号企鹅追剧维护公告";
        NSMutableAttributedString * Attmuteble = [[NSMutableAttributedString alloc]initWithString:TottalTitleStr];
        [Attmuteble insertAttributedString:Attbute atIndex:0];
        _FilmFactroyTopTitle.attributedText = Attmuteble;
    }
    return _FilmFactroyTopTitle;
}
- (UILabel *)FilmFactryDetailb{
    if (!_FilmFactryDetailb) {
        _FilmFactryDetailb = [[UILabel alloc]initWithFrame:CGRectMake(K(10), CGRectGetMaxY(_FilmFactroyTopTitle.frame)+K(10), SCREEN_Width-K(40), K(40))];
        _FilmFactryDetailb.font = [UIFont systemFontOfSize:12];
        _FilmFactryDetailb.numberOfLines = 0;
        _FilmFactryDetailb.textColor =  LGDBLackColor;
        _FilmFactryDetailb.text = @"尊敬的用户，您好～！\n因服务器升级需要，企鹅追剧将于2021年5月3号服务器停机进行升级，届时app将无法访问大概有半个小时左右，还请大家稍安伪造等待一下，感谢各位的配合与支持，谢谢～";
    }
    return _FilmFactryDetailb;
}
- (UIView *)FilmLineView{
    if (!_FilmLineView) {
        _FilmLineView = [[UIView alloc]initWithFrame:CGRectMake(K(10), CGRectGetMaxY(_FilmFactryDetailb.frame)+K(5), CGRectGetWidth(_FilmFactroyContentView.frame)-K(20), K(1))];
        _FilmLineView.backgroundColor  = LGDLightGaryColor;
    }
    return _FilmLineView;
}
- (UILabel *)FilmWatchlb{
    if (!_FilmWatchlb) {
        _FilmWatchlb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(_FilmFactroyContentView.frame)-K(120), CGRectGetMaxY(_FilmLineView.frame)+K(10), K(100), K(14))];
        _FilmWatchlb.textAlignment =  NSTextAlignmentRight;
        _FilmWatchlb.font = [UIFont systemFontOfSize:K(12)];
        _FilmWatchlb.textColor = LGDBLackColor;
        _FilmWatchlb.text = @"查看详情";
    }
    return _FilmWatchlb;
}
@end
