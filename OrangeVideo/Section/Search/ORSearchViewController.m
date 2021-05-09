//
//  ORSearchViewController.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/12.
//

#import "ORSearchViewController.h"
#import "GNHBaseTextField.h"
#import "ORSearchHotDataModel.h"
#import <VTMagic.h>
#import <VTMagicProtocol.h>
#import "ORSearchChannelViewController.h"

@interface ORSearchViewController () <VTMagicViewDataSource, VTMagicViewDelegate, UITextFieldDelegate>

@property (nonatomic, strong) ORSearchHotDataModel *searchHotDataModel;

@property (strong, nonatomic) VTMagicController *magicController;
@property (nonatomic, strong) NSMutableArray *matchTypes; // 分类赛事
@property (nonatomic, strong) NSMutableArray *menuTitles; // 分类赛事标题
@property (nonatomic, assign) NSInteger currentType;

@property (nonatomic, strong) GNHBaseTextField *searchTextField;  //  输入框
@property (nonatomic, strong) UIButton *cancelBtn; //  取消按钮

@property (nonatomic, strong) UIView *historySearchView; // 历史搜索
@property (nonatomic, strong) UIView *hotSearchView; // 热门搜索

@property (nonatomic, strong) NSMutableArray *historyKeywords;

@property (nonatomic, strong) UIButton *prehistoryButton; // 历史搜索
@property (nonatomic, strong) UIButton *prehotButton;     // 热门搜索

@end

@implementation ORSearchViewController

#pragma mark - LifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupUI];
    
    [self setupDatas];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 去掉导航栏底线
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    [self.searchHotDataModel hotKeywords];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.searchTextField resignFirstResponder];
    
    // 恢复导航栏底线
    [self.navigationController.navigationBar setShadowImage:nil];
}

#pragma mark - SetupData

- (void)setupUI
{
    self.view.backgroundColor = gnh_color_b;
    self.tableView.backgroundColor = gnh_color_b;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 导航栏配置
    self.navigationItem.hidesBackButton = NO;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.cancelBtn];
    
    //搜索框
    GNHBaseTextField *searchTextField = [[GNHBaseTextField alloc] initWithFrame:CGRectMake(0, -50, kScreenWidth, 30)];
    searchTextField.delegate = self;
    searchTextField.backgroundColor = gnh_color_h;
    searchTextField.font = zy_fontSize13;
    searchTextField.leftViewMode = UITextFieldViewModeAlways;
    searchTextField.leftViewGap = 10.0f;
    searchTextField.textRectLeftGap = 4.0f;
    searchTextField.editingRectLeftGap = 4.0f;
    searchTextField.returnKeyType = UIReturnKeySearch;
    searchTextField.enablesReturnKeyAutomatically = YES;
    searchTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    searchTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    searchTextField.layer.cornerRadius = 15;
    searchTextField.layer.masksToBounds = YES;
    NSAttributedString *attr = [[NSAttributedString alloc]initWithString:@"搜索关键词" attributes:@{NSFontAttributeName:zy_fontSize13, NSForegroundColorAttributeName:gnh_color_e}];
    [searchTextField setAttributedPlaceholder:attr];
    searchTextField.clipsToBounds = YES;
    self.searchTextField = searchTextField;
    // 搜索图标 com_search
    UIImage *image = [UIImage imageNamed:@"index_search"];
    UIImageView *iconImageView = [[UIImageView alloc] initWithImage:image];
    searchTextField.leftView = iconImageView;
    self.navigationItem.titleView = self.searchTextField;
    
    // 历史搜索
    UIView *historySearchView = [UIView ly_ViewWithColor:gnh_color_b];
    [self.tableView addSubview:historySearchView];
    [historySearchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tableView);
        make.left.right.equalTo(self.view);
    }];
    self.historySearchView = historySearchView;
    self.historySearchView.hidden = YES;
    
    // 历史搜索
    UILabel *historyTitleLabel = [UILabel ly_LabelWithTitle:@"历史搜索" font:zy_mediumSystemFont15 titleColor:gnh_color_a];
    historyTitleLabel.textAlignment = NSTextAlignmentLeft;
    [historySearchView addSubview:historyTitleLabel];
    [historyTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(historySearchView).offset(12.0f);
        make.left.equalTo(historySearchView).offset(15.0f);
        make.height.mas_equalTo(14.0f);
    }];
    
    UIButton *deleteBtn = [UIButton ly_ButtonWithNormalImageName:@"index_search_delete" selecteImageName:@"index_search_delete" target:self selector:@selector(deleteHistorySearch:)];
    [historySearchView addSubview:deleteBtn];
    [deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(historySearchView).offset(-9.5f);
        make.centerY.equalTo(historyTitleLabel);
        make.size.mas_equalTo(CGSizeMake(24.0f, 24.0f));
    }];
    [deleteBtn setEnlargeEdgeWithTop:20 right:20 bottom:20 left:20];

    // 添加分类赛事
    [self addChildViewController:self.magicController];
    [self.view addSubview:self.magicController.view];
    [self.magicController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(ORKitMacros.statusBarHeight + ORKitMacros.navigationBarHeight);
        make.left.right.bottom.equalTo(self.view);
    }];
    self.magicController.view.hidden = YES;
}

