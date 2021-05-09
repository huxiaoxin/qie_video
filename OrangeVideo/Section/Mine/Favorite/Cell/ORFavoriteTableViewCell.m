//
//  ORFavoriteTableViewCell.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/2/3.
//

#import "ORFavoriteTableViewCell.h"

@interface  ORFavoriteTableViewCell ()

@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *typeLabel;

@end

@implementation ORFavoriteTableViewCell

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
    
    UIImageView *coverImageView = [UIImageView ly_ViewWithColor:gnh_color_line];
    coverImageView.contentMode = UIViewContentModeScaleAspectFill;
    coverImageView.layer.cornerRadius = 7.5f;
    coverImageView.layer.masksToBounds = YES;
    [self.contentView addSubview:coverImageView];
    [coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(15.0f);
        make.left.equalTo(self.contentView).offset(18.0f);
        make.size.mas_equalTo(CGSizeMake(60, 80));
    }];
    self.coverImageView = coverImageView;
    
    UILabel *titleLabel = [UILabel ly_LabelWithTitle:@"" font:zy_blodFontSize15 titleColor:gnh_color_a];
    titleLabel.numberOfLines = 0;
    [self.contentView addSubview:titleLabel];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(coverImageView).offset(17.0f);
        make.left.mas_equalTo(coverImageView.mas_right).offset(20.f);
        make.right.equalTo(self.contentView).offset(-20.0f);
    }];
    self.titleLabel = titleLabel;
    
    UILabel *typeLabel = [UILabel ly_LabelWithTitle:@"" font:zy_mediumSystemFont12 titleColor:gnh_color_e];
    [self.contentView addSubview:typeLabel];
    typeLabel.textAlignment = NSTextAlignmentRight;
    [typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLabel);
        make.bottom.equalTo(coverImageView).offset(-14.5f);
    }];
    self.typeLabel = typeLabel;
}

- (void)setItem:(id<GNHBaseActionItemProtocol>)item
{
    self.topLine.hidden = YES;
    self.bottomLine.hidden = YES;
    if ([item isKindOfClass:[ORFavoriteListDataItem class]]) {
        ORFavoriteListDataItem *cellItem = (ORFavoriteListDataItem *)item;
        [self.coverImageView sd_setImageWithURL:cellItem.coverImg.urlWithString];
        self.titleLabel.text = cellItem.videoName;
        if (cellItem.videoTag.length) {
            self.typeLabel.text = [unemptyString(cellItem.typeCh, @"") stringByAppendingFormat:@" %@",cellItem.videoTag];
        } else {
            self.typeLabel.text = unemptyString(cellItem.typeCh, @"");
        }
    }
}

#pragma mark - Override System Method

+ (CGFloat)heightForItem:(id<GNHBaseActionItemProtocol>)item
{
    if ([item isKindOfClass:[ORFavoriteListDataItem class]]) {
        return 95.0f;
    }
    
    return 50.0f;
}

@end

