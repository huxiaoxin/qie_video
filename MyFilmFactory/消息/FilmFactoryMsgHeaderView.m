//
//  FilmFactoryMsgHeaderView.m
//  FilmFactory
//
//  Created by codehzx on 2021/4/20.
//

#import "FilmFactoryMsgHeaderView.h"
#import "FilmFactoryBtn.h"
@interface FilmFactoryMsgHeaderView ()
@property(nonatomic,strong) UIView * Header;
@end
@implementation FilmFactoryMsgHeaderView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        UIView * header =[[UIView alloc]initWithFrame:CGRectMake(K(15), K(20), SCREEN_Width-K(30), K(80))];
        header.backgroundColor = [UIColor whiteColor];
        header.layer.cornerRadius  = K(5);
        header.layer.masksToBounds = YES;
        [self addSubview:header];
        [header viewShadowPathWithColor:LGDGaryColor shadowOpacity:0.5 shadowRadius:5 shadowPathType:LeShadowPathAround shadowPathWidth:5];
        NSArray * btnTitleArr = @[@"系统消息",@"点赞通知",@"评论通知"];
        for (int index = 0; index < btnTitleArr.count; index ++) {
            FilmFactoryBtn * filmBtn = [[FilmFactoryBtn alloc]initWithFrame:CGRectMake(CGRectGetWidth(header.frame)/btnTitleArr.count*index, K(10), CGRectGetWidth(header.frame)/btnTitleArr.count, K(80))];
            NSString * Str = btnTitleArr[index];
            if ([Str isEqual:@"系统消息"]) {
                Str = @"xitongtongzhi";
            }
            UIImage  * img = [UIImage imageNamed:Str];
            filmBtn.FilmFacotyImgView.image = img;
            filmBtn.FilmFacotrylb.text = btnTitleArr[index];
            filmBtn.tag = index;
            [filmBtn addTarget:self action:@selector(filmBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [header addSubview:filmBtn];
        }
        
    }
    return self;
}
-(void)filmBtnClick:(FilmFactoryBtn *)filmBtn{
    [self.delegate FilmFactoryMsgHeaderViewBtnClickWithbtnIndex:filmBtn.tag];
}
@end