- (void)configHotSearchView
{
    // 热门搜索
    [self.hotSearchView removeFromSuperview];
    UIView *hotSearchView = [UIView ly_ViewWithColor:gnh_color_b];
    [self.tableView addSubview:hotSearchView];
    [hotSearchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.historySearchView.mas_bottom);
        make.left.right.equalTo(self.view);
    }];
    self.hotSearchView = hotSearchView;
    
    // 热门搜索
    UILabel *hotTitleLabel = [UILabel ly_LabelWithTitle:@"热门搜索" font:zy_mediumSystemFont15 titleColor:gnh_color_a];
    hotTitleLabel.textAlignment = NSTextAlignmentLeft;
    [hotSearchView addSubview:hotTitleLabel];
    [hotTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(hotSearchView).offset(20.0f);
        make.left.equalTo(hotSearchView).offset(15.0f);
        make.height.mas_equalTo(14.0f);
    }];
    
    __block CGFloat hotOrigin_x = 15.0f;
    __block CGFloat hotOrigin_y = 56.0f;
    __block CGRect hotTmpRect = CGRectZero;
    [self.searchHotDataModel.searchHotKeyItem.data enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *title = (NSString *)obj;
        CGSize tagSize = [title textWithSize:14.0f size:CGSizeZero];

        if (hotTmpRect.size.width > 0) {
            if (CGRectGetMaxX(hotTmpRect) + tagSize.width + 33.0f + 15.0f > kScreenWidth) {
                // 换行
                hotOrigin_x = 15.0f;
                hotOrigin_y = CGRectGetMaxY(hotTmpRect) + 12.0f;
            } else {
                hotOrigin_x = CGRectGetMaxX(hotTmpRect) + 10.0f;
                hotOrigin_y = CGRectGetMinY(hotTmpRect);
            }
        }
        
        UIButton *tagButton = [UIButton ly_ButtonWithTitle:title titleColor:gnh_color_a font:zy_mediumSystemFont14 target:self selector:@selector(hotSearchAction:)];
        tagButton.backgroundColor = gnh_color_h;
        tagButton.layer.cornerRadius = 15.f;
        tagButton.layer.masksToBounds = YES;
        tagButton.frame = CGRectMake(hotOrigin_x, hotOrigin_y, tagSize.width + 33.0f, 30.0f);
        [hotSearchView addSubview:tagButton];
        hotTmpRect = tagButton.frame;
    }];
    [hotSearchView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(CGRectGetMaxY(hotTmpRect) + 20.0f);
    }];
}

