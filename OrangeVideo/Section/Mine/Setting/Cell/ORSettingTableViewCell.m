//
//  ORSettingTableViewCell.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/18.
//

#import "ORSettingTableViewCell.h"

@implementation ORSettingCellItem

@end

@interface ORSettingTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIImageView *arrowImageView;
@property (nonatomic, strong) UISwitch *switchButton;

@property (nonatomic, strong) ORSettingCellItem *cellItem;

@end

@implementation ORSettingTableViewCell

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
        make.left.mas_equalTo(self.contentView).offset(15.f);
        make.centerY.equalTo(self.contentView);
    }];
    self.titleLabel = titleLabel;
    
    UILabel *contentLabel = [UILabel ly_LabelWithTitle:@"" font:zy_fontSize15 titleColor:gnh_color_f];
    [self.contentView addSubview:contentLabel];
    contentLabel.textAlignment = NSTextAlignmentRight;
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-36.0f);
        make.centerY.equalTo(self.contentView);
    }];
    self.contentLabel = contentLabel;
    self.contentLabel.hidden = YES;
    
    UIImageView *arrowImageView = [UIImageView ly_ImageViewWithImageName:@"com_arrow"];
    [self addSubview:arrowImageView];
    [arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-10.0f);
        make.centerY.equalTo(self.contentView);
    }];
    self.arrowImageView = arrowImageView;
    
    UISwitch *switchButton = [[UISwitch alloc] init];
    [switchButton addTarget:self action:@selector(switchButtonAction:) forControlEvents:UIControlEventTouchUpInside];
//    switchButton.transform = CGAffineTransformMakeScale(41/51.0, 26/31.0);
    [self.contentView addSubview:switchButton];
    [switchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-15.0f);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(50, 25));
    }];
    [switchButton setOn:NO animated:YES];
    self.switchButton = switchButton;
}

- (void)setItem:(id<GNHBaseActionItemProtocol>)item
{
    self.topLine.hidden = YES;
    self.bottomLine.hidden = NO;
    self.contentLabel.hidden = YES;
    self.arrowImageView.hidden = NO;
    self.switchButton.hidden = YES;
    if ([item isKindOfClass:[ORSettingCellItem class]]) {
        ORSettingCellItem *cellItem = (ORSettingCellItem *)item;
        self.cellItem = cellItem;
        self.titleLabel.text = cellItem.title;
        
        self.contentLabel.hidden = cellItem.content.length > 0 ? NO : YES;
        self.contentLabel.text = cellItem.content;
        
        if (cellItem.cellType == ORSettingCellTypePush ||
            cellItem.cellType == ORSettingCellTypeNetwork) {
            self.arrowImageView.hidden = YES;
            self.switchButton.hidden = NO;
            [self.switchButton setOn:cellItem.isOn];
        }
        
        if (cellItem.cellType == ORSettingCellTypeLogout) {
            self.bottomLine.hidden = YES;
        }
        self.bottomLineEdgeInsets = UIEdgeInsetsMake(0, 15, 0, -15);
        self.lineColor = gnh_color_line;
    }
}

#pragma mark - switchButtonAction

- (void)switchButtonAction:(UISwitch *)switchButton
{
    if (self.settingActionBlock) {
        self.settingActionBlock(self.cellItem.cellType, switchButton.isOn);
    }
}


#pragma mark - Override System Method

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{}

+ (CGFloat)heightForItem:(id<GNHBaseActionItemProtocol>)item
{
    if ([item isKindOfClass:[ORSettingCellItem class]]) {
        return 54.0f;
    }
    
    return 50.0f;
}

@end
