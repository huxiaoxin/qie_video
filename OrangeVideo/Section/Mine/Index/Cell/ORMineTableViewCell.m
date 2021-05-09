//
//  ORMineTableViewCell.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/15.
//

#import "ORMineTableViewCell.h"

@implementation ORMineCellItem

@end

@interface ORMineTableViewCell ()

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIImageView *arrowImageView;

@end

@implementation ORMineTableViewCell

#pragma mark - LifeCycle

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = gnh_color_d;
    }
    return self;
}

- (void)setupSubviews
{
    [super setupSubviews];
    
    // 背景view
    UIView *backView = [UIView ly_ViewWithColor:UIColor.whiteColor];
    backView.frame = CGRectMake(15.f, 0, kScreenWidth - 30.0f, 54.0f);
    [self addSubview:backView];
    self.backView = backView;
    
    UIImageView *iconImageView = [UIImageView ly_ViewWithColor:UIColor.clearColor];
    [backView addSubview:iconImageView];
    [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(backView).offset(18.0f);
        make.centerY.equalTo(backView);
        make.size.mas_equalTo(CGSizeMake(24.0f, 24.0f));
    }];
    self.iconImageView = iconImageView;
    
    UILabel *titleLabel = [UILabel ly_LabelWithTitle:@"" font:zy_fontSize14 titleColor:gnh_color_a];
    [backView addSubview:titleLabel];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(iconImageView.mas_right).offset(10.f);
        make.centerY.equalTo(iconImageView);
    }];
    self.titleLabel = titleLabel;
    
    UILabel *contentLabel = [UILabel ly_LabelWithTitle:@"" font:zy_fontSize14 titleColor:RGBA_HexCOLOR(0xA9B1AF, 1.0)];
    [backView addSubview:contentLabel];
    contentLabel.textAlignment = NSTextAlignmentRight;
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(backView).offset(-30.0f);
        make.centerY.equalTo(iconImageView);
    }];
    self.contentLabel = contentLabel;
    self.contentLabel.hidden = YES;
    
    UIImageView *arrowImageView = [UIImageView ly_ImageViewWithImageName:@"mine_arrow"];
    [backView addSubview:arrowImageView];
    [arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(backView).offset(-10.0f);
        make.centerY.equalTo(backView);
    }];
    self.arrowImageView = arrowImageView;
}

- (void)setItem:(id<GNHBaseActionItemProtocol>)item
{
    self.topLine.hidden = YES;
    self.bottomLine.hidden = NO;
    self.contentLabel.hidden = YES;
    if ([item isKindOfClass:[ORMineCellItem class]]) {
        ORMineCellItem *cellItem = (ORMineCellItem *)item;
        self.titleLabel.text = cellItem.title;
        self.iconImageView.image = [UIImage imageNamed:cellItem.iconName];
        self.contentLabel.text = cellItem.content;
        
        if (cellItem.isBeginSeperator && cellItem.isEndSeperator) {
            self.backView.layer.cornerRadius = 15.0f;
            self.backView.layer.masksToBounds = YES;
        } else if (cellItem.isBeginSeperator) {
            // 裁上边
            [self.backView cutWithCornerRadius:15.f rectCorner:UIRectCornerTopLeft | UIRectCornerTopRight];
        } else if (cellItem.isEndSeperator) {
            // 裁下边
            [self.backView cutWithCornerRadius:15.f rectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight];
            self.bottomLine.hidden = YES;
        }
        self.bottomLineEdgeInsets = UIEdgeInsetsMake(0, 63, 0, -30);
    
        [self bringSubviewToFront:self.bottomLine];
        self.lineColor = gnh_color_line;
    }
}

#pragma mark - Override System Method

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{}

+ (CGFloat)heightForItem:(id<GNHBaseActionItemProtocol>)item
{
    if ([item isKindOfClass:[ORMineCellItem class]]) {
        return 54.0f;
    }
    
    return 50.0f;
}

@end
