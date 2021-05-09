//
//  ORLoginViewController.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/8.
//

#import "ORLoginViewController.h"
#import "GNHBaseTextField.h"
#import "UICountingLabel.h"
#import "ORH5ViewController.h"
#import <AuthenticationServices/AuthenticationServices.h>
#import "SSKeychain.h"
#import "SvUDIDTools.h"
#import <UMPush/UMessage.h>
#import "ORLoginSMSCodeDataModel.h"
#import "ORLoginDataModel.h"
#import "UIView+EnlargeTouchArea.h"
#import "ORUserInformManager.h"

@interface ORLoginViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UIScrollView *scrollview;

@property (nonatomic, strong) UILabel *titleLabel;  // 标题
@property (nonatomic, strong) GNHBaseTextField *phoneTextField;

@property (nonatomic, strong) GNHBaseTextField *codeTextField;

@property (nonatomic, strong) UICountingLabel *codeCountingLb;

@property (nonatomic, strong) UIButton *submitBtn;
@property (nonatomic, strong) UILabel *tipsLabel;

@property (nonatomic, strong) MDFButton *xieYiBtn;
@property (nonatomic, strong) UIButton *xieYi1Btn;
@property (nonatomic, strong) UIButton *xieYi2Btn;

@property (nonatomic, strong) ORLoginSMSCodeDataModel *loginSMSModel;
@property (nonatomic, strong) ORLoginDataModel *loginDataModel;

@end

@implementation ORLoginViewController

