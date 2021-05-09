#import "FilmFacorryZoneDetailheader.h"
#import <SDCycleScrollView/SDCycleScrollView.h>
#import <HUPhotoBrowser.h>
@interface FilmFacorryZoneDetailheader ()<SDCycleScrollViewDelegate>
{
    SDCycleScrollView  *  _FilmZoneThubIImgView;
    UIImageView * _FilmZoneMtImgview;
}
@property(nonatomic,strong) FilmFactoryZoneModel * BianselMode;
@end
@implementation FilmFacorryZoneDetailheader
-(instancetype)initWithFrame:(CGRect)frame ConfigZoneModel:(FilmFactoryZoneModel *)zoneModel{
    if (self = [super initWithFrame:frame]) {
        self.BianselMode = zoneModel;
        self.backgroundColor = LGDLightGaryColor;
        
        UIView * FilmZoneContenView = [[UIView alloc]initWithFrame:CGRectMake(0, K(10), SCREEN_Width, K(40))];
        FilmZoneContenView.backgroundColor = [UIColor whiteColor];
        FilmZoneContenView.userInteractionEnabled = YES;
        [self addSubview:FilmZoneContenView];
        
        UIImageView * FilmZoneConusriMhgveiw  = [[UIImageView alloc]initWithFrame:CGRectMake(K(17.5), K(17), K(34), K(34))];
        FilmZoneConusriMhgveiw.layer.cornerRadius = K(17);
        FilmZoneConusriMhgveiw.layer.masksToBounds = YES;
        [FilmZoneConusriMhgveiw setBackgroundColor:LGDLightGaryColor];
        [FilmZoneContenView addSubview:FilmZoneConusriMhgveiw];
        [FilmZoneConusriMhgveiw sd_setImageWithURL:[NSURL URLWithString:zoneModel.userImgIcon]];
        
        UILabel * FilmZoneContitleb =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(FilmZoneConusriMhgveiw.frame)+K(5), CGRectGetMinY(FilmZoneConusriMhgveiw.frame)+K(0), K(200), K(20))];
        FilmZoneContitleb.textColor = LGDBLackColor;
        FilmZoneContitleb.font =  KBlFont(14);
        FilmZoneContitleb.text =  @"木椅点";
        [FilmZoneContenView addSubview:FilmZoneContitleb];
        FilmZoneContitleb.text = zoneModel.name;
        
        UILabel * FilmZoneCotmelb =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(FilmZoneConusriMhgveiw.frame)+K(5), CGRectGetMaxY(FilmZoneContitleb.frame)+K(2), K(200), K(14))];
        FilmZoneCotmelb.textColor = LGDGaryColor;
        FilmZoneCotmelb.font =  KSysFont(10);
        FilmZoneCotmelb.text =  @"17分钟前";
        [FilmZoneContenView addSubview:FilmZoneCotmelb];
        FilmZoneCotmelb.text =  zoneModel.times;
        
        UIButton * FilmZoneCotmelahelb = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_Width-K(65), CGRectGetMidY(FilmZoneConusriMhgveiw.frame)-K(10), K(50), K(20))];
//        /FilmZoneCotmelahelb.BIanBtomlb.text = @"拉黑";
        FilmZoneCotmelahelb.layer.cornerRadius = K(5);
        FilmZoneCotmelahelb.layer.masksToBounds = YES;
        FilmZoneCotmelahelb.titleLabel.font = [UIFont systemFontOfSize:12];
        [FilmZoneCotmelahelb setBackgroundColor:LGDMianColor];
        FilmZoneCotmelahelb.tag = 0;
            [FilmZoneCotmelahelb setTitle:@"拉黑" forState:UIControlStateNormal];
        [FilmZoneCotmelahelb addTarget:self action:@selector(jubaodExperDetailBtnClick:) forControlEvents:UIControlEventTouchUpInside];

        [FilmZoneContenView addSubview:FilmZoneCotmelahelb];
        
        
        UIButton * FilmZoneCotmeljubaokbbtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMinX(FilmZoneCotmelahelb.frame)-K(60), CGRectGetMidY(FilmZoneConusriMhgveiw.frame)-K(10), K(50), K(20))];
        FilmZoneCotmeljubaokbbtn.tag = 1;
        FilmZoneCotmeljubaokbbtn.layer.cornerRadius = K(5);
        FilmZoneCotmeljubaokbbtn.layer.masksToBounds = YES;
        FilmZoneCotmeljubaokbbtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [FilmZoneCotmeljubaokbbtn setBackgroundColor:[UIColor redColor]];
        [FilmZoneCotmeljubaokbbtn addTarget:self action:@selector(jubaodExperDetailBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [FilmZoneCotmeljubaokbbtn setTitle:@"举报" forState:UIControlStateNormal];


        [FilmZoneContenView addSubview:FilmZoneCotmeljubaokbbtn];

        
        UILabel * BianuserContentlb =[[UILabel alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(FilmZoneConusriMhgveiw.frame)+K(5), K(200), K(14))];
        BianuserContentlb.textColor = [UIColor colorWithHexString:@"#333333"];
        BianuserContentlb.font =  KSysFont(12);
        BianuserContentlb.numberOfLines = 0;
        [FilmZoneContenView addSubview:BianuserContentlb];
        [BianuserContentlb setText:zoneModel.detail lineSpacing:K(3)];
        
        BianuserContentlb.size =  [BianuserContentlb getSpaceLabelSize:zoneModel.detail withFont:[UIFont systemFontOfSize:12] withWidth:SCREEN_Width-K(30) lineSpacing:K(3)];
        
        
        
        UIImageView * FilmZoneMtImgview = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(BianuserContentlb.frame)+K(8), SCREEN_Width-K(30), K(135))];
        FilmZoneMtImgview.userInteractionEnabled = YES;
        FilmZoneMtImgview.backgroundColor = [UIColor clearColor];
        [FilmZoneContenView addSubview:FilmZoneMtImgview];

        
        SDCycleScrollView  *  FilmZoneThubIImgView = [[SDCycleScrollView alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(BianuserContentlb.frame)+K(8), SCREEN_Width-K(30), K(180))];
        FilmZoneThubIImgView.imageURLStringsGroup = zoneModel.imgThuburls;
        FilmZoneThubIImgView.backgroundColor =  LGDLightGaryColor;
        FilmZoneThubIImgView.delegate = self;
        [FilmZoneContenView addSubview:FilmZoneThubIImgView];
        _FilmZoneThubIImgView = FilmZoneThubIImgView;
        
        FilmZoneContenView.height = CGRectGetMaxY(FilmZoneThubIImgView.frame)+K(20);
        
        self.FilmViewHeight = CGRectGetMaxY(FilmZoneContenView.frame)+K(10);
        
        _FilmZoneMtImgview = FilmZoneMtImgview;
        
        
    }
    return self;
}
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    [HUPhotoBrowser showFromImageView:_FilmZoneMtImgview withURLStrings:self.BianselMode.imgThuburls.copy atIndex:0];
}
-(void)jubaodExperDetailBtnClick:(UIButton * )filmBtn{
    [self.delegate FilmFacorryZoneDetailheaderWithBtnIndex:filmBtn.tag];
}
@end

