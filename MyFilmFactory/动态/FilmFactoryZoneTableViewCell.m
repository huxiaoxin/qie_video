//
//  FilmFactoryZoneTableViewCell.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/20.
//

#import "FilmFactoryZoneTableViewCell.h"
@interface FilmFactoryZoneTableViewCell ()
@property(nonatomic,strong) UIView * FilmFactoryIndicotrView;
@property(nonatomic,strong) UIImageView * FilmFactoyReVICE_paopaoIMgView;
@property(nonatomic,strong) UIImage * FilmFactoryReVICE_uiimaname;
@property(nonatomic,strong) UIImageView * FilmFactoryuserImgView;
@property(nonatomic,strong) UILabel * FilmFactoryToplb;
@property(nonatomic,strong) UILabel * FilmFactoryTimelb;
@property(nonatomic,strong) UIImageView * FilmThubImgView;
@property(nonatomic,strong) UILabel * FilmFacoryTopTitle;
@property(nonatomic,strong) UILabel * FilmFactorDetailb;
@property(nonatomic,strong) UILabel * FilmFacoryComentNumlb;
@property(nonatomic,strong) UIButton * FilmFacorypinbiBtn;
@property(nonatomic,strong) UIButton * FilmFactoryjubaoBtn;
@property(nonatomic,strong) UIButton * FilmFactorchatBtn;

