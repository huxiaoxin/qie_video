//
//  FilmFacortLoactionDetailFooter.m
//  FilmFactory
//
//  Created by codehzx on 2021/4/25.
//

#import "FilmFacortLoactionDetailFooter.h"
#import "ShuyunBallSetingBtn.h"
#import "ShuyunTeseBtn.h"
@interface FilmFacortLoactionDetailFooter ()

@end
@implementation FilmFacortLoactionDetailFooter
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        UIView * RoomDeepView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, K(109+29))];
        RoomDeepView.backgroundColor = [UIColor whiteColor];
        [self addSubview:RoomDeepView];
        

        UIView * Shuyunline = [[UIView alloc]initWithFrame:CGRectMake(K(16), K(6.5), SCREEN_Width-K(32), K(1))];
        Shuyunline.backgroundColor =  LGDLightGaryColor;
        [RoomDeepView addSubview:Shuyunline];
        
        ShuyunBallSetingBtn * Shuyunbtn1 = [[ShuyunBallSetingBtn alloc]initWithFrame:CGRectMake(K(17), CGRectGetMaxY(Shuyunline.frame)+K(11.5), K(87+15), K(35))];
        Shuyunbtn1.ShuyunBallImgView.image = [UIImage imageNamed:@"pudiban2"];
        Shuyunbtn1.ShuyunBalllb.text = @"地板型胶地板";
        [RoomDeepView addSubview:Shuyunbtn1];
        
        
        ShuyunBallSetingBtn * Shuyunbtn2 = [[ShuyunBallSetingBtn alloc]initWithFrame:CGRectMake(K(18)+CGRectGetMaxX(Shuyunbtn1.frame), CGRectGetMaxY(Shuyunline.frame)+K(11.5), K(87+15), K(35))];
        Shuyunbtn2.ShuyunBallImgView.image = [UIImage imageNamed:@"diaodengB"];
        Shuyunbtn2.ShuyunBalllb.text = @"灯光吊灯";
        [RoomDeepView addSubview:Shuyunbtn2];

        ShuyunBallSetingBtn * Shuyunbtn3 = [[ShuyunBallSetingBtn alloc]initWithFrame:CGRectMake(K(16)+CGRectGetMaxX(Shuyunbtn2.frame), CGRectGetMaxY(Shuyunline.frame)+K(11.5), K(87+15), K(35))];
        Shuyunbtn3.ShuyunBallImgView.image = [UIImage imageNamed:@"kongtiaoB"];
        Shuyunbtn3.ShuyunBalllb.text = @"休息区空调";
        [RoomDeepView addSubview:Shuyunbtn3];

        UIView * Shuyunline1 = [[UIView alloc]initWithFrame:CGRectMake(K(16), CGRectGetMaxY(Shuyunbtn3.frame)+K(8), SCREEN_Width-K(32), K(1))];
        Shuyunline1.backgroundColor =  LGDLightGaryColor;
        [RoomDeepView addSubview:Shuyunline1];

        NSArray * ImgArr =  @[@"免费无线",@"停车场",@"附近餐厅",@"便利店"];
    
        for (int Shuyunindex = 0; Shuyunindex < ImgArr.count; Shuyunindex++) {
            ShuyunTeseBtn *Shuyunbtn = [[ShuyunTeseBtn alloc]initWithFrame:CGRectMake(SCREEN_Width/ImgArr.count*Shuyunindex, CGRectGetMaxY(Shuyunline1.frame)+K(10), SCREEN_Width/ImgArr.count, K(50))];
            Shuyunbtn.ShuyunBalllb.text =  ImgArr[Shuyunindex];
            Shuyunbtn.ShuyunBallImgView.image = [UIImage imageNamed:ImgArr[Shuyunindex]];
            
            [RoomDeepView addSubview:Shuyunbtn];
        }
        
        
    }
    return self;
}
@end
