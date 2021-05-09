#import "ShuyunTeseBtn.h"

@implementation ShuyunTeseBtn
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.ShuyunBallImgView];
        [self addSubview:self.ShuyunBalllb];
    }
    return self;
}
-(UILabel *)ShuyunBalllb{
    if (!_ShuyunBalllb) {
        CGFloat ShuyunWidth = SCREEN_Width/5;
        _ShuyunBalllb  = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_ShuyunBallImgView.frame)+K(2), ShuyunWidth, K(16.5))];
        _ShuyunBalllb.textAlignment = NSTextAlignmentCenter;
        _ShuyunBalllb.textColor = [UIColor colorWithHexString:@"#333333"];
        _ShuyunBalllb.font = KSysFont(12);
    
        
    }
    return _ShuyunBalllb;
}
-(UIImageView *)ShuyunBallImgView{
    if (!_ShuyunBallImgView) {
        CGFloat ShuyunWidth = SCREEN_Width/5;
    _ShuyunBallImgView = [[UIImageView alloc]initWithFrame:CGRectMake(ShuyunWidth/2-K(17.5), 0, K(35), K(35))];
    }
    return _ShuyunBallImgView;
}
@end