@end
@implementation FilmFactoryZoneTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.FilmFactoryIndicotrView];
        [self.contentView addSubview:self.FilmFactoyReVICE_paopaoIMgView];
        [_FilmFactoyReVICE_paopaoIMgView addSubview:self.FilmFactoryuserImgView];
        [_FilmFactoyReVICE_paopaoIMgView addSubview:self.FilmFactoryToplb];
        [_FilmFactoyReVICE_paopaoIMgView addSubview:self.FilmFactoryTimelb];
        [_FilmFactoyReVICE_paopaoIMgView addSubview:self.FilmThubImgView];
        [_FilmFactoyReVICE_paopaoIMgView addSubview:self.FilmFacoryTopTitle];
        [_FilmFactoyReVICE_paopaoIMgView addSubview:self.FilmFactorDetailb];
        [_FilmFactoyReVICE_paopaoIMgView addSubview:self.FilmFacoryComentNumlb];
        [_FilmFactoyReVICE_paopaoIMgView addSubview:self.FilmFacorypinbiBtn];
        [_FilmFactoyReVICE_paopaoIMgView addSubview:self.FilmFactoryjubaoBtn];
        [_FilmFactoyReVICE_paopaoIMgView addSubview:self.FilmFactorchatBtn];

    }
    return self;
}
- (UIView *)FilmFactoryIndicotrView{
    if (!_FilmFactoryIndicotrView) {
        _FilmFactoryIndicotrView = [[UIView alloc]initWithFrame:CGRectMake(K(20), 0, K(2), K(195))];
        _FilmFactoryIndicotrView.backgroundColor = LGDMianColor;
    }
    return _FilmFactoryIndicotrView;
}
- (UIImageView *)FilmFactoyReVICE_paopaoIMgView{
    if (!_FilmFactoyReVICE_paopaoIMgView) {
        _FilmFactoyReVICE_paopaoIMgView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_FilmFactoryIndicotrView.frame)+(5), K(20), SCREEN_Width-CGRectGetMaxX(_FilmFactoryIndicotrView.frame)-K(20), K(150))];
        _FilmFactoyReVICE_paopaoIMgView.userInteractionEnabled = YES;
        _FilmFactoyReVICE_paopaoIMgView.image = self.FilmFactoryReVICE_uiimaname;
    }
    return _FilmFactoyReVICE_paopaoIMgView;
}
- (UIImageView *)FilmFactoryuserImgView{
    if (!_FilmFactoryuserImgView) {
        _FilmFactoryuserImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(20), K(10), K(35), K(35))];
        _FilmFactoryuserImgView.backgroundColor =  LGDLightGaryColor;
    }
    return _FilmFactoryuserImgView;
}
-(UILabel *)FilmFactoryToplb{
    if (!_FilmFactoryToplb) {
        _FilmFactoryToplb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_FilmFactoryuserImgView.frame)+K(9), CGRectGetMinY(_FilmFactoryuserImgView.frame)+K(1), K(200), K(15))];
        _FilmFactoryToplb.textColor =[UIColor blackColor];
        _FilmFactoryToplb.font = [UIFont systemFontOfSize:13];
        _FilmFactoryToplb.text = @"适马电影镜头";
    }
    return _FilmFactoryToplb;
}
-(UILabel *)FilmFactoryTimelb{
    if (!_FilmFactoryTimelb) {
        _FilmFactoryTimelb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_FilmFactoryuserImgView.frame)+K(9), CGRectGetMaxY(_FilmFactoryToplb.frame)+K(4), K(200), K(13))];
        _FilmFactoryTimelb.textColor = LGDGaryColor;
        _FilmFactoryTimelb.font = [UIFont systemFontOfSize:13];
        _FilmFactoryTimelb.text = @"13:29";
    }
    
    return _FilmFactoryTimelb;
}
- (UIImageView *)FilmThubImgView{
    if (!_FilmThubImgView) {
        _FilmThubImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(20), CGRectGetMaxY(_FilmFactoryuserImgView.frame)+K(10), K(140), K(80))];
        _FilmThubImgView.backgroundColor = LGDLightGaryColor;
        _FilmThubImgView.layer.cornerRadius = 5;
        _FilmThubImgView.layer.masksToBounds = YES;
        _FilmThubImgView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _FilmThubImgView;
}
- (UILabel *)FilmFacoryTopTitle{
    if (!_FilmFacoryTopTitle) {
        _FilmFacoryTopTitle = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_FilmThubImgView.frame)+K(10), CGRectGetMinY(_FilmThubImgView.frame), CGRectGetWidth(_FilmFactoyReVICE_paopaoIMgView.frame)-CGRectGetMaxX(_FilmThubImgView.frame)-K(10), K(30))];
        _FilmFacoryTopTitle.numberOfLines = 2;
        _FilmFacoryTopTitle.font =[UIFont systemFontOfSize:13];
        _FilmFacoryTopTitle.textColor =[UIColor blackColor];
        _FilmFacoryTopTitle.text = @"长焦镜头拍摄的魅力，你学会了吗？";
    }
    return _FilmFacoryTopTitle;
}
- (UILabel *)FilmFactorDetailb{
    if (!_FilmFactorDetailb) {
        _FilmFactorDetailb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_FilmThubImgView.frame)+K(10), CGRectGetMaxY(_FilmFacoryTopTitle.frame), CGRectGetWidth(_FilmFactoyReVICE_paopaoIMgView.frame)-CGRectGetMaxX(_FilmThubImgView.frame)-K(15), K(50))];
        _FilmFactorDetailb.numberOfLines = 0;
        _FilmFactorDetailb.textColor = LGDGaryColor;
        _FilmFactorDetailb.font = [UIFont systemFontOfSize:12];
        _FilmFactorDetailb.text = @"长焦镜头最初是为了解决摄影师无法近距离拍摄而发明的，此后由于其对空间和视野的影响，它已成为电影摄影的重要部分。长焦镜头是讲述故事的有力工具，因为它与普通人眼所看到的空间有很大不同，电影人出于各种原因而使用到它。";
    }
    return _FilmFactorDetailb;
}
- (UIButton *)FilmFacorypinbiBtn{
    if (!_FilmFacorypinbiBtn) {
        _FilmFacorypinbiBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(_FilmFactoyReVICE_paopaoIMgView.frame)-K(60), CGRectGetMidY(_FilmFactoryuserImgView.frame)-K(15), K(40), K(20))];
        _FilmFacorypinbiBtn.tag = 2;
        [_FilmFacorypinbiBtn setBackgroundColor:LGDMianColor];
        [_FilmFacorypinbiBtn setTitle:@"屏蔽" forState:UIControlStateNormal];
        [_FilmFacorypinbiBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _FilmFacorypinbiBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        _FilmFacorypinbiBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        _FilmFacorypinbiBtn.layer.cornerRadius = K(5);
        _FilmFacorypinbiBtn.layer.masksToBounds = YES;
        [_FilmFacorypinbiBtn addTarget:self action:@selector(FilmFactorchatBtnClick:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _FilmFacorypinbiBtn;
}
- (UIButton *)FilmFactoryjubaoBtn{
    if (!_FilmFactoryjubaoBtn) {
        _FilmFactoryjubaoBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMinX(_FilmFacorypinbiBtn.frame)-K(50), CGRectGetMidY(_FilmFactoryuserImgView.frame)-K(15), K(40), K(20))];
        _FilmFactoryjubaoBtn.tag = 1;
        [_FilmFactoryjubaoBtn setBackgroundColor:[UIColor redColor]];
        [_FilmFactoryjubaoBtn setTitle:@"举报" forState:UIControlStateNormal];
        [_FilmFactoryjubaoBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _FilmFactoryjubaoBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        _FilmFactoryjubaoBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        _FilmFactoryjubaoBtn.layer.cornerRadius = K(5);
        _FilmFactoryjubaoBtn.layer.masksToBounds = YES;
        [_FilmFactoryjubaoBtn addTarget:self action:@selector(FilmFactorchatBtnClick:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _FilmFactoryjubaoBtn;
}
- (UIButton *)FilmFactorchatBtn{
    if (!_FilmFactorchatBtn) {
        _FilmFactorchatBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMinX(_FilmFactoryjubaoBtn.frame)-K(50), CGRectGetMidY(_FilmFactoryuserImgView.frame)-K(15), K(40), K(20))];
        _FilmFactorchatBtn.tag = 0;
        [_FilmFactorchatBtn setBackgroundColor:[UIColor colorWithHexString:@"0000FF"]];
        [_FilmFactorchatBtn setTitle:@"密聊" forState:UIControlStateNormal];
        [_FilmFactorchatBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _FilmFactorchatBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        _FilmFactorchatBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        _FilmFactorchatBtn.layer.cornerRadius = K(5);
        _FilmFactorchatBtn.layer.masksToBounds = YES;
        [_FilmFactorchatBtn addTarget:self action:@selector(FilmFactorchatBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _FilmFactorchatBtn;
}

- (UIImage *)FilmFactoryReVICE_uiimaname{
    if (!_FilmFactoryReVICE_uiimaname) {
        UIImage *image  = [UIImage imageNamed:@"wzm_chat_bj1"];
        CGSize size = image.size;
        _FilmFactoryReVICE_uiimaname = [image stretchableImageWithLeftCapWidth:size.width/2 topCapHeight:size.height*0.8];
    }
    return _FilmFactoryReVICE_uiimaname;
}
- (void)setFilmModel:(FilmFactoryZoneModel *)filmModel{
    _filmModel = filmModel;
    [_FilmFactoryuserImgView sd_setImageWithURL:[NSURL URLWithString:filmModel.userImgIcon]];
    _FilmFactoryToplb.text = filmModel.name;
    _FilmFactoryTimelb.text = filmModel.times;
    NSString * thubStr =  [filmModel.imgThuburls objectAtIndex:0];
    [_FilmThubImgView sd_setImageWithURL:[NSURL URLWithString:thubStr]];
    _FilmFacoryTopTitle.text =  filmModel.title;
    _FilmFactorDetailb.text =  filmModel.detail;
}
-(void)FilmFactorchatBtnClick:(UIButton *)mybtn{
    [self.delegate FilmFactoryZoneTableViewCellWithBtnClickIndex:mybtn.tag CellConfigIndex:self.myIndexpath];
}
@end
