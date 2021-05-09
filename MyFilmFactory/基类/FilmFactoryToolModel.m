#import "FilmFactoryToolModel.h"

@implementation FilmFactoryToolModel
+(void)FilmFacotryToolModelWithLoginSucced{
    [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"FilmFactory"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(void)XiaoxinpaperToolModelWithLoginout{
    [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:@"FilmFactory"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(BOOL)FilmFactoryisLogin{
    NSString * filmFacotry_islogin = [[NSUserDefaults standardUserDefaults] objectForKey:@"FilmFactory"];
    return [filmFacotry_islogin boolValue];
    
}
+(NSString *)FilmGetuserName{
    NSString * userNmae = [[NSUserDefaults standardUserDefaults] objectForKey:@"FilmGetuserName"];
    return userNmae.length == 0 ? @"Account_1251" : userNmae;
}
@end
