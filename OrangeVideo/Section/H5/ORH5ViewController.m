//
//  ORH5ViewController.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/8.
//

#import "ORH5ViewController.h"

@interface ORH5ViewController ()

@end

@implementation ORH5ViewController

- (instancetype)init
{
    if (self = [super init]) {
        self.progressTintColor = gnh_color_c;
        self.backItemImgName = @"com_back";
        self.allowsBFNavigationGesture = YES;
        self.isHiddleLeftItemBar = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.superview.backgroundColor = gnh_color_b;
}

@end
