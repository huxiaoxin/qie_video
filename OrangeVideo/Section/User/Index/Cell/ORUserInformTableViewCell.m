//
//  ORUserInformTableViewCell.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/28.
//

#import "ORUserInformTableViewCell.h"

@implementation ORUserInformCellItem

@end

@interface ORUserInformTableViewCell ()

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIImageView *protrailImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIImageView *arrowImageView;

@end

@implementation ORUserInformTableViewCell

#pragma mark - LifeCycle

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = gnh_color_b;
    }
    return self;
}

- (void)setupSubviews
{
    [super setupSubviews];
    
    UILabel *titleLabel = [UILabel ly_LabelWithTitle:@"" font:zy_fontSize15 titleColor:gnh_color_a];
    [self.contentView addSubview:titleLabel];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(15.0f);
        make.centerY.equalTo(self.contentView);
    }];
    self.titleLabel = titleLabel;
    
    UILabel *contentLabel = [UILabel ly_LabelWithTitle:@"" font:zy_fontSize15 titleColor:gnh_color_f];
    [self.contentView addSubview:contentLabel];
    contentLabel.textAlignment = NSTextAlignmentRight;
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-15.0f);
        make.centerY.equalTo(self.contentView);
    }];
    self.contentLabel = contentLabel;
    
    UIImageView *protrailImageView = [UIImageView ly_ViewWithColor:UIColor.clearColor];
    protrailImageView.layer.cornerRadius = 15.0f;
    protrailImageView.layer.masksToBounds = YES;
    [self.contentView addSubview:protrailImageView];
    [protrailImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-33.0f);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(30.0f, 30.0f));
    }];
    self.protrailImageView = protrailImageView;
    
    UIImageView *arrowImageView = [UIImageView ly_ImageViewWithImageName:@"com_arrow"];
    [self.contentView addSubview:arrowImageView];
    [arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-9.5f);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(18.0f, 18.0f));
    }];
    self.arrowImageView = arrowImageView;
}

- (void)setItem:(id<GNHBaseActionItemProtocol>)item
{
    self.topLine.hidden = YES;
    self.bottomLine.hidden = NO;
    self.arrowImageView.hidden = YES;
    self.contentLabel.hidden = YES;
    self.protrailImageView.hidden = YES;
    if ([item isKindOfClass:[ORUserInformCellItem class]]) {
        ORUserInformCellItem *cellItem = (ORUserInformCellItem *)item;
        self.titleLabel.text = cellItem.title;
        if (cellItem.image) {
            self.protrailImageView.image = cellItem.image;
        } else {
            [self.protrailImageView sd_setImageWithURL:[NSURL URLWithString:cellItem.anchorUrl] placeholderImage:[UIImage imageNamed:@"logo"]];
        }
        self.contentLabel.text = cellItem.content;
        switch (cellItem.cellType) {
            case ORUserInformCellTypePortrail: { // 头像
                self.arrowImageView.hidden = NO;
                self.protrailImageView.hidden = NO;
                
                self.bottomLineEdgeInsets = UIEdgeInsetsMake(0, 15.0f, 0, 0);
                
                break;
            }
            case ORUserInformCellTypeNickName: { // 昵称
                self.arrowImageView.hidden = NO;
                self.contentLabel.hidden = NO;
                
                [self.contentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.right.equalTo(self.contentView).offset(-35.0f);
                }];
                
                self.bottomLineEdgeInsets = UIEdgeInsetsMake(0, 0.0f, 0, 0);
                
                break;
            }
            default:
                break;
        }
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
    if ([item isKindOfClass:[ORUserInformCellItem class]]) {
        return 56.0f;
    }
    
    return 45.0f;
}

@end
