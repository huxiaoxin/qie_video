#import "FilmFactorySendZoneCollectionCell.h"

@implementation FilmFactorySendZoneCollectionCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIImageView * FilmFactoryImgViewIcon = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, K(100), K(100))];
        FilmFactoryImgViewIcon.layer.cornerRadius = K(5);
        FilmFactoryImgViewIcon.layer.masksToBounds = YES;
        [self.contentView addSubview:FilmFactoryImgViewIcon];
        _FilmFactoryImgViewIcon = FilmFactoryImgViewIcon;
    }
    return self;
}
@end
