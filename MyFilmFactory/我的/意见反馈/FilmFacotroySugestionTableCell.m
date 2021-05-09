

#import "FilmFacotroySugestionTableCell.h"
@interface FilmFacotroySugestionTableCell ()
{
    UILabel * _FilmItemAdvicToplb;
    UIImageView * _FilmItemAdvicBtomlb;
}
@end
@implementation FilmFacotroySugestionTableCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle =  UITableViewCellSelectionStyleNone;
        
        UIView * FilmItemAdvicline = [[UIView alloc]initWithFrame:CGRectMake(K(10), K(49), SCREEN_Width-K(20), K(1))];
        FilmItemAdvicline.backgroundColor = LGDLightGaryColor;
        [self.contentView addSubview:FilmItemAdvicline];
        
        
        UILabel * FilmItemAdvicToplb = [[UILabel alloc]initWithFrame:CGRectMake(K(10), K(12.5), K(240), K(25))];
        
        FilmItemAdvicToplb.font = [UIFont systemFontOfSize:14];
        FilmItemAdvicToplb.textColor =  LGDBLackColor;
        
        [self.contentView addSubview:FilmItemAdvicToplb];
        _FilmItemAdvicToplb = FilmItemAdvicToplb;
        
        
        UIImageView * FilmItemAdvicBtomlb = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_Width-K(40), K(15), K(20), K(20))];
        FilmItemAdvicBtomlb.image = [UIImage imageNamed:@"kulian"];
        [self.contentView addSubview:FilmItemAdvicBtomlb];
        _FilmItemAdvicBtomlb = FilmItemAdvicBtomlb;
        
        
    }
    return self;
}
-(void)setFilmitems:(FilmFactoryModel *)Filmitems{
    _Filmitems = Filmitems;
    _FilmItemAdvicToplb.text = Filmitems.FilmFacrtoryName;
    _FilmItemAdvicBtomlb.hidden = !Filmitems.FilmStatus;
}

@end
