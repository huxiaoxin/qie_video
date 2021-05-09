
#import "FilmZoneJubaoTableviewCell.h"
@interface FilmZoneJubaoTableviewCell ()
{
    UILabel * _FilmZoneTopTitle;
    UIImageView * _FilmZoneBtomTitle;
}
@end
@implementation FilmZoneJubaoTableviewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle =  UITableViewCellSelectionStyleNone;
        UIView * FilmZonelineView = [[UIView alloc]initWithFrame:CGRectMake(K(15), K(49), SCREEN_Width-K(30), K(1))];
        FilmZonelineView.backgroundColor = LGDLightGaryColor;
        [self.contentView addSubview:FilmZonelineView];
        
        UILabel * FilmZoneTopTitle  = [[UILabel alloc]initWithFrame:CGRectMake(K(15), 0, K(200), K(49))];
        FilmZoneTopTitle.font = KSysFont(15);
        FilmZoneTopTitle.textColor = LGDBLackColor;
        [self.contentView addSubview:FilmZoneTopTitle];
        _FilmZoneTopTitle = FilmZoneTopTitle;
        
        
        UIImageView * FilmZoneBtomTitle  = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_Width-K(35), K(15), K(20), K(20))];
        [self.contentView addSubview:FilmZoneBtomTitle];
        _FilmZoneBtomTitle = FilmZoneBtomTitle;
        
    }
    return self;
}
-(void)setFilmItem:(FilmZoneJubaoModel *)FilmItem{
    _FilmItem = FilmItem;
    _FilmZoneTopTitle.text = FilmItem.FilmZoneText;
    _FilmZoneBtomTitle.image = [UIImage imageNamed:FilmItem.FilmZoneStatus ? @"xuanzhong1" : @"xuanzhongyuandian"];
    
}
@end
