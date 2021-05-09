//
//  FilmFarZoneDetiaCell.m
//
//
//  Created by codehzx on 2020/10/31.
//

#import "FilmFarZoneDetiaCell.h"
@interface FilmFarZoneDetiaCell ()
@property(nonatomic,strong)  UIImageView * FilmZoneuserImgIcon;
@property(nonatomic,strong) UILabel *  FilmeZonenamelb;
@property(nonatomic,strong) UILabel *  FilmZonetimelb;
@property(nonatomic,strong) UILabel *  FilmZonecontentlb;
@property(nonatomic,strong) UIButton *  FilmzonebBtn;
@property(nonatomic,strong) UIView   * Filmzoneline;
@end
@implementation FilmFarZoneDetiaCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        UIImageView * FilmZoneuserImgIcon = [[UIImageView alloc]initWithFrame:CGRectMake(K(15.5), 0, K(41), K(41))];
        FilmZoneuserImgIcon.backgroundColor = LGDLightGaryColor;
        FilmZoneuserImgIcon.layer.cornerRadius = K(3);
        FilmZoneuserImgIcon.layer.masksToBounds = YES;
        [self.contentView addSubview:FilmZoneuserImgIcon];
        _FilmZoneuserImgIcon = FilmZoneuserImgIcon;
        
        
        UILabel *  FilmeZonenamelb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(FilmZoneuserImgIcon.frame)+K(5), CGRectGetMinY(FilmZoneuserImgIcon.frame), K(200), K(21))];
        FilmeZonenamelb.textColor =  [UIColor blackColor];
        FilmeZonenamelb.font = KBlFont(15);
        FilmeZonenamelb.text = @"食客7894";
        [self.contentView addSubview:FilmeZonenamelb];
        _FilmeZonenamelb= FilmeZonenamelb;
        
        
        UILabel *  FilmZonetimelb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(FilmZoneuserImgIcon.frame)+K(5), CGRectGetMaxY(FilmeZonenamelb.frame)+K(5), K(200), K(15))];
        FilmZonetimelb.textColor =  [UIColor colorWithHexString:@"#888888"];
        FilmZonetimelb.font = KSysFont(11);
        FilmZonetimelb.text = @"2020-10-20 13:00:00";
        [self.contentView addSubview:FilmZonetimelb];
        _FilmZonetimelb = FilmZonetimelb;
        
        
        UILabel *  FilmZonecontentlb = [[UILabel alloc]initWithFrame:CGRectMake(K(15.5), CGRectGetMaxY(FilmZoneuserImgIcon.frame)+K(14), K(200), K(15))];
        FilmZonecontentlb.textColor =  [UIColor colorWithHexString:@"#333333"];
        FilmZonecontentlb.font = KSysFont(15);
        FilmZonecontentlb.numberOfLines = 0;
        FilmZonecontentlb.text = @"非常好，下次还会再来";
        [self.contentView addSubview:FilmZonecontentlb];
        _FilmZonecontentlb = FilmZonecontentlb;
        


        UIButton *  FilmzonebBtn   = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_Width-K(36+20), K(0), K(50), K(20))];
        FilmzonebBtn.tag = 0;
        FilmzonebBtn.layer.cornerRadius = K(5);
        FilmzonebBtn.layer.masksToBounds = YES;
        FilmzonebBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [FilmzonebBtn setBackgroundColor:LGDMianColor];
            [FilmzonebBtn setTitle:@"拉黑" forState:UIControlStateNormal];
        [FilmzonebBtn addTarget:self action:@selector(FilmzonebBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        [self.contentView addSubview:FilmzonebBtn];
        _FilmzonebBtn = FilmzonebBtn;
        

        UIButton *  Filmzonejubaibtn   = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMinX(FilmzonebBtn.frame)-K(60), K(0), K(50), K(20))];
        Filmzonejubaibtn.tag = 1;
        Filmzonejubaibtn.layer.cornerRadius = K(5);
        Filmzonejubaibtn.layer.masksToBounds = YES;
        Filmzonejubaibtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [Filmzonejubaibtn setBackgroundColor:[UIColor redColor]];
            [Filmzonejubaibtn setTitle:@"举报" forState:UIControlStateNormal];
        [Filmzonejubaibtn addTarget:self action:@selector(FilmzonebBtnClick:) forControlEvents:UIControlEventTouchUpInside];

        [self.contentView addSubview:Filmzonejubaibtn];
        
        UIView * Filmzoneline = [[UIView alloc]initWithFrame:CGRectMake(K(15.5), CGRectGetMaxY(FilmZonecontentlb.frame)+K(14), SCREEN_Width-K(31), K(0.5))];
        Filmzoneline.backgroundColor = LGDLightGaryColor;
        [self.contentView addSubview:Filmzoneline];
        _Filmzoneline = Filmzoneline;
        
        
        
    }
    return self;
}
-(void)FilmzonebBtnClick:(UIButton *)btn{
    [self.delegate FilmFarZoneDetiaCellDetailTableViewCellWithIndex:self.tag FilmFarZoneDetiaCellbtnTag:btn.tag];
}
-(void)setComentModel:(FilmFactoryComentModel *)comentModel{
    _comentModel =  comentModel;
    [_FilmZoneuserImgIcon sd_setImageWithURL:[NSURL URLWithString:comentModel.imgurl]];
    _FilmeZonenamelb.text = comentModel.name;
    _FilmZonetimelb.text =  comentModel.time;
    _FilmZonecontentlb.text =  comentModel.content;
    _FilmZonecontentlb.size = [comentModel.content cxl_sizeWithMoreString:KSysFont(15) maxWidth:SCREEN_Width-K(31)].size;
    
    _Filmzoneline.mj_y = CGRectGetMaxY(_FilmZonecontentlb.frame)+K(20);
    comentModel.CellHeight = CGRectGetMaxY(_Filmzoneline.frame);
}
- (void)setFilmShangyinModel:(FilmFactoryShangyinModel *)filmShangyinModel{
    _filmShangyinModel = filmShangyinModel;
    [_FilmZoneuserImgIcon sd_setImageWithURL:[NSURL URLWithString:filmShangyinModel.imgurl]];
    _FilmeZonenamelb.text = filmShangyinModel.name;
    _FilmZonetimelb.text =  filmShangyinModel.time;
    _FilmZonecontentlb.text =  filmShangyinModel.content;
    _FilmZonecontentlb.size = [filmShangyinModel.content cxl_sizeWithMoreString:KSysFont(15) maxWidth:SCREEN_Width-K(31)].size;
    
    _Filmzoneline.mj_y = CGRectGetMaxY(_FilmZonecontentlb.frame)+K(20);
    filmShangyinModel.CellHeight = CGRectGetMaxY(_Filmzoneline.frame);
}
-(void)FilmzonebBtnClick{
    
}
-(void)FilmzonejubaibtnClick{
    
}
@end
