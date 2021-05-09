//
//  ORChooseSourceView.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/2/7.
//

#import "ORChooseSourceView.h"

@interface ORChooseSourceCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *nameLabel;

- (void)refreshData:(NSString *)icon sourceName:(NSString *)sourceName;

@end

@implementation ORChooseSourceCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        UIImageView *iconImageView = [UIImageView ly_ViewWithColor:UIColor.whiteColor];
        [self addSubview:iconImageView];
        [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20.0f);
            make.centerY.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(21.0f, 21.0));
        }];
        self.iconImageView = iconImageView;
        
        UILabel *nameLabel = [UILabel ly_LabelWithTitle:@"" font:zy_mediumSystemFont14 titleColor:RGBA_HexCOLOR(0x31333A, 1.0)];
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
    }
    return self;
}

- (void)refreshData:(NSString *)icon sourceName:(NSString *)sourceName
{
    
    [self.iconImageView sd_setImageWithURL:icon.urlWithString];
    self.nameLabel.text = sourceName;
    
    if (!icon.length) {
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
        }];
    } else {
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageView.mas_right).offset(4.0);
            make.centerY.equalTo(self.iconImageView);
        }];
    }
}

@end


@interface ORChooseSourceView () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UIImageView *backImageView;
@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray <__kindof ORVideoSourceItem *> *sources;
@property (nonatomic, copy) NSString *selectSourceName;

@end


@implementation ORChooseSourceView

- (instancetype)initWithFrame:(CGRect)frame sources:(NSMutableArray<__kindof ORVideoSourceItem *> *)sources selectSource:(nonnull NSString *)selectSourceName
{
    self = [super initWithFrame:frame];
    if (self) {
        self.sources = sources;
        self.selectSourceName = selectSourceName;
        self.backgroundColor = UIColor.whiteColor;

        [self setupView];
            
        [self setupData];
    }
    return self;
}

#pragma mark - setup

- (void)setupView
{
    UICollectionViewFlowLayout *channelCountFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    [channelCountFlowLayout setItemSize:CGSizeMake(110, 36)];
    [channelCountFlowLayout setMinimumLineSpacing:10];
    [channelCountFlowLayout setMinimumInteritemSpacing:12];
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:channelCountFlowLayout];
    [collectionView setDelegate:self];
    [collectionView setDataSource:self];
    collectionView.backgroundColor = UIColor.whiteColor;
    [collectionView registerClass:[ORChooseSourceCollectionViewCell class] forCellWithReuseIdentifier:
     @"chooseSourceCollectionViewCell"];
    [self addSubview:collectionView];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (void)setupData
{
    [self.collectionView reloadData];
}

#pragma mark - UICollectionView Delegate

//返回section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.sources.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ORChooseSourceCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"chooseSourceCollectionViewCell" forIndexPath:indexPath];
    cell.layer.cornerRadius = 8.0f;
    cell.layer.borderWidth = 0.5f;
    cell.layer.borderColor = RGBA_HexCOLOR(0xDFDFDF, 1.0).CGColor;
    
    ORVideoSourceItem *item = (ORVideoSourceItem *)[self.sources mdf_safeObjectAtIndex:indexPath.row];
    [cell refreshData:item.icon sourceName:item.sourceName];
    
    // 添加选中边框
    if ([item.sourceName isEqualToString:self.selectSourceName]) {
        cell.nameLabel.textColor = gnh_color_theme;
        cell.layer.borderColor = gnh_color_theme.CGColor;
    } else {
        cell.nameLabel.textColor = RGBA_HexCOLOR(0x31333A, 1.0);
        cell.layer.borderColor = RGBA_HexCOLOR(0xDFDFDF, 1.0).CGColor;
    }

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ORVideoSourceItem *item = (ORVideoSourceItem *)[self.sources mdf_safeObjectAtIndex:indexPath.row];
    if (self.chooseSourceCompleteBlock) {
        self.chooseSourceCompleteBlock(item.sourceName);
        self.hidden = YES;
    }
}

#pragma mark - HitTest

- (id)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UILabel class]]) {
            if ([view.layer.presentationLayer hitTest:point]) {
                return view;
            }
        }
    }
    return [super hitTest:point withEvent:event];
}
    

@end
