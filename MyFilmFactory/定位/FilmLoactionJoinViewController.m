//
//  FilmLoactionJoinViewController.m
//  FilmFactory
//
//  Created by codehzx on 2021/4/25.
//

#import "FilmLoactionJoinViewController.h"
#import "UITextField+AddPlaceholder.h"
@interface FilmLoactionJoinViewController ()
@property(nonatomic,strong) UIButton * FilmJoninbtn;
@property(nonatomic,strong) UITextField * FilmdInputTextfiled;
@property(nonatomic,strong) UITextField * FilmdInputTextfiled1;
@property(nonatomic,strong) UITextField * FilmdInputTextfiled2;
@property(nonatomic,strong) UITextField * FilmdInputTextfiled3;
@end

@implementation FilmLoactionJoinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"报名详情";
    self.view.backgroundColor = LGDLightGaryColor;
    
    UIView * FilmTopView = [[UIView alloc]initWithFrame:CGRectMake(0, NaviH+K(10), SCREEN_Width, K(80))];
    FilmTopView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:FilmTopView];
    
    UIImageView * FilmTopImgView =[[UIImageView alloc]initWithFrame:CGRectMake(K(15), K(10), K(60), K(60))];
//    FilmTopImgView.backgroundColor = LGDMianColor;
    FilmTopImgView.layer.cornerRadius = K(5);
    FilmTopImgView.layer.masksToBounds = YES;
    [FilmTopView addSubview:FilmTopImgView];
    [FilmTopImgView sd_setImageWithURL:[NSURL URLWithString:self.filmModel.FilmThubImgView]];
    UILabel * FilmToplb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(FilmTopImgView.frame)+K(10), K(10), SCREEN_Width-CGRectGetMaxX(FilmTopImgView.frame)-K(20), K(60))];
    FilmToplb.numberOfLines =  0;
    FilmToplb.textColor = [UIColor blackColor];
    FilmToplb.font = [UIFont systemFontOfSize:13];
    FilmToplb.text = self.filmModel.title;
    [FilmTopView addSubview:FilmToplb];
    
    
    
    UIView * FilmBtomView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(FilmTopView.frame)+K(10), SCREEN_Width, K(160))];
    FilmBtomView.backgroundColor=  [UIColor whiteColor];
    [self.view addSubview:FilmBtomView];
    
    
    UILabel * FilmFirstlb=  [self LbconfigerWithTtile:@"真实姓名" lbFrame:CGRectMake(K(10), 0, K(100), K(40))];
    [FilmBtomView addSubview:FilmFirstlb];
    
    UITextField * FilmdInputTextfiled = [self LbConfigtextFieldWithHoder:@"请输入真实姓名" FieldFrame:CGRectMake(CGRectGetMaxX(FilmFirstlb.frame), 0, SCREEN_Width-CGRectGetMaxX(FilmFirstlb.frame), K(40))];
    [FilmBtomView addSubview:FilmdInputTextfiled];
    _FilmdInputTextfiled = FilmdInputTextfiled;
    
    UILabel * FilmSecondlb=  [self LbconfigerWithTtile:@"公司名称" lbFrame:CGRectMake(K(10), CGRectGetMaxY(FilmFirstlb.frame), K(100), K(40))];
    [FilmBtomView addSubview:FilmSecondlb];
    
    UITextField * FilmdInputTextfiled1 = [self LbConfigtextFieldWithHoder:@"请输入公司名称" FieldFrame:CGRectMake(CGRectGetMaxX(FilmFirstlb.frame), CGRectGetMaxY(FilmFirstlb.frame), SCREEN_Width-CGRectGetMaxX(FilmSecondlb.frame), K(40))];
    [FilmBtomView addSubview:FilmdInputTextfiled1];
    _FilmdInputTextfiled1 = FilmdInputTextfiled1;
    
    
    UILabel * FilmThreedlb=  [self LbconfigerWithTtile:@"联系电话" lbFrame:CGRectMake(K(10), CGRectGetMaxY(FilmSecondlb.frame), K(100), K(40))];
    [FilmBtomView addSubview:FilmThreedlb];
    
    UITextField * FilmdInputTextfiled2 = [self LbConfigtextFieldWithHoder:@"请输入手机号" FieldFrame:CGRectMake(CGRectGetMaxX(FilmSecondlb.frame), CGRectGetMaxY(FilmSecondlb.frame), SCREEN_Width-CGRectGetMaxX(FilmThreedlb.frame), K(40))];
    [FilmBtomView addSubview:FilmdInputTextfiled2];
    _FilmdInputTextfiled2 = FilmdInputTextfiled2;
    
    
    UILabel * FilmFourelb=  [self LbconfigerWithTtile:@"备注" lbFrame:CGRectMake(K(10), CGRectGetMaxY(FilmThreedlb.frame), K(100), K(40))];
    [FilmBtomView addSubview:FilmFourelb];
    
    UITextField * FilmdInputTextfiled3 = [self LbConfigtextFieldWithHoder:@"如有特殊需求可填写在这儿" FieldFrame:CGRectMake(CGRectGetMaxX(FilmThreedlb.frame), CGRectGetMaxY(FilmThreedlb.frame), SCREEN_Width-CGRectGetMaxX(FilmFourelb.frame), K(40))];
    [FilmBtomView addSubview:FilmdInputTextfiled3];
    _FilmdInputTextfiled3=  FilmdInputTextfiled3;
    

    
    [self.view addSubview:self.FilmJoninbtn];
    // Do any additional setup after loading the view.
}
-(void)FilmJoninbtnClick{
    if (_FilmdInputTextfiled.text.length == 0) {
        [LCProgressHUD showInfoMsg:@"请填写真实姓名"];
        return;
    }
    if (_FilmdInputTextfiled1.text.length == 0) {
        [LCProgressHUD showInfoMsg:@"请填写公司名称"];
        return;
    }
    if (_FilmdInputTextfiled2.text.length == 0) {
        [LCProgressHUD showInfoMsg:@"请输入手机号"];
        return;
    }
    
    if (_FilmdInputTextfiled2.text.length != 11) {
        [LCProgressHUD showInfoMsg:@"请输入正确的手机号"];
        return;
    }
    [LCProgressHUD showLoading:@""];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [LCProgressHUD showSuccess:@"提交成功,请注意手机短信"];
        [self.navigationController popViewControllerAnimated:YES];
    });
    
}
- (UIButton *)FilmJoninbtn{
    if (!_FilmJoninbtn) {
        _FilmJoninbtn = [[UIButton alloc]initWithFrame:CGRectMake(0, SCREEN_Height-K(50), SCREEN_Width-K(0), K(50))];
        [_FilmJoninbtn setBackgroundColor: LGDMianColor];
        [_FilmJoninbtn setTitle:@"立即参与" forState:UIControlStateNormal];
        [_FilmJoninbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _FilmJoninbtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        _FilmJoninbtn.titleLabel.font = [UIFont systemFontOfSize:K(15)];
        [_FilmJoninbtn addTarget:self action:@selector(FilmJoninbtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _FilmJoninbtn;
}

-(UILabel *)LbconfigerWithTtile:(NSString *)titleStr lbFrame:(CGRect)lbFrame{
    NSString * configStr = [NSString stringWithFormat:@"  %@",titleStr];
    UILabel * lb = [[UILabel alloc]initWithFrame:lbFrame];
    NSTextAttachment  * attment = [[NSTextAttachment alloc]init];
    attment.image = [UIImage imageNamed:@"jiufuqianbaoicon14"];
    attment.bounds = CGRectMake(0, 0, K(10), K(10));
    NSAttributedString * attbu = [NSAttributedString attributedStringWithAttachment:attment];
    NSMutableAttributedString * lbAttb  =[[NSMutableAttributedString alloc]initWithString:configStr];
    [lbAttb addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, configStr.length)];
    [lbAttb insertAttributedString:attbu atIndex:0];
    lb.attributedText = lbAttb;
    return lb;
}
-(UITextField *)LbConfigtextFieldWithHoder:(NSString *)holdStr FieldFrame:(CGRect)FieldFRame{
    
    UITextField * Filed = [[UITextField alloc]initWithFrame:FieldFRame];
    [Filed addPlaceholders:[UIFont systemFontOfSize:12] holderStr:holdStr holderColor:LGDGaryColor];
    Filed.textColor = LGDBLackColor;
    Filed.font = [UIFont systemFontOfSize:14];
    Filed.clearButtonMode = UITextFieldViewModeAlways;
    return Filed;
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