- (void)refreshHistorySearchView
{
    for (UIView *subview in self.historySearchView.subviews) {
        if ([subview isKindOfClass:[UILabel class]] && subview.tag >= 100) {
            [subview removeFromSuperview];
        }
    }
    __block CGFloat origin_x = 15.0f;
    __block CGFloat origin_y = 38.0f;
    __block CGRect tmpRect = CGRectZero;
    [self.historyKeywords enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *title = (NSString *)obj;
        CGSize tagSize = [title textWithSize:14.0f size:CGSizeZero];

        if (tmpRect.size.width > 0) {
            if (CGRectGetMaxX(tmpRect) + tagSize.width + 33.0f + 15.0f > kScreenWidth) {
                // 换行
                origin_x = 15.0f;
                origin_y = CGRectGetMaxY(tmpRect) + 12.0f;
            } else {
                origin_x = CGRectGetMaxX(tmpRect) + 10.0f;
                origin_y = CGRectGetMinY(tmpRect);
            }
        }
        
        UIButton *tagButton = [UIButton ly_ButtonWithTitle:title titleColor:gnh_color_a font:zy_mediumSystemFont14 target:self selector:@selector(historySearchAction:)];
        tagButton.backgroundColor = gnh_color_h;
        tagButton.layer.cornerRadius = 15.f;
        tagButton.layer.masksToBounds = YES;
        tagButton.tag = 100 + idx;
        tagButton.frame = CGRectMake(origin_x, origin_y, tagSize.width + 33.0f, 30.0f);
        [self.historySearchView addSubview:tagButton];
        tmpRect = tagButton.frame;
    }];
    [self.historySearchView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(CGRectGetMaxY(tmpRect) + 20.0f);
    }];
}

#pragma mark - setupData

- (void)setupDatas
{
    self.historyKeywords = [[ORUserDefaults objectForKey:ORSearchkeywordsKey] mutableCopy];
    if (!self.historyKeywords) {
        self.historyKeywords = [NSMutableArray array];
    }
    
    // 历史搜索
    self.historySearchView.hidden = self.historyKeywords.count > 0 ? NO : YES;
    if (!self.historySearchView.hidden) {
        [self refreshHistorySearchView];
    }
    
    // 加载菜单
    [self reloadMenuChannelData];
}
    
- (void)refreshUI
{
    // 热门搜索
    [self configHotSearchView];
    if (self.historySearchView.hidden) {
        [self.hotSearchView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.tableView);
        }];
    } else {
        [self.hotSearchView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.historySearchView.mas_bottom);
        }];
    }
}

- (void)reloadMenuChannelData
{
    self.matchTypes = [NSMutableArray arrayWithArray:[ORMenuChannelManager sharedInstance].channelMenuItem.data];
    
    // 标题
    NSMutableArray *menuTitles = [NSMutableArray array];
    
    [self.matchTypes enumerateObjectsUsingBlock:^(ORChannelMenuDataItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [menuTitles mdf_safeAddObject:obj.name];
    }];
    self.menuTitles = [menuTitles mutableCopy];
    
    // 插入占位符
    ORChannelMenuDataItem *allItem = [[ORChannelMenuDataItem alloc] init];
    allItem.type = @"all";
    allItem.name = @"全部";
    [self.matchTypes mdf_safeReplaceObjectAtIndex:0 withObject:allItem];
    [self.menuTitles mdf_safeReplaceObjectAtIndex:0 withObject:@"全部"];
}

- (void)searchDataWithKeyword
{
    // 搜索
    self.magicController.view.hidden = NO;
    [self.magicController.magicView reloadDataToPage:0];
}

#pragma mark - ButtonAction