#pragma mark - LifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setupUI];
    
    [self setupData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 竖屏，防止横屏播放或者横屏直播过程中，token失效自动切换登录
    [[NSNotificationCenter defaultCenter] postNotificationName:@"UIDeviceOrientationendFullScreen" object:nil];
    
    self.fd_prefersNavigationBarHidden = YES;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

#pragma mark - setupUI

- (void)setupUI
{
    UIButton *backButton = [UIButton ly_ButtonWithNormalImageName:@"com_back" selecteImageName:nil target:self selector:@selector(leftButtonAction:)];
    [self.view addSubview:backButton];
    [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(ORKitMacros.statusBarHeight + 20.0f - 8.5f);
        make.left.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(41.0f, 41.0f));
    }];
        
    UIScrollView *bgScorllView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    bgScorllView.showsVerticalScrollIndicator = NO;
    bgScorllView.showsHorizontalScrollIndicator = NO;
    bgScorllView.automaticallyAdjustsScrollIndicatorInsets = NO;
    if (@available(iOS 11.0, *)) {
        bgScorllView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    [self.view addSubview:bgScorllView];
    self.scrollview = bgScorllView;
    self.scrollview.contentSize = CGSizeMake(kScreenWidth, kScreenHeight + 1);
        
    UILabel *titleLabel = [UILabel ly_LabelWithTitle:@"手机号快捷登录" font:zy_blodFontSize24 titleColor:RGBA_HexCOLOR(0x31333A, 1.0)];
    [bgScorllView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgScorllView).offset(ORKitMacros.statusBarHeight + 92);
        make.left.equalTo(bgScorllView).offset(40.5f);
        make.height.mas_equalTo(23.0f);
    }];
    self.titleLabel = titleLabel;
    
    UIView *lineV1 = [UIView ly_ViewWithColor:gnh_color_line];
    [bgScorllView addSubview:lineV1];
    [lineV1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(titleLabel.mas_bottom).offset(82.5f);
        make.left.equalTo(titleLabel);
        make.right.mas_equalTo(self.view.mas_right).offset(-36.5);
        make.height.mas_offset(0.5f);
    }];
    
    GNHBaseTextField *phoneTextField = [GNHBaseTextField ly_TextFieldWithPlaceholder:@"" font:zy_mediumSystemFont16];
    phoneTextField.textColor = gnh_color_a;
    phoneTextField.delegate = self;
    phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    phoneTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    NSAttributedString *attr = [[NSAttributedString alloc]initWithString:@"请输入手机号码" attributes:@{NSFontAttributeName:zy_mediumSystemFont16, NSForegroundColorAttributeName:RGBA_HexCOLOR(0xC4C6CD, 1.0)}];
    [phoneTextField setAttributedPlaceholder:attr];
    [phoneTextField addTarget:self action:@selector(textFieldChangeAction:) forControlEvents:UIControlEventEditingChanged];
    [bgScorllView addSubview:phoneTextField];
    [phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(lineV1);
        make.bottom.mas_equalTo(lineV1.mas_bottom);
        make.height.mas_offset(52);
    }];
    self.phoneTextField = phoneTextField;
    self.phoneTextField.text = ORShareAccountComponent.accountNum;
    
    UIView *lineV2 = [UIView ly_ViewWithColor:gnh_color_line];
    [bgScorllView addSubview:lineV2];
    [lineV2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineV1.mas_bottom).offset(63.5f);
        make.left.right.height.equalTo(lineV1);
    }];

    GNHBaseTextField *codeTextField = [GNHBaseTextField ly_TextFieldWithPlaceholder:@"" font:zy_fontSize13];
    codeTextField.textColor = gnh_color_a;
    codeTextField.delegate = self;
    codeTextField.font = zy_fontSize15;
    codeTextField.keyboardType = UIKeyboardTypeNumberPad;
    NSAttributedString *attrCode = [[NSAttributedString alloc]initWithString:@"请输入短信验证码" attributes:@{NSFontAttributeName:zy_mediumSystemFont16,NSForegroundColorAttributeName:RGBA_HexCOLOR(0xC4C6CD, 1.0)}];
    [codeTextField setAttributedPlaceholder:attrCode];
    [codeTextField addTarget:self action:@selector(textFieldChangeAction:) forControlEvents:UIControlEventEditingChanged];
    [bgScorllView addSubview:codeTextField];
    [codeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(lineV2);
        make.bottom.mas_equalTo(lineV2.mas_bottom);
        make.height.mas_offset(52);
    }];
    self.codeTextField = codeTextField;
        
    UICountingLabel *codeCountingLb = [[UICountingLabel alloc] init];
    codeCountingLb.method = UILabelCountingMethodLinear;
    codeCountingLb.text = @"获取验证码";
    GNHWeakObj(codeCountingLb);
    codeCountingLb.formatBlock = ^NSString *(CGFloat value) {
        if (value == 1) {
            weakcodeCountingLb.textColor = LGDMianColor;
            return @"重新获取";
        } else {
            weakcodeCountingLb.textColor = RGBA_HexCOLOR(0xC4C6CD, 1.0);
            return [NSString stringWithFormat:@"%d秒后重发", (int)value];
        }
    };
    codeCountingLb.textColor = LGDMianColor;
    codeCountingLb.font = zy_mediumSystemFont16;
    codeCountingLb.textAlignment = NSTextAlignmentCenter;
    
    GNHWeakSelf;
    [codeCountingLb mdf_whenSingleTapped:^(UIGestureRecognizer *gestureRecognizer) {
        [weakSelf.view endEditing:YES];
        NSString *code = weakSelf.codeCountingLb.text;
        if ([code isEqualToString:@"获取验证码"] || [code isEqualToString:@"重新获取"]) {
            if ([weakSelf checkPhoneState]) {
                [weakSelf.loginSMSModel sendSMS:weakSelf.phoneTextField.text];
            } else {
                [SVProgressHUD showInfoWithStatus:@"请输入合法的手机号"];
            }
        }
    }];
    [bgScorllView addSubview:codeCountingLb];
    [codeCountingLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-35.5f);
        make.centerY.equalTo(codeTextField);
        make.size.mas_offset(CGSizeMake(90, 27));
    }];
    self.codeCountingLb = codeCountingLb;

    self.submitBtn = [UIButton ly_ButtonWithTitle:@"登录" titleColor:gnh_color_b font:zy_blodFontSize17 target:self selector:@selector(submitAction)];
    self.submitBtn.backgroundColor = LGDMianColor;
    self.submitBtn.layer.cornerRadius = 22.0f;
    self.submitBtn.layer.masksToBounds = YES;
    self.submitBtn.enabled = NO;
    [bgScorllView addSubview:self.submitBtn];
    [self.submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineV2.mas_bottom).offset(41);
        make.left.right.equalTo(self.view).inset(35.5f);
        make.height.mas_offset(44);
    }];
        
    UIView *xieYiView = [UIView ly_ViewWithColor:UIColor.whiteColor];
    [bgScorllView addSubview:xieYiView];
    [xieYiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgScorllView).offset(self.view.height - (50 + 21.5 + ORKitMacros.iphoneXSafeHeight));
        make.centerX.equalTo(bgScorllView);
        make.height.mas_equalTo(50.0f);
    }];
    
    self.xieYiBtn = [MDFButton ly_ButtonWithNormalImageName:@"login_checkbox_normal" selecteImageName:@"login_checkbox_select" target:self selector:@selector(xieYiAction:)];
    self.xieYiBtn.touchEdgeInsets = UIEdgeInsetsMake(-10, -20, -10, -20);
    [xieYiView addSubview:self.xieYiBtn];
    [self.xieYiBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(xieYiView);
        make.size.mas_offset(CGSizeMake(24, 24));
        make.centerY.equalTo(xieYiView);
    }];

    UILabel *xieYiLb = [UILabel ly_LabelWithTitle:@"登录即表示您已同意" font:[UIFont systemFontOfSize:12] titleColor:gnh_color_e];
    [xieYiView addSubview:xieYiLb];
    [xieYiLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.xieYiBtn.mas_right).offset(5);
        make.centerY.equalTo(xieYiView);
    }];

    self.xieYi1Btn = [UIButton ly_ButtonWithTitle:@"《用户协议》" titleColor:gnh_color_v font:zy_mediumSystemFont12 target:self selector:@selector(xieYiAction:)];
    [xieYiView addSubview:self.xieYi1Btn];
    [self.xieYi1Btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(xieYiLb.mas_right);
        make.centerY.equalTo(xieYiLb);
    }];

    UILabel *addLb = [UILabel ly_LabelWithTitle:@"和" font:zy_mediumSystemFont12 titleColor:gnh_color_e];
    [xieYiView addSubview:addLb];
    [addLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.xieYi1Btn.mas_right);
        make.centerY.equalTo(xieYiLb);
    }];

    self.xieYi2Btn = [UIButton ly_ButtonWithTitle:@"《隐私政策》"  titleColor:gnh_color_v font:zy_mediumSystemFont12 target:self selector:@selector(xieYiAction:)];
    [xieYiView addSubview:self.xieYi2Btn];
    [self.xieYi2Btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(addLb.mas_right);
        make.right.lessThanOrEqualTo(xieYiView).offset(-10);
        make.centerY.equalTo(xieYiLb);
    }];
    
    [self.view bringSubviewToFront:backButton];
}

