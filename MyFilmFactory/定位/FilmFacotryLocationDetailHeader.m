//
//  FilmFacotryLocationDetailHeader.m
//  FilmFactory
//
//  Created by codehzx on 2021/4/25.
//

#import "FilmFacotryLocationDetailHeader.h"
#import <SDCycleScrollView.h>
@interface FilmFacotryLocationDetailHeader ()
@property(nonatomic,strong) SDCycleScrollView * FilmFactroyThubImgView;
@property(nonatomic,strong) UILabel    * FilmStatuslb;
@property(nonatomic,strong) UIButton   * FilmColltecdBtn;

@property(nonatomic,strong) UILabel    * FilmToplb;
@property(nonatomic,strong) UILabel    * FilmCemterlb;

@property(nonatomic,strong) UIView     *  FilmLine;
@end
@implementation FilmFacotryLocationDetailHeader
-(instancetype)initWithFrame:(CGRect)frame ConfigWithModel:(FilmFactortLoactionModel *)filmModel{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.FilmFactroyThubImgView];
        [self addSubview:self.FilmStatuslb];
        [self addSubview:self.FilmColltecdBtn];
        [self addSubview:self.FilmToplb];
        [self addSubview:self.FilmCemterlb];
        [self addSubview:self.FilmLine];
        
        _FilmFactroyThubImgView.imageURLStringsGroup =  filmModel.imgArrs;
        _FilmStatuslb.text = filmModel.isStart ?   @"活动已结束": @"活动进行中";
        _FilmColltecdBtn.selected = filmModel.isCollted;
        _FilmToplb.text =  filmModel.title;
        CGRect ToptitleRect  =[filmModel.title cxl_sizeWithMoreString:[UIFont systemFontOfSize:15] maxWidth:SCREEN_Width-K(30)];
        _FilmToplb.mj_size = ToptitleRect.size;
        
        
        CGRect CenteritleRect  =[filmModel.DetailDesc cxl_sizeWithMoreString:[UIFont systemFontOfSize:15] maxWidth:SCREEN_Width-K(30)];
        _FilmCemterlb.text = filmModel.DetailDesc;
        _FilmCemterlb.mj_size = CenteritleRect.size;
        
        self.FilmFacotryHeight = CGRectGetMaxY(_FilmCemterlb.frame)+K(10);

        if ([FilmFactoryToolModel FilmFactoryisLogin]) {
            _FilmColltecdBtn.selected = filmModel.isCollted;
        }else{
            _FilmColltecdBtn.selected = NO;
        }

    }
    return self;
}
-(void)FilmColltecdBtnClick:(UIButton *)myBtn{
    [self.delegate FilmFacotryLocationDetailHeaderBtnClick:myBtn];
}
- (SDCycleScrollView *)FilmFactroyThubImgView{
    if (!_FilmFactroyThubImgView) {
        _FilmFactroyThubImgView = [[SDCycleScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, K(150+30))];
        _FilmFactroyThubImgView.backgroundColor =  LGDLightGaryColor;
    }
    return _FilmFactroyThubImgView;
}
- (UILabel *)FilmStatuslb{
    if (!_FilmStatuslb) {
        _FilmStatuslb = [[UILabel alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(_FilmFactroyThubImgView.frame)+K(15), K(200), K(15))];
        _FilmStatuslb.text = @"活动进行中";
        _FilmStatuslb.textColor = [UIColor redColor];
        _FilmStatuslb.font =[UIFont systemFontOfSize:14];
    }
    return _FilmStatuslb;
}
- (UIButton *)FilmColltecdBtn{
    if (!_FilmColltecdBtn) {
        _FilmColltecdBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_Width-K(40), CGRectGetMaxY(_FilmFactroyThubImgView.frame)+K(15), K(20), K(20))];
        [_FilmColltecdBtn setBackgroundImage:[UIImage imageNamed:@"shoucang-nomal"] forState:UIControlStateNormal];
        [_FilmColltecdBtn setBackgroundImage:[UIImage imageNamed:@"shoucang"] forState:UIControlStateSelected];
        [_FilmColltecdBtn addTarget:self action:@selector(FilmColltecdBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _FilmColltecdBtn;
}
- (UILabel *)FilmToplb{
    if (!_FilmToplb) {
        
        CGRect FilmeRect = [@"42342184678264782154782547625467251467235467235467234568234568324" cxl_sizeWithMoreString:[UIFont systemFontOfSize:15] maxWidth:SCREEN_Width-K(30)];
        _FilmToplb = [[UILabel alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(_FilmColltecdBtn.frame)+K(15), FilmeRect.size.width, FilmeRect.size.height)];
        _FilmToplb.font = [UIFont systemFontOfSize:15];
        _FilmToplb.numberOfLines = 0;
        _FilmToplb.textColor = LGDBLackColor;
        _FilmToplb.text = @"42342184678264782154782547625467251467235467235467234568234568324";
    }
    return _FilmToplb;
}
- (UILabel *)FilmCemterlb{
    if (!_FilmCemterlb) {
        CGRect FilmeRect = [@"42342184678264782154782547625467251467235467235467234568234568324" cxl_sizeWithMoreString:[UIFont systemFontOfSize:15] maxWidth:SCREEN_Width-K(30)];

        _FilmCemterlb = [[UILabel alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(_FilmToplb.frame)+K(10), FilmeRect.size.width, FilmeRect.size.height)];
        _FilmCemterlb.numberOfLines = 0;
        _FilmCemterlb.textColor =LGDGaryColor;
        _FilmCemterlb.font = [UIFont systemFontOfSize:15];
        _FilmCemterlb.text = @"42342184678264782154782547625467251467235467235467234568234568324";
    }
    return _FilmCemterlb;
}
- (UIView *)FilmLine{
    if (!_FilmLine) {
        _FilmLine = [[UIView alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(_FilmCemterlb.frame)+K(15), SCREEN_Width-K(30), 1)];
        _FilmLine.backgroundColor = LGDLightGaryColor;
    }
    return _FilmLine;
}
@end
