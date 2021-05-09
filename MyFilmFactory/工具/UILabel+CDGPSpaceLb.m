#import "UILabel+CDGPSpaceLb.h"
#define HEIGHT [ [ UIScreen mainScreen ] bounds ].size.height
@implementation UILabel (CDGPSpaceLb)
-(void)AddlbTapActionWith:(lbTapAction)item{
    self.userInteractionEnabled = YES;
    objc_setAssociatedObject(self, @selector(lbTapAction:), item, OBJC_ASSOCIATION_COPY_NONATOMIC);
    UITapGestureRecognizer * lbTapgesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(lbTapAction:)];
    [self addGestureRecognizer:lbTapgesture];
    
}
-(void)lbTapAction:(UITapGestureRecognizer *)lbtap{
    UILabel * lb = (UILabel *)[lbtap view];
    lbTapAction lblock =  objc_getAssociatedObject(self, _cmd);
    if (lblock) {
        lblock(lb);
    }
}
- (void)setText:(NSString *)text spacing:(CGFloat)spacing{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text attributes:@{NSKernAttributeName:@(spacing)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setAlignment:self.textAlignment];
    [paragraphStyle setLineBreakMode:self.lineBreakMode];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length]-1)];
    self.attributedText = attributedString;
    [self sizeToFit];
}
- (void)setText:(NSString *)text lineSpacing:(CGFloat)lineSpacing
{
    if (!text || lineSpacing < 0.01) {
        self.text = text;
        return;
    }
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];        
    [paragraphStyle setLineBreakMode:self.lineBreakMode];
    [paragraphStyle setAlignment:self.textAlignment];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    self.attributedText = attributedString;
}
-(CGSize)getSpaceLabelSize:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width lineSpacing:(CGFloat)lineSpacing{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = lineSpacing;
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
};
    
    CGSize size = [str boundingRectWithSize:CGSizeMake(width, HEIGHT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size;
}

@end