- (void)cancelAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)historySearchAction:(UIButton *)btn
{
    self.prehistoryButton.backgroundColor = gnh_color_h;
    [self.prehistoryButton setTitleColor:gnh_color_a forState:UIControlStateNormal];
    self.prehistoryButton = btn;
    self.prehistoryButton.backgroundColor = gnh_color_q;
    [self.prehistoryButton setTitleColor:gnh_color_theme forState:UIControlStateNormal];
        
    self.searchTextField.text = btn.titleLabel.text;
    // 查询数据
    [self searchDataWithKeyword];
}

- (void)hotSearchAction:(UIButton *)btn
{
    self.prehotButton.backgroundColor = gnh_color_h;
    [self.prehotButton setTitleColor:gnh_color_a forState:UIControlStateNormal];
    self.prehotButton = btn;
    self.prehotButton.backgroundColor = gnh_color_q;
    [self.prehotButton setTitleColor:gnh_color_theme forState:UIControlStateNormal];
    
    self.searchTextField.text = btn.titleLabel.text;
    // 查询数据
    [self searchDataWithKeyword];
}

- (void)deleteHistorySearch:(UIButton *)btn
{
    [self.historyKeywords removeAllObjects];
    [ORUserDefaults setObject:self.historyKeywords forKey:ORSearchkeywordsKey];
    [ORUserDefaults synchronize];
    
    self.historySearchView.hidden = YES;
    [self refreshHistorySearchView];
    [self.hotSearchView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tableView);
    }];
}

#pragma mark - TextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.text.length > 8) {
        [SVProgressHUD showInfoWithStatus:@"您输入的关键字过长，请重新输入"];
        return NO;
    } else if (!textField.text.length) {
        [SVProgressHUD showInfoWithStatus:@"搜索的内容不能为空"];
        return NO;
    } else {
        // 查询数据
        [self searchDataWithKeyword];
        [self.searchTextField resignFirstResponder];
        
        return YES;
    }
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    self.magicController.view.hidden = YES;
    
    // 还原历史搜索样式
    self.prehistoryButton.backgroundColor = gnh_color_h;
    [self.prehistoryButton setTitleColor:gnh_color_a forState:UIControlStateNormal];
    
    // 还原热门搜索样式
    self.prehotButton.backgroundColor = gnh_color_h;
    [self.prehotButton setTitleColor:gnh_color_a forState:UIControlStateNormal];
    
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];

    if (!toBeString.length) {
        self.magicController.view.hidden = YES;
    }
    
    return [toBeString isEqualToString:@""] || toBeString.length;
}

#pragma mark - VTMagicViewDataSource

- (NSArray<NSString *> *)menuTitlesForMagicView:(VTMagicView *)magicView
{
    return self.menuTitles;
}

- (UIButton *)magicView:(VTMagicView *)magicView menuItemAtIndex:(NSUInteger)itemIndex
{
    static NSString *itemIdentifier = @"item.identifier";
    UIButton *menuItem = [magicView dequeueReusableItemWithIdentifier:itemIdentifier];
    if (!menuItem) {
        MDFButton *fontButton = [[MDFButton alloc] init];
        fontButton.normalFont = zy_mediumSystemFont15;
        fontButton.selectedFont = zy_blodFontSize17;
        menuItem = fontButton;
        
        [menuItem setTitleColor:gnh_color_o forState:UIControlStateNormal];
        [menuItem setTitleColor:gnh_color_k forState:UIControlStateSelected];
    }
    [menuItem setImage:nil forState:UIControlStateNormal];
    [menuItem setImage:nil forState:UIControlStateSelected];
    menuItem.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);

    return menuItem;
}