#pragma mark - setupData

- (void)setupData
{
    [self submitBtnStatus];
}

- (void)configUI
{
    NSString *smsCodePlaceHolder = @"";
    
    self.codeCountingLb.hidden = NO;
    self.titleLabel.text = @"手机号登录";
    
    smsCodePlaceHolder = @"请输入验证码";
    
    self.phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.codeTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.codeTextField.secureTextEntry = NO;
    
    NSAttributedString *attrCode = [[NSAttributedString alloc]initWithString:smsCodePlaceHolder attributes:@{NSFontAttributeName:zy_fontSize15,NSForegroundColorAttributeName:RGBA_HexCOLOR(0xA0A0A0, 1.0)}];
    [self.codeTextField setAttributedPlaceholder:attrCode];
    
    self.phoneTextField.text = @"";
    self.codeTextField.text = @"";
    [self.phoneTextField resignFirstResponder];
    [self.codeTextField resignFirstResponder];
    
    self.phoneTextField.text = ORShareAccountComponent.accountNum;
}

#pragma mark - buttonAction

- (void)leftButtonAction:(UIButton *)btn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)submitAction
{
    [self.view endEditing:YES];
    
    if (![self checkPhoneState]) {
        [SVProgressHUD showInfoWithStatus:@"请输入合法的手机号"];
        return;
    }
    
    if (![self checkSMSCodeState]) {
        [SVProgressHUD showInfoWithStatus:@"请输入正确的验证码"];
        return;
    }
    
    if (![self checkXieYiState]) {
        [SVProgressHUD showInfoWithStatus:@"请同意协议"];
        return;
    }
    
    BOOL isLoad = [self.loginDataModel loginAccount:self.phoneTextField.text code:self.codeTextField.text];
    if (isLoad) {
        [SVProgressHUD showWithStatus:self.loginDataModel.loadTips];
    } else {
        [SVProgressHUD dismiss];
    }
}

