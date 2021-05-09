//
//  ORFeedbackViewController.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/15.
//

#import "ORFeedbackViewController.h"
#import "ORFeedbackDataModel.h"

@interface ORFeedbackViewController () <UITextViewDelegate>

@property (nonatomic, strong) ORFeedbackDataModel *feedbackDataModel;

@property (nonatomic, strong) UITextView *contentTextView;
@property (nonatomic, strong) UILabel *placeholderLabel;
@property (nonatomic, strong) UILabel *countLabel;

@end

@implementation ORFeedbackViewController

#pragma mark - LifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupUI];
    
    [self setupData];
    
    [self setupNotifications];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

#pragma mark - setupUI

- (void)setupUI
{
    GNHWeakSelf;
    
    UITextView *contentTextView = [UITextView ly_TextViewWithText:@"" font:zy_fontSize14 textColor:gnh_color_a delegate:self];
    contentTextView.backgroundColor = gnh_color_d;
    contentTextView.textAlignment = NSTextAlignmentLeft;
    contentTextView.delegate = self;
    contentTextView.layer.cornerRadius = 10.0f;
    contentTextView.layer.masksToBounds = YES;
    [self.tableView addSubview:contentTextView];
    self.contentTextView = contentTextView;
    [contentTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view).inset(15.0f);
        make.top.equalTo(self.tableView).offset(15.0f);
        make.height.mas_equalTo(154.0f);
    }];
    
    UILabel *placeholderLabel = [UILabel ly_LabelWithTitle:@"请描述您的问题～" font:zy_fontSize14 titleColor:gnh_color_e];
    placeholderLabel.textAlignment = NSTextAlignmentLeft;
    placeholderLabel.numberOfLines = 0;
    placeholderLabel.enabled = NO;
    placeholderLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [self.contentTextView addSubview:placeholderLabel];
    [placeholderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.contentTextView).offset(7.0f);
        make.left.equalTo(weakSelf.contentTextView).offset(5.0f);
        make.right.equalTo(weakSelf.contentTextView).offset(-7.0f);
    }];
    self.placeholderLabel = placeholderLabel;
    
    UILabel *countLabel = [UILabel ly_LabelWithTitle:@"0/200" font:zy_fontSize14 titleColor:gnh_color_f];
    countLabel.textAlignment = NSTextAlignmentRight;
    [self.contentTextView addSubview:countLabel];
    [countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contentTextView).offset(132.0f);
        make.right.mas_equalTo(self.view.mas_right).offset(-24.f);
        make.height.mas_offset(10.0f);
    }];
    self.countLabel = countLabel;
    
    UIButton *submitButton = [[UIButton alloc] init];
    submitButton.backgroundColor = LGDMianColor;
    submitButton.layer.cornerRadius = 22.0f;
    submitButton.layer.masksToBounds = YES;
    [submitButton setTitle:@"提交" forState:UIControlStateNormal];
    [submitButton setTitleColor:gnh_color_b forState:UIControlStateNormal];
    submitButton.titleLabel.font = zy_fontSize15;
    [submitButton addTarget:self action:@selector(submitAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:submitButton];
    [submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contentTextView.mas_bottom).offset(17.0f);
        make.left.right.equalTo(self.view).inset(15.0f);
        make.height.mas_equalTo(@44.0f);
    }];
}

#pragma mark - setupData

- (void)setupData
{
    self.navigationItem.title = @"意见反馈";
}

#pragma mark - UITextView delegate

- (void)textViewDidChange:(UITextView *)textView
{
    self.placeholderLabel.text = textView.text;
    if (textView.text.length == 0) {
        self.placeholderLabel.text = @"请留下您宝贵的意见～";
    } else {
        self.placeholderLabel.text = @"";
    }
    
    self.countLabel.text = [NSString stringWithFormat:@"%@/200", @(textView.text.length)];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (textView.text.length + text.length > 200) {
        return NO;
    }
    
    return YES;;
}

#pragma mark - buttonAction

- (void)submitAction:(id)sender
{
    if (!self.contentTextView.text.length) {
        [SVProgressHUD showInfoWithStatus:@"请留下您宝贵的意见～"];
        return;
    }
    
    [self.feedbackDataModel submitWithContent:self.contentTextView.text];
}

#pragma mark - Handle Data

- (void)handleDataModelSuccess:(GNHBaseDataModel *)gnhModel
{
    [super handleDataModelSuccess:gnhModel];
    if ([gnhModel isKindOfClass:[ORFeedbackDataModel class]]) {
        [SVProgressHUD showSuccessWithStatus:@"已提交"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.navigationController popViewControllerAnimated:YES];
        });
    }
}

- (void)handleDataModelError:(GNHBaseDataModel *)gnhModel
{
    [super handleDataModelError:gnhModel];
}

#pragma mark - Properties

- (ORFeedbackDataModel *)feedbackDataModel
{
    if (!_feedbackDataModel) {
        _feedbackDataModel = [self produceModel:[ORFeedbackDataModel class]];
    }
    return _feedbackDataModel;
}

@end