- (UIViewController *)magicView:(VTMagicView *)magicView viewControllerAtPage:(NSUInteger)pageIndex
{
    static NSString *pageId = @"page.identifier";
    ORSearchChannelViewController *searchChannelViewController = [magicView dequeueReusablePageWithIdentifier:pageId];
    if (!searchChannelViewController) {
        searchChannelViewController = [[ORSearchChannelViewController alloc] init];
    }
    
    ORChannelMenuDataItem *dataItem = [self.matchTypes mdf_safeObjectAtIndex:pageIndex];
    searchChannelViewController.typeId = dataItem.type;
    searchChannelViewController.keyword = self.searchTextField.text;
    
    GNHWeakSelf;
    searchChannelViewController.searchChannelCompleteBlock = ^{
        // 关键词存储本地
        __block BOOL isExist = NO;
        [weakSelf.historyKeywords enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *keyword = (NSString *)obj;
            if ([keyword isEqualToString:weakSelf.searchTextField.text]) {
                isExist = YES;
                *stop = YES;
            }
        }];
        if (!isExist) {
            [weakSelf.historyKeywords mdf_safeInsertObject:weakSelf.searchTextField.text atIndex:0];
            [ORUserDefaults setObject:weakSelf.historyKeywords forKey:ORSearchkeywordsKey];
            [ORUserDefaults synchronize];
            
            weakSelf.historySearchView.hidden = NO;
            [weakSelf refreshHistorySearchView];
            [weakSelf.hotSearchView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(weakSelf.historySearchView.mas_bottom);
            }];
        }
    };
    
    return searchChannelViewController;
}

#pragma mark - VTMagicViewDelegate

- (void)magicView:(VTMagicView *)magicView viewDidAppear:(__kindof UIViewController *)viewController atPage:(NSUInteger)pageIndex
{
    
}

- (void)magicView:(VTMagicView *)magicView didSelectItemAtIndex:(NSUInteger)itemIndex
{
    [self.magicController.magicView reselectMenuItem];
    self.magicController.magicView.sliderHidden = NO;
}

#pragma mark - Handle Data

- (void)handleDataModelSuccess:(GNHBaseDataModel *)gnhModel
{
    [super handleDataModelSuccess:gnhModel];
    if ([gnhModel isMemberOfClass:[ORSearchHotDataModel class]]) {
        // 热门关键词
        [self refreshUI];
    }
}

- (void)handleDataModelError:(GNHBaseDataModel *)gnhModel
{
    [super handleDataModelError:gnhModel];
}

#pragma mark - Properties

- (UIButton *)cancelBtn
{
    if (!_cancelBtn) {
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelBtn.frame = CGRectMake(0, 0, 10, 30);
        _cancelBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        _cancelBtn.titleLabel.font = zy_fontSize13;
        [_cancelBtn setTitleColor:gnh_color_f forState:UIControlStateNormal];
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _cancelBtn;
}

- (UIViewController<VTMagicProtocol> *)magicController
{
    if (!_magicController) {
        _magicController = [[VTMagicController alloc] init];
    
        _magicController.magicView.layoutStyle = VTLayoutStyleDefault;
        _magicController.magicView.navigationInset = UIEdgeInsetsMake(0, 10, 0, 0);
        _magicController.magicView.navigationColor = [UIColor whiteColor];
        _magicController.magicView.navigationHeight = 44;
        _magicController.magicView.separatorHidden = NO;
        _magicController.magicView.dataSource = self;
        _magicController.magicView.delegate = self;
        _magicController.magicView.itemWidth = 60.0f;
        _magicController.magicView.sliderColor = gnh_color_theme;
        _magicController.magicView.sliderWidth = 15;
        _magicController.magicView.sliderHeight = 3;
        _magicController.magicView.sliderOffset = -5;
        
        // 自定义滑块
        UIView *sliderView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, 15, 3)];
        sliderView.layer.cornerRadius = 1.5f;
        sliderView.layer.masksToBounds = YES;
        [_magicController.magicView setSliderView:sliderView];
        
    }
    return _magicController;
}

- (ORSearchHotDataModel *)searchHotDataModel
{
    if (!_searchHotDataModel) {
        _searchHotDataModel = [self produceModel:[ORSearchHotDataModel class]];
    }
    return _searchHotDataModel;
}

@end