- (void)xieYiAction:(UIButton *)btn
{
    [self.view endEditing:YES];
    if (self.xieYi1Btn == btn) {
        //用户协议1
        UIViewController *vc = [[ORH5ViewController alloc] initWithURL:orangeUserProtocol.urlWithString];
        vc.edgesForExtendedLayout = UIRectEdgeNone;
        [self.navigationController pushViewController:vc animated:YES];
    } else if (self.xieYi2Btn == btn) {
        //用户协议2 隐私协议
        UIViewController *vc = [[ORH5ViewController alloc] initWithURL:orangePrivacyProtocol.urlWithString];
        vc.edgesForExtendedLayout = UIRectEdgeNone;
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        self.xieYiBtn.selected = !self.xieYiBtn.selected;
        self.submitBtn.enabled = self.xieYiBtn.selected;
    }
}

- (BOOL)checkPhoneState
{
    return [self.phoneTextField.text mdf_isValidatedMobile];
}

- (BOOL)checkSMSCodeState
{
    return [self.codeTextField.text mdf_isPureInt];
}

- (BOOL)checkXieYiState
{
    return self.xieYiBtn.selected;
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (self.codeTextField == textField) {
        self.codeTextField.text = nil;
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];

    return [toBeString isEqualToString:@""] || [self isNumberWithText:toBeString];
}

- (BOOL)isNumberWithText:(NSString *)text
{
    NSString *regex = @"[0-9]+";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:text];
}

- (void)textFieldChangeAction:(UITextField *)textField
{
    [self submitBtnStatus];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self submitBtnStatus];
}

- (void)submitBtnStatus
{
    if (self.phoneTextField.text.length > 1 && self.codeTextField.text.length > 1) {
        self.submitBtn.enabled = YES;
        self.submitBtn.backgroundColor = LGDMianColor;
    } else {
        self.submitBtn.enabled = NO;
        self.submitBtn.backgroundColor = gnh_color_ee;
    }
}

#pragma mark - Handle Data

- (void)handleDataModelSuccess:(GNHBaseDataModel *)gnhModel
{
    [super handleDataModelSuccess:gnhModel];
    if ([gnhModel isKindOfClass:[ORLoginSMSCodeDataModel class]]) {
        [self.codeCountingLb countFrom:60 to:1 withDuration:60];
    } else if ([gnhModel isKindOfClass:[ORLoginDataModel class]]) {
        [SVProgressHUD dismiss];
        
        // 更新用户信息
        [[ORUserInformManager sharedInstance] updateUserInfo:nil];
        
        // 存储账号
        [ORShareAccountComponent storeLastLoginAccount:self.phoneTextField.text];
        
        // 存储token
        [ORShareAccountComponent storeAccessToken:self.loginDataModel.loginItem.token];
        
        [ORMainAPI leaveCurrentPage:self animated:YES completion:^{
            // 登录成功通知
            [[NSNotificationCenter defaultCenter] postNotificationName:ORAccountLoginSuccessNotification object:nil userInfo:nil];
        }];
    }
}

- (void)handleDataModelError:(GNHBaseDataModel *)gnhModel
{
    [super handleDataModelError:gnhModel];
}

- (void)restoreUserInfo:(NSString *)token uid:(NSString *)uid uname:(NSString *)uname avatarUrl:(NSString *)avatarUrl
{

}

#pragma mark - Properties

- (ORLoginSMSCodeDataModel *)loginSMSModel
{
    if (!_loginSMSModel) {
        _loginSMSModel = [self produceModel:[ORLoginSMSCodeDataModel class]];
    }
    return _loginSMSModel;
}

- (ORLoginDataModel *)loginDataModel
{
    if (!_loginDataModel) {
        _loginDataModel = [self produceModel:[ORLoginDataModel class]];
    }
    return _loginDataModel;
}

@end
