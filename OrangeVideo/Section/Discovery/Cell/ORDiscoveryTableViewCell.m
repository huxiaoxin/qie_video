//
//  ORDiscoveryTableViewCell.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/23.
//

#import "ORDiscoveryTableViewCell.h"
#import "ORChannelBaseItemView.h"
#import "ORDiscoveryBaseView.h"

#define kItemWidth (kScreenWidth - 10 * 2 - 10)/3.0
#define kItemHeight (200.0f * kItemWidth)/115.0

@interface ORDiscoverCollectionCell : UICollectionViewCell
@property (nonatomic, strong) ORDiscoveryBaseView *channelItemView;

- (void)reloadCollectionViewData:(ORDiscoveryDataItem *)dataItem;

@end

@implementation ORDiscoverCollectionCell

#pragma mark - LifeCycle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        ORDiscoveryBaseView *channelItemView = [[ORDiscoveryBaseView alloc] init];
        [self addSubview:channelItemView];
        [channelItemView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.right.equalTo(self);
        }];
        self.channelItemView = channelItemView;
    }
    
    return [super initWithFrame:frame];
}

- (void)reloadCollectionViewData:(ORDiscoveryDataItem *)dataItem
{
    [self.channelItemView refreshData:dataItem];
}

@end


@interface ORDiscoveryTableViewCell () <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView; // 直播展示区
@property (nonatomic, strong) ORDiscoveryItem *discoveryItem;

@end

@implementation ORDiscoveryTableViewCell

#pragma mark - LifeCycle

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = gnh_color_b;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setupSubviews
{
    [super setupSubviews];
        
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionView.backgroundColor = gnh_color_b;
    [collectionView registerClass:[ORDiscoverCollectionCell class] forCellWithReuseIdentifier:@"cellId"];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self.contentView addSubview:collectionView];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(0);
        make.bottom.equalTo(self.contentView);
        make.left.right.equalTo(self.contentView).inset(10.0f);
    }];
    self.collectionView = collectionView;
}

- (void)setItem:(id<GNHBaseActionItemProtocol>)item
{
    if ([item isKindOfClass:[ORDiscoveryItem class]]) {
        ORDiscoveryItem *channelItem = (ORDiscoveryItem *)item;
        self.discoveryItem = channelItem;
        self.topLine.hidden = YES;
        self.bottomLine.hidden = YES;
    
        [self.collectionView reloadData];
    }
}

#pragma mark - UICollectionView Delegate & dataSource

//返回section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每个section的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.discoveryItem.list.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ORDiscoverCollectionCell *cell = (ORDiscoverCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    if (self.discoveryItem.list.count) {
        ORDiscoveryDataItem *channelBaseItem = (ORDiscoveryDataItem *)[self.discoveryItem.list mdf_safeObjectAtIndex:indexPath.row];
        [cell reloadCollectionViewData:channelBaseItem];
    }
    
    return cell;
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(kItemWidth, kItemHeight);
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsZero;
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}

//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}

//点击item方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.channelItemCallBack) {
        ORDiscoveryDataItem *channelBaseItem = (ORDiscoveryDataItem *)[self.discoveryItem.list mdf_safeObjectAtIndex:indexPath.row];
        self.channelItemCallBack(channelBaseItem);
    }
}

#pragma mark - Override System Method

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{}

+ (CGFloat)heightForItem:(id<GNHBaseActionItemProtocol>)item
{
    if ([item isKindOfClass:[ORDiscoveryItem class]]) {
        ORDiscoveryItem *channelItem = (ORDiscoveryItem *)item;
        if (channelItem.list.count) {
            CGFloat height = 0.0f;
            if (channelItem.list.count % 3 == 0) {
                height = (channelItem.list.count / 3) * (kItemHeight + 5.0f); // 高度 + 间隙
            } else {
                height = (channelItem.list.count / 3 + 1) * (kItemHeight + 5.0f); // 高度 + 间隙
            }
            
            return height + 5;
        }
    }
    
    return [super heightForItem:item];
}

@end
