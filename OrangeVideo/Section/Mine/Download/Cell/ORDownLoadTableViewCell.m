//
//  ORDownLoadTableViewCell.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/18.
//

#import "ORDownLoadTableViewCell.h"

@implementation ORDownLoadCellItem

@end

@interface  ORDownLoadTableViewCell ()

@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *timeLabel;

@end

@implementation ORDownLoadTableViewCell

#pragma mark - LifeCycle

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = gnh_color_b;
        self.tintColor = gnh_color_g;
    }
    return self;
}

- (void)setupSubviews
{
    [super setupSubviews];
    
    UIImageView *coverImageView = [UIImageView ly_ViewWithColor:UIColor.clearColor];
    coverImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:coverImageView];
    [coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(18.0f);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(104, 57));
    }];
    self.coverImageView = coverImageView;
    
    UILabel *titleLabel = [UILabel ly_LabelWithTitle:@"" font:zy_blodFontSize15 titleColor:gnh_color_a];
    [self.contentView addSubview:titleLabel];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(coverImageView).offset(3.0f);
        make.left.mas_equalTo(coverImageView.mas_right).offset(10.f);
    }];
    self.titleLabel = titleLabel;
    
    UILabel *timeLabel = [UILabel ly_LabelWithTitle:@"" font:zy_mediumSystemFont12 titleColor:gnh_color_e];
    [self.contentView addSubview:timeLabel];
    timeLabel.textAlignment = NSTextAlignmentRight;
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLabel);
        make.bottom.equalTo(coverImageView).offset(-2.5f);
    }];
    self.timeLabel = timeLabel;
}

- (void)setItem:(id<GNHBaseActionItemProtocol>)item
{
    self.topLine.hidden = YES;
    self.bottomLine.hidden = NO;
    if ([item isKindOfClass:[ORDownLoadCellItem class]]) {
        ORDownLoadCellItem *cellItem = (ORDownLoadCellItem *)item;
        [self.coverImageView sd_setImageWithURL:cellItem.coverImg.urlWithString];
        self.titleLabel.text = cellItem.videoName;
        self.timeLabel.text = @(cellItem.videoSeconds.intValue / 60).stringValue;
    }
}

#pragma mark - Override System Method

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{}

+ (CGFloat)heightForItem:(id<GNHBaseActionItemProtocol>)item
{
    if ([item isKindOfClass:[ORDownLoadCellItem class]]) {
        return 77.0f;
    }
    
    return 50.0f;
}

@end
