//
//  ORChannelBaseItemView.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/20.
//

#import "ORChannelBaseItemView.h"

@interface ORChannelBaseItemView ()

@property (nonatomic, strong) UIImageView *coverImageView; // 封面
@property (nonatomic, strong) UILabel *tipsLabel; // 提示（全集 、评分）
@property (nonatomic, strong) UILabel *nameLabel; // 影视名称
@property (nonatomic, strong) UILabel *descLabel; // 描述

@property (nonatomic, strong) ORVideoBaseItem *dataItem;

@end

@implementation ORChannelBaseItemView

#pragma mark - Init

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
        self.layer.cornerRadius = 10.0f;
        self.layer.masksToBounds = YES;
        self.clipsToBounds = YES;
        
        [self setupUIs];
    }
    
    return self;
}

- (void)setupUIs
{
    // 封面
    UIImageView *coverImageView = [UIImageView ly_ViewWithColor:gnh_color_line];
    coverImageView.layer.cornerRadius = 10.0f;
    coverImageView.layer.masksToBounds = YES;
    coverImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:coverImageView];
    [coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.mas_equalTo(166.0f * ((kScreenWidth - 20 - 10)/3.0) / 115.0f);
    }];
    self.coverImageView = coverImageView;
    
    UIImageView *bottomCoverImgView = [UIImageView ly_ImageViewWithImageName:@"index_cover_bg"];
    [coverImageView addSubview:bottomCoverImgView];
    [bottomCoverImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(coverImageView);
        make.height.mas_equalTo(@(27.5));
    }];
    
    UILabel *tipsLabel = [UILabel ly_LabelWithTitle:@"" font:zy_mediumSystemFont12 titleColor:gnh_color_b];
    [coverImageView addSubview:tipsLabel];
    [tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(coverImageView).offset(-7.5f);
        make.bottom.equalTo(coverImageView).offset(-4.5f);
        make.height.mas_equalTo(@11.5f);
    }];
    tipsLabel.textAlignment = NSTextAlignmentRight;
    self.tipsLabel = tipsLabel;
    
    // 影视名称
    UILabel *nameLabel = [UILabel ly_LabelWithTitle:@"" font:zy_mediumSystemFont14 titleColor:gnh_color_r];
    [self addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(coverImageView.mas_bottom).offset(7.5f);
        make.left.equalTo(coverImageView).offset(2.5f);
        make.right.equalTo(coverImageView).offset(-10.0f);
        make.height.mas_equalTo(@13);
    }];
    nameLabel.textAlignment = NSTextAlignmentLeft;
    self.nameLabel = nameLabel;
}

- (void)refreshData:(ORVideoBaseItem *)dataItem
{
    self.dataItem = dataItem;
    [self.coverImageView sd_setImageWithURL:dataItem.coverImg.urlWithString placeholderImage:[UIImage imageNamed:@"discovery_cover_default"] options:SDWebImageRetryFailed];
    self.tipsLabel.text = unemptyString(dataItem.videoTag,  [NSString stringWithFormat:@"%.1f", dataItem.score.floatValue]);
    self.nameLabel.text = dataItem.videoName;
    self.descLabel.text = dataItem.videoDesc;
}

@end
