//
//  ORWatchRecordTableViewCell.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/18.
//

#import "ORWatchRecordTableViewCell.h"

@interface  ORWatchRecordTableViewCell ()

@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *timeLabel;

@end

@implementation ORWatchRecordTableViewCell

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
    
    UILabel *timeLabel = [UILabel ly_LabelWithTitle:@"观看至" font:zy_mediumSystemFont12 titleColor:gnh_color_e];
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
    self.bottomLine.hidden = YES;
    if ([item isKindOfClass:[ORWatchRecordDataItem class]]) {
        ORWatchRecordDataItem *cellItem = (ORWatchRecordDataItem *)item;
        [self.coverImageView sd_setImageWithURL:cellItem.coverImg.urlWithString];
        self.titleLabel.text = cellItem.videoName;

        NSInteger hour = cellItem.watchSeconds/60.0/60.0;
        NSInteger minite = cellItem.watchSeconds/60.0;
        if (minite >= 60) {
            minite = minite % 60;
        }
        NSInteger seconds = cellItem.watchSeconds % 60;
        
        NSString *timeStr = @"";
        if (hour >= 1) {
            timeStr = [NSString stringWithFormat:@"%02ld:",(long)hour];
        }
        timeStr = [timeStr stringByAppendingFormat:@"%02ld:%02ld", (long)minite, (long)seconds];
        self.timeLabel.text = [NSString stringWithFormat:@"观看至 %@",timeStr];
    }
}

#pragma mark - Override System Method

+ (CGFloat)heightForItem:(id<GNHBaseActionItemProtocol>)item
{
    if ([item isKindOfClass:[ORWatchRecordDataItem class]]) {
        return 77.0f;
    }
    
    return 50.0f;
}

@end


