

#import "FilmFactoryLoginViewController.h"
#import "FilmFactoryAboutusViewController.h"
#import "UITextField+AddPlaceholder.h"
@interface FilmFactoryLoginViewController ()
{
    NSTimer *    _FilmFacotrtTimer;
    NSInteger _FilmFacotrtNums;
    
}
@property(nonatomic,strong) UITextField * FilmFacotrPhoneTextField;
@property(nonatomic,strong) UITextField * FilmFacotrPasswordTextField;
@property(nonatomic,strong) UIButton * FilmFacotrCodeBtn;
@end

@implementation FilmFactoryLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _FilmFacotrtNums = 60;
    self.view.backgroundColor = [UIColor whiteColor];
    self.gk_navBarAlpha = 0;
    UIButton *  FilmFacotrCealrBtn  = [UIButton buttonWithType:UIButtonTypeCustom];
    [FilmFacotrCealrBtn setTitle:@"跳过" forState:UIControlStateNormal];
    FilmFacotrCealrBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [FilmFacotrCealrBtn setTitleColor:LGDMianColor forState:UIControlStateNormal];
    [FilmFacotrCealrBtn addTarget:self action:@selector(FilmFacotrCealrBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.gk_navItemRightSpace = RealWidth(20);
    self.gk_navRightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:FilmFacotrCealrBtn];
    
    UIImageView * LogoImgView = [[UIImageView alloc]initWithFrame:CGRectMake(RealWidth(20), NaviH+RealWidth(30), RealWidth(36), RealWidth(36))];
    LogoImgView.layer.cornerRadius = RealWidth(18);
    LogoImgView.layer.masksToBounds = YES;
//    [LogoImgView setBackgroundColor:LGDMianColor];
    LogoImgView.image = [UIImage imageNamed:@"logo"];
    [self.view addSubview:LogoImgView];
    
    UILabel * tipslb = [[UILabel alloc]initWithFrame:CGRectMake(RealWidth(20), CGRectGetMaxY(LogoImgView.frame)+RealWidth(20), RealWidth(250), RealWidth(20))];
    tipslb.textColor = LGDMianColor;
    tipslb.font = [UIFont boldSystemFontOfSize:20];
    tipslb.text = @"欢迎使用";
    [self.view addSubview:tipslb];
    
    UILabel * subtipslb = [[UILabel alloc]initWithFrame:CGRectMake(RealWidth(20), CGRectGetMaxY(tipslb.frame)+RealWidth(10), RealWidth(250), RealWidth(13))];
    subtipslb.textColor = LGDLightBLackColor;
    subtipslb.font = [UIFont systemFontOfSize:13];
    subtipslb.text = @"未注册时输入手机号即注册成功";
    [self.view addSubview:subtipslb];
    
    
    UIView * FilmFacotrInputView  = [[UIView alloc]initWithFrame:CGRectMake(RealWidth(20), CGRectGetMaxY(subtipslb.frame)+RealWidth(20), SCREEN_Width-RealWidth(40), RealWidth(90))];
    FilmFacotrInputView.layer.borderColor = LGDLightBLackColor.CGColor;
    FilmFacotrInputView.layer.borderWidth = 0.5;
    FilmFacotrInputView.layer.cornerRadius = RealWidth(5);
    FilmFacotrInputView.layer.masksToBounds = YES;
    [self.view addSubview:FilmFacotrInputView];
    
    UIView *  verline = [[UIView alloc]initWithFrame:CGRectMake(0, RealWidth(45), CGRectGetWidth(FilmFacotrInputView.frame), 0.5)];
    verline.backgroundColor = LGDLightBLackColor;
    [FilmFacotrInputView addSubview:verline];
    
    UIImageView * phoneImg =[self imgConfigWithName:[UIImage imageNamed:@"genghuanshoujihao"] imgFrame:CGRectMake(RealWidth(15), RealWidth(13.5), RealWidth(18), RealWidth(18))];
    [FilmFacotrInputView addSubview:phoneImg];
    
    UIImageView * codeImg =[self imgConfigWithName:[UIImage imageNamed:@"mima"] imgFrame:CGRectMake(RealWidth(15), RealWidth(13.5)+CGRectGetMaxY(verline.frame), RealWidth(18), RealWidth(18))];
    [FilmFacotrInputView addSubview:codeImg];
    
    
    UITextField * FilmFacotrPhoneTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(phoneImg.frame)+RealWidth(10), 0, CGRectGetWidth(FilmFacotrInputView.frame)-CGRectGetMaxX(phoneImg.frame)-RealWidth(10), RealWidth(45))];
    FilmFacotrPhoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    FilmFacotrPhoneTextField.font = [UIFont systemFontOfSize:16];
    FilmFacotrPhoneTextField.textColor = LGDBLackColor;
    FilmFacotrPhoneTextField.clearButtonMode = UITextFieldViewModeAlways;
    [FilmFacotrPhoneTextField addPlaceholders:[UIFont systemFontOfSize:13] holderStr:@"手机号" holderColor:LGDGaryColor];
    [FilmFacotrInputView addSubview:FilmFacotrPhoneTextField];
    _FilmFacotrPhoneTextField =  FilmFacotrPhoneTextField;
    
    
    UITextField * FilmFacotrPasswordTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(phoneImg.frame)+RealWidth(10), CGRectGetMaxY(verline.frame), CGRectGetWidth(FilmFacotrInputView.frame)-CGRectGetMaxX(phoneImg.frame)-RealWidth(10+80), RealWidth(45))];
    FilmFacotrPasswordTextField.keyboardType = UIKeyboardTypeDefault;
    FilmFacotrPasswordTextField.font = [UIFont systemFontOfSize:16];
    FilmFacotrPasswordTextField.textColor = LGDBLackColor;
    FilmFacotrPasswordTextField.clearButtonMode = UITextFieldViewModeAlways;
    [FilmFacotrPasswordTextField addPlaceholders:[UIFont systemFontOfSize:13] holderStr:@"验证码或密码" holderColor:LGDGaryColor];
    [FilmFacotrInputView addSubview:FilmFacotrPasswordTextField];
    _FilmFacotrPasswordTextField = FilmFacotrPasswordTextField;
    
    
    UIButton * FilmFacotrCodeBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(FilmFacotrInputView.frame)-RealWidth(80), CGRectGetMaxY(verline.frame), RealWidth(80), RealWidth(45))];
    FilmFacotrCodeBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [FilmFacotrCodeBtn setTitleColor:LGDMianColor forState:UIControlStateNormal];
    [FilmFacotrCodeBtn addTarget:self action:@selector(FilmFacotrCodeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [FilmFacotrCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [FilmFacotrInputView addSubview:FilmFacotrCodeBtn];
    _FilmFacotrCodeBtn = FilmFacotrCodeBtn;
    
    
    
    UIButton * FilmFacotrloginBtn = [[UIButton alloc]initWithFrame:CGRectMake(RealWidth(20), CGRectGetMaxY(FilmFacotrInputView.frame)+RealWidth(30), SCREEN_Width-RealWidth(40), RealWidth(40))];
    [FilmFacotrloginBtn setBackgroundColor:LGDMianColor];
    FilmFacotrloginBtn.layer.cornerRadius = RealWidth(5);
    FilmFacotrloginBtn.layer.masksToBounds = YES;
    [FilmFacotrloginBtn setTitle:@"登录" forState:UIControlStateNormal];
    FilmFacotrloginBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    FilmFacotrloginBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [FilmFacotrloginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [FilmFacotrloginBtn addTarget:self action:@selector(FilmFacotrloginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:FilmFacotrloginBtn];
    
    
    UILabel * privatelb =[[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(FilmFacotrloginBtn.frame)+RealWidth(20), SCREEN_Width, RealWidth(15))];
    privatelb.textAlignment = NSTextAlignmentCenter;
    privatelb.font = [UIFont systemFontOfSize:13];
    privatelb.userInteractionEnabled = YES;
    [self.view addSubview:privatelb];
    NSString * Str1 = @"登录或注册，即代表你同意";
    NSString *Str2 = @"<用户使用协议>";
    NSMutableAttributedString * attbute = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@%@",Str1,Str2]];
    [attbute addAttribute:NSForegroundColorAttributeName value:LGDGaryColor range:NSMakeRange(0, Str1.length)];
    [attbute addAttribute:NSForegroundColorAttributeName value:LGDMianColor range:NSMakeRange(Str1.length, Str2.length)];
    privatelb.attributedText = attbute;
    
    UITapGestureRecognizer * privaterTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(PrivateTapClick)];
    [privatelb addGestureRecognizer:privaterTap];
}
-(void)FilmFacotrCodeBtnClick:(UIButton *)codeBtn{
    if (_FilmFacotrPhoneTextField.text.length == 0) {
        [LCProgressHUD showInfoMsg:@"请输入手机号"];
        return;
    }
    if (_FilmFacotrPhoneTextField.text.length != 11) {
        [LCProgressHUD showInfoMsg:@"请输入正确的手机号"];
        return;
    }
    [LCProgressHUD showLoading:@""];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [LCProgressHUD showInfoMsg:@"发送成功"];
        self->_FilmFacotrtTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(FilmFacotrlogigetCodeAction) userInfo:nil repeats:YES];
        [self->_FilmFacotrtTimer fire];
        
    });
    
}
-(void)FilmFacotrlogigetCodeAction{
    _FilmFacotrtNums--;
    _FilmFacotrCodeBtn.enabled = NO;
    [_FilmFacotrCodeBtn setTitle:[NSString stringWithFormat:@"%lds后可重发",(long)_FilmFacotrtNums] forState:UIControlStateNormal];
    if (_FilmFacotrtNums == 0) {
        [_FilmFacotrtTimer invalidate];
        [_FilmFacotrCodeBtn setTitle:[NSString stringWithFormat:@"重新获取"] forState:UIControlStateNormal];
        _FilmFacotrCodeBtn.enabled = YES;
    }
    
}
-(void)FilmFacotrloginBtnClick{
    
    if (_FilmFacotrPhoneTextField.text.length == 0) {
        [LCProgressHUD showInfoMsg:@"请输入手机号"];
        return;
    }
    if (_FilmFacotrPhoneTextField.text.length != 11) {
        [LCProgressHUD showInfoMsg:@"请输入正确的手机号"];
        return;
    }
    if (_FilmFacotrPasswordTextField.text.length == 0) {
        [LCProgressHUD showInfoMsg:@"请输入验证码或密码"];
        return;
    }
    [LCProgressHUD showLoading:@""];
    MJWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([weakSelf.FilmFacotrPhoneTextField.text isEqualToString:@"15068761251"] && [weakSelf.FilmFacotrPasswordTextField.text isEqualToString:@"test001"]) {
            [FilmFactoryToolModel FilmFacotryToolModelWithLoginSucced];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"FilmFacotryLoginSucced" object:nil];

            [LCProgressHUD showSuccess:@"登录成功"];
            [weakSelf dismissViewControllerAnimated:YES completion:nil];
        }else{
            [LCProgressHUD showInfoMsg:@"密码错误"];
        }
        
    });
    
}
-(void)PrivateTapClick{
    FilmFactoryAboutusViewController * privateVc = [[FilmFactoryAboutusViewController alloc]init];
    privateVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:privateVc animated:YES];
}
-(UIImageView *)imgConfigWithName:(UIImage *)imgNamestr imgFrame:(CGRect)imgFrame{
    UIImageView * img = [[UIImageView alloc]initWithFrame:imgFrame];
    img.image =  imgNamestr;
    return img;
}
-(UILabel *)holderlbWithConfig:(NSString *)lbstr lbFrame:(CGRect)lbFrame{
    UILabel * lb =[[UILabel alloc]initWithFrame:lbFrame];
    lb.text = lbstr;
    lb.textColor =  LGDLightGaryColor;
    lb.font = [UIFont systemFontOfSize:13];
    return lb;
}
-(void)FilmFacotrCealrBtnClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

