//
//  FilmFactoryChangeInfoViewController.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/23.
//

#import "FilmFactoryChangeInfoViewController.h"
#import "UITextField+AddPlaceholder.h"
@interface FilmFactoryChangeInfoViewController ()
@property(nonatomic,strong) UITextField * MyTextField;
@end

@implementation FilmFactoryChangeInfoViewController

-(void)FilmItemAdvicCommitbtnClick{
    if (_MyTextField.text.length == 0) {
        [LCProgressHUD showInfoMsg:@"没有修改任何内容"];
        return;
    }
    [LCProgressHUD showLoading:@""];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[NSUserDefaults standardUserDefaults] setObject:self->_MyTextField.text forKey:@"FilmGetuserName"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [LCProgressHUD showSuccess:@"修改成功"];
        [self.navigationController popViewControllerAnimated:YES];
    });
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"修改信息";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIView * FilmItemAdvicCommitView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, K(80), K(60))];
    UIButton * FilmItemAdvicCommitbtn = [[UIButton alloc]initWithFrame:CGRectMake(K(20), K(12), K(40), K(20))];
    [FilmItemAdvicCommitbtn setTitle:@"提交" forState:UIControlStateNormal];
    [FilmItemAdvicCommitbtn setTitleColor:LGDBLackColor forState:UIControlStateNormal];
    FilmItemAdvicCommitbtn.titleLabel.font =[UIFont systemFontOfSize:14];
    [FilmItemAdvicCommitbtn addTarget:self action:@selector(FilmItemAdvicCommitbtnClick) forControlEvents:UIControlEventTouchUpInside];
    [FilmItemAdvicCommitView addSubview:FilmItemAdvicCommitbtn];
    
    self.gk_navRightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:FilmItemAdvicCommitView];
    
    UIView * MyConenView = [[UIView alloc]initWithFrame:CGRectMake(K(15), NaviH+K(15), SCREEN_Width-K(30), K(40))];
    MyConenView.backgroundColor = LGDLightGaryColor;
    MyConenView.layer.cornerRadius =K(5);
    MyConenView.layer.masksToBounds = YES;
    [self.view addSubview:MyConenView];
    
    UITextField * MyTextField = [[UITextField alloc]initWithFrame:CGRectMake(K(10), 0, SCREEN_Width-K(40), K(40))];
    MyTextField.backgroundColor = LGDLightGaryColor;
    MyTextField.layer.cornerRadius =K(5);
    MyTextField.layer.masksToBounds = YES;
    [MyTextField addPlaceholders:[UIFont systemFontOfSize:14] holderStr:@"输入昵称" holderColor:LGDGaryColor];
    [MyConenView addSubview:MyTextField];
    _MyTextField=  MyTextField;
    
    UILabel  * tpislb = [[UILabel alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(MyConenView.frame)+K(10), SCREEN_Width-K(30), K(14))];
    tpislb.textColor = LGDGaryColor;
    tpislb.font =[UIFont systemFontOfSize:12];
//    tpislb.text = @"最多输入15个字符，字母开头，设置后不能修改";
    [self.view addSubview:tpislb];
    
    //
    
    NSTextAttachment * attment = [[NSTextAttachment alloc]init];
    attment.image = [UIImage imageNamed:@"tishi"];
    attment.bounds = CGRectMake(0, -2, K(14), K(14));
    NSAttributedString * attbute = [NSAttributedString attributedStringWithAttachment:attment];
    NSMutableAttributedString * mutablAtt = [[NSMutableAttributedString alloc]initWithString:@" 最多输入15个字符，字母开头，设置后不能修改"];
    [mutablAtt insertAttributedString:attbute atIndex:0];
    tpislb.attributedText = mutablAtt;
    // Do any additional setup after loading the view.
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MyTextField becomeFirstResponder];
    });
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
