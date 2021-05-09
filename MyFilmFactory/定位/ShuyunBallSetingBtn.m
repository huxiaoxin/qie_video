#import "ShuyunBallSetingBtn.h"

@implementation ShuyunBallSetingBtn
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.ShuyunBallImgView];
        [self addSubview:self.ShuyunBalllb];
    }
    return self;
}
-(UIImageView *)ShuyunBallImgView{
    if (!_ShuyunBallImgView) {
        _ShuyunBallImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, K(35), K(35))];
    }
    return _ShuyunBallImgView;
}
-(UILabel *)ShuyunBalllb{
    if (!_ShuyunBalllb) {
        _ShuyunBalllb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_ShuyunBallImgView.frame)+K(3.5), CGRectGetMidY(_ShuyunBallImgView.frame)-K(9.25), K(78), K(18.5))];
        _ShuyunBalllb.textColor = LGDBLackColor;
        _ShuyunBalllb.font = KSysFont(13);
    }
    return _ShuyunBalllb;
}
@end
