//
//  FilmFacotryShangyinDetailHeader.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/27.
//

#import "FilmFacotryShangyinDetailHeader.h"
#import "FilmFacoreyCoinView.h"
#import "FilmFacotryArticlCollectionViewCell.h"
@interface FilmFacotryShangyinDetailHeader ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong) UIImageView * FilmThubImgView;
@property(nonatomic,strong) UILabel     * FilmToptitlelb;
@property(nonatomic,strong) UILabel     * FilmSecondlb;
@property(nonatomic,strong) UILabel     * FilmThreelb;
@property(nonatomic,strong) UILabel     * FilmFourelb;
@property(nonatomic,strong) UIButton    * FilmCollecionBtn;
@property(nonatomic,strong) FilmFacoreyCoinView      * FilmCoinView;
@property(nonatomic,strong) UILabel     * FilmIntroucelb;
@property(nonatomic,strong) UILabel     * FilmIntrouceDetailb;
@property(nonatomic,strong) UILabel     * FilmArticlb;
@property(nonatomic,strong) UICollectionView * FilmCollectionView;
@property(nonatomic,strong) FilmFacotryHomeModel * selFilmModel;
@end
@implementation FilmFacotryShangyinDetailHeader
-(instancetype)initWithFrame:(CGRect)frame WithConfig:(FilmFacotryHomeModel *)filmModel{
    if (self = [super initWithFrame:frame]) {
        self.selFilmModel = filmModel;
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.FilmThubImgView];
        [self addSubview:self.FilmToptitlelb];
        [self addSubview:self.FilmSecondlb];
        [self addSubview:self.FilmThreelb];
        [self addSubview:self.FilmFourelb];
        [self addSubview:self.FilmCollecionBtn];
        [self addSubview:self.FilmCoinView];
        
        
        
        
        [self addSubview:self.FilmIntroucelb];
        [self addSubview:self.FilmIntrouceDetailb];
        NSString * Desc = self.selFilmModel.intrduce;
        CGSize DescSiz =   [_FilmIntrouceDetailb getSpaceLabelSize:Desc withFont:[UIFont systemFontOfSize:13] withWidth:SCREEN_Width-K(24) lineSpacing:K(3)];
        _FilmIntrouceDetailb.size = DescSiz;
        [self addSubview:self.FilmArticlb];
        [self addSubview:self.FilmCollectionView];

        [_FilmCollectionView reloadData];
    }
    return self;
}
-(CGFloat)FilmFacotryShangyinDetailHeaderHeight{
    return CGRectGetMaxY(_FilmCollectionView.frame)+K(10);
}
-(UIImageView *)FilmThubImgView{
    if (!_FilmThubImgView) {
        _FilmThubImgView =[[UIImageView alloc]initWithFrame:CGRectMake(K(15), K(15), K(80), K(110))];
        _FilmThubImgView.layer.cornerRadius = K(5);
        _FilmThubImgView.layer.masksToBounds = YES;
        _FilmThubImgView.backgroundColor = LGDLightGaryColor;
        [_FilmThubImgView sd_setImageWithURL:[NSURL URLWithString:self.selFilmModel.imgTubUrl]];
    }
    return _FilmThubImgView;
}
- (UILabel *)FilmToptitlelb{
    if (!_FilmToptitlelb) {
        _FilmToptitlelb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_FilmThubImgView.frame)+K(10), CGRectGetMinY(_FilmThubImgView.frame)+K(5), SCREEN_Width-CGRectGetMaxX(_FilmThubImgView.frame)-K(10), K(17))];
        _FilmToptitlelb.text  =  self.selFilmModel.famous;
        _FilmToptitlelb.font  = [UIFont boldSystemFontOfSize:16];
        _FilmToptitlelb.textColor = LGDLightBLackColor;
    }
    return _FilmToptitlelb;
}
-(UILabel *)FilmSecondlb{
    if (!_FilmSecondlb) {
        _FilmSecondlb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_FilmThubImgView.frame)+K(10), CGRectGetMaxY(_FilmToptitlelb.frame)+K(5), SCREEN_Width-CGRectGetMaxX(_FilmThubImgView.frame)-K(10), K(15))];
        _FilmSecondlb.text  =  self.selFilmModel.englishNae;
        _FilmSecondlb.font  = [UIFont boldSystemFontOfSize:14];
        _FilmSecondlb.textColor = LGDLightBLackColor;
    }
    return _FilmSecondlb;
}
- (UILabel *)FilmThreelb{
    if (!_FilmThreelb) {
        _FilmThreelb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_FilmThubImgView.frame)+K(10), CGRectGetMaxY(_FilmSecondlb.frame)+K(5), SCREEN_Width-CGRectGetMaxX(_FilmThubImgView.frame)-K(10), K(15))];
        _FilmThreelb.text  =  self.selFilmModel.filmtype;
        _FilmThreelb.font  = [UIFont boldSystemFontOfSize:12];
        _FilmThreelb.textColor = LGDGaryColor;
    }
    return _FilmThreelb;
}
- (UILabel *)FilmFourelb{
    if (!_FilmFourelb) {
        _FilmFourelb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_FilmThubImgView.frame)+K(10), CGRectGetMaxY(_FilmThreelb.frame)+K(5), SCREEN_Width-CGRectGetMaxX(_FilmThubImgView.frame)-K(10), K(15))];
        _FilmFourelb.text  = [NSString stringWithFormat:@"%@(中国大陆)上映",self.selFilmModel.time];

        _FilmFourelb.font  = [UIFont boldSystemFontOfSize:12];
        _FilmFourelb.textColor = LGDGaryColor;
    }
    return _FilmFourelb;
}
- (UIButton *)FilmCollecionBtn{
    if (!_FilmCollecionBtn) {
        _FilmCollecionBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_FilmThubImgView.frame)+K(10), CGRectGetMaxY(_FilmFourelb.frame)+K(5), K(60), K(20))];
        [_FilmCollecionBtn setTitle:@"收藏" forState:UIControlStateNormal];
        _FilmCollecionBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_FilmCollecionBtn setTitleColor:LGDMianColor forState:UIControlStateNormal];
        _FilmCollecionBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        _FilmCollecionBtn.layer.cornerRadius = K(10);
        _FilmCollecionBtn.layer.masksToBounds = YES;
        _FilmCollecionBtn.layer.borderColor = LGDMianColor.CGColor;
        _FilmCollecionBtn.layer.borderWidth = K(1);
        [_FilmCollecionBtn addTarget:self action:@selector(FilmCollecionBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        if ([FilmFactoryToolModel FilmFactoryisLogin]) {
            [_FilmCollecionBtn setBackgroundColor:LGDMianColor];
            [_FilmCollecionBtn setTitle:@"已收藏" forState:UIControlStateNormal];
            [_FilmCollecionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }else{
            [_FilmCollecionBtn setBackgroundColor:[UIColor whiteColor]];
            [_FilmCollecionBtn setTitle:@"收藏" forState:UIControlStateNormal];
            [_FilmCollecionBtn setTitleColor:LGDMianColor forState:UIControlStateNormal];

        }
    }
    return _FilmCollecionBtn;
}
- (FilmFacoreyCoinView *)FilmCoinView{
    if (!_FilmCoinView) {
        _FilmCoinView = [[FilmFacoreyCoinView alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(_FilmThubImgView.frame)+K(10), SCREEN_Width-K(30), K(110))];
        _FilmCoinView.backgroundColor = LGDLightGaryColor;
        _FilmCoinView.layer.cornerRadius = K(5);
        _FilmCoinView.layer.masksToBounds = YES;
        _FilmCoinView.filmHomeModel = self.selFilmModel;
    }
    return _FilmCoinView;
}
- (UILabel *)FilmIntroucelb{
    if (!_FilmIntroucelb) {
        _FilmIntroucelb = [[UILabel alloc]initWithFrame:CGRectMake(K(12), CGRectGetMaxY(_FilmCoinView.frame)+K(10), K(200), K(19))];
        _FilmIntroucelb.textColor =LGDBLackColor;
        _FilmIntroucelb.font = [UIFont boldSystemFontOfSize:16];
        _FilmIntroucelb.text = @"剧情简介";
    }
    return _FilmIntroucelb;
}
- (UILabel *)FilmIntrouceDetailb{
    if (!_FilmIntrouceDetailb) {
        NSString * Desc = self.selFilmModel.intrduce;
      CGSize DescSiz =   [_FilmIntrouceDetailb getSpaceLabelSize:Desc withFont:[UIFont systemFontOfSize:13] withWidth:SCREEN_Width-K(24) lineSpacing:K(3)];
        _FilmIntrouceDetailb = [[UILabel alloc]initWithFrame:CGRectMake(K(12), CGRectGetMaxY(_FilmIntroucelb.frame)+K(10), DescSiz.width, DescSiz.height)];
        _FilmIntrouceDetailb.font =[UIFont systemFontOfSize:13];
        _FilmIntrouceDetailb.numberOfLines = 0;
        _FilmIntrouceDetailb.textColor = LGDLightBLackColor;
//        _FilmIntrouceDetailb.text=  Desc;
        [_FilmIntrouceDetailb setText:Desc lineSpacing:K(3)];
    }
    return _FilmIntrouceDetailb;
}
- (UILabel *)FilmArticlb{
    if (!_FilmArticlb) {
        _FilmArticlb = [[UILabel alloc]initWithFrame:CGRectMake(K(10), CGRectGetMaxY(_FilmIntrouceDetailb.frame)+K(10), K(200), K(19))];
        _FilmArticlb.textColor =LGDBLackColor;
        _FilmArticlb.font = [UIFont boldSystemFontOfSize:16];
        _FilmArticlb.text = @"演职人员";
    }
    return _FilmArticlb;
}
- (UICollectionView *)FilmCollectionView{
    if (!_FilmCollectionView) {
        UICollectionViewFlowLayout * FilmLayout = [[UICollectionViewFlowLayout alloc]init];
        FilmLayout.itemSize = CGSizeMake(K(80), K(80));
        FilmLayout.scrollDirection =   UICollectionViewScrollDirectionHorizontal;
        FilmLayout.minimumInteritemSpacing = K(4);
        FilmLayout.sectionInset = UIEdgeInsetsMake(K(10), 0, 0, 0);
        _FilmCollectionView =[[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_FilmArticlb.frame), SCREEN_Width, K(90)) collectionViewLayout:FilmLayout];
        _FilmCollectionView.delegate  =self;
        _FilmCollectionView.dataSource = self;
        _FilmCollectionView.showsVerticalScrollIndicator = NO;
        _FilmCollectionView.showsHorizontalScrollIndicator = NO;
        _FilmCollectionView.backgroundColor = [UIColor clearColor];
        [_FilmCollectionView registerClass:[FilmFacotryArticlCollectionViewCell class] forCellWithReuseIdentifier:@"FilmFacotryArticlCollectionViewCell"];
    }
    return _FilmCollectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.selFilmModel.ListArr.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FilmFacotryArticlCollectionViewCell * FilmCoinCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FilmFacotryArticlCollectionViewCell" forIndexPath:indexPath];
    FilmCoinCell.FilmDic = self.selFilmModel.ListArr[indexPath.row];
    return FilmCoinCell;
}
-(void)FilmCollecionBtnClick:(UIButton *)btn{
    [self.delegate FilmFacotryShangyinDetailHeaderDidSeltecdWithAction:btn];
}
@end
