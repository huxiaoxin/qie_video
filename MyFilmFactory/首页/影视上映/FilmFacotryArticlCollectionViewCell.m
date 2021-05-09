//
//  FilmFacotryArticlCollectionViewCell.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/27.
//

#import "FilmFacotryArticlCollectionViewCell.h"
@interface FilmFacotryArticlCollectionViewCell ()
@property(nonatomic,strong) UIImageView * FilFacoteryThubImgView;
@property(nonatomic,strong) UILabel *    FilFacoterylb;

@end
@implementation FilmFacotryArticlCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor =[UIColor clearColor];
        [self.contentView addSubview:self.FilFacoteryThubImgView];
        [self.contentView addSubview:self.FilFacoterylb];
    }
    return self;
}
- (UIImageView *)FilFacoteryThubImgView{
    if (!_FilFacoteryThubImgView) {
        _FilFacoteryThubImgView = [UIImageView new];
        _FilFacoteryThubImgView.backgroundColor = LGDLightGaryColor;
        _FilFacoteryThubImgView.layer.cornerRadius = K(25);
        _FilFacoteryThubImgView.layer.masksToBounds = YES;
        _FilFacoteryThubImgView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _FilFacoteryThubImgView;
}
- (UILabel *)FilFacoterylb{
    if (!_FilFacoterylb) {
        _FilFacoterylb = [[UILabel alloc]init];
        _FilFacoterylb.textAlignment = NSTextAlignmentCenter;
        _FilFacoterylb.font = [UIFont systemFontOfSize:13];
        _FilFacoterylb.text = @"12321321";
    }
    return _FilFacoterylb;
}
-(void)layoutSubviews{
    _FilFacoteryThubImgView.frame = CGRectMake(self.bounds.size.width/2-K(25), 0, K(50), K(50));
    _FilFacoterylb.frame = CGRectMake(0, CGRectGetMaxY(_FilFacoteryThubImgView.frame)+K(5), self.bounds.size.width, K(15));
}
- (void)setFilmDic:(NSDictionary *)FilmDic{
    _FilmDic  = FilmDic;
    NSString * imgUrl =  [FilmDic objectForKey:@"img"];
    NSString  * name = [FilmDic objectForKey:@"title"];
    [_FilFacoteryThubImgView sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
    _FilFacoterylb.text = name;
}
@end
