//
//  ORSearchResultTableViewCell.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/27.
//

#import "ORSearchResultTableViewCell.h"
#import "ORVideoBaseItem.h"

@interface ORSearchResultTableViewCell ()
@property (nonatomic, strong) UIImageView *coverImageView; // 封面
@property (nonatomic, strong) UILabel *videoNameLabel; // 名字
@property (nonatomic, strong) UILabel *episodesLabel; // 集数
@property (nonatomic, strong) UILabel *descLabel; // 描述
@property (nonatomic, strong) UILabel *actorLabel; // 演员

@property (nonatomic, strong) ORVideoBaseItem *videoBaseItem;

@end

@implementation ORSearchResultTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = gnh_color_c;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setupSubviews
{
    [super setupSubviews];
    
    UIImageView *coverImageView = [UIImageView ly_ViewWithColor:gnh_color_line];
    coverImageView.layer.cornerRadius = 10.0f;
    coverImageView.layer.masksToBounds = YES;
    coverImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:coverImageView];
    [coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(15.0f);
        make.left.equalTo(self).offset(11);
        make.size.mas_equalTo(CGSizeMake(70, 100));
    }];
    self.coverImageView = coverImageView;
    
    UILabel *videoNameLabel = [UILabel ly_LabelWithTitle:@"" font:zy_mediumSystemFont14 titleColor:gnh_color_r];
    [self.contentView  addSubview:videoNameLabel];
    [videoNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(coverImageView).offset(6.5f);
        make.left.equalTo(coverImageView.mas_right).offset(10.5f);
        make.right.equalTo(self).offset(-15.0f);
        make.height.mas_offset(13.0f);
    }];
    self.videoNameLabel = videoNameLabel;
    
    UILabel *episodesLabel = [UILabel ly_LabelWithTitle:@"" font:zy_mediumSystemFont12 titleColor:gnh_color_e];
    [self.contentView  addSubview:episodesLabel];
    [episodesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(videoNameLabel.mas_bottom).offset(17.5f);
        make.left.equalTo(coverImageView.mas_right).offset(10.5f);
        make.height.mas_offset(11.5f);
    }];
    self.episodesLabel = episodesLabel;
    
    UILabel *descLabel = [UILabel ly_LabelWithTitle:@"" font:zy_mediumSystemFont12 titleColor:gnh_color_e];
    [self.contentView  addSubview:descLabel];
    [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(episodesLabel.mas_bottom).offset(9.5f);
        make.left.equalTo(coverImageView.mas_right).offset(10.5f);
        make.height.mas_offset(11.5f);
    }];
    self.descLabel = descLabel;
    
    UILabel *actorLabel = [UILabel ly_LabelWithTitle:@"" font:zy_mediumSystemFont12 titleColor:gnh_color_e];
    [self.contentView addSubview:actorLabel];
    [actorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(descLabel.mas_bottom).offset(9.5f);
        make.left.equalTo(coverImageView.mas_right).offset(10.5f);
        make.height.mas_offset(11.5f);
    }];
    self.actorLabel = actorLabel;
}

- (void)setItem:(id<GNHBaseActionItemProtocol>)item
{
    if ([item isKindOfClass:[ORVideoBaseItem class]]) {
        ORVideoBaseItem *videoBaseItem = (ORVideoBaseItem *)item;
        self.videoBaseItem = videoBaseItem;
        self.topLine.hidden = YES;
        self.bottomLine.hidden = YES;
        
        [self.coverImageView sd_setImageWithURL:videoBaseItem.coverImg.urlWithString];
        self.videoNameLabel.text = videoBaseItem.videoName;
        
        self.episodesLabel.hidden = YES;
        if (videoBaseItem.videoTag.length) {
            self.episodesLabel.text = videoBaseItem.videoTag;
            self.episodesLabel.hidden = NO;
        }
        
        // 描述
        NSString *descStr = unemptyString(videoBaseItem.yearTypeCh, @"");
        if (descStr.length) {
            if (videoBaseItem.typeCh.length) {
                descStr = [descStr stringByAppendingFormat:@"/%@", videoBaseItem.typeCh];
            }
            if (videoBaseItem.childTypeCh.length) {
                descStr = [descStr stringByAppendingFormat:@"/%@", videoBaseItem.childTypeCh];
            }
        }
        self.descLabel.text = descStr;
        // 演员
        if (videoBaseItem.actor.length) {
            self.actorLabel.text = [@"主演：" stringByAppendingString:videoBaseItem.actor];
        }
    }
}

#pragma mark - Override System Method

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{}

+ (CGFloat)heightForItem:(id<GNHBaseActionItemProtocol>)item
{
    if ([item isKindOfClass:[ORVideoBaseItem class]]) {
        return 100 + 15.0f;
    }
    
    return [super heightForItem:item];
}

@end
