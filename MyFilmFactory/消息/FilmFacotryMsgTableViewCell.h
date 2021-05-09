//
//  FilmFacotryMsgTableViewCell.h
//  FilmFactory
//
//  Created by codehzx on 2021/4/20.
//

#import <UIKit/UIKit.h>
#import "FilmChatMsgListModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface FilmFacotryMsgTableViewCell : UITableViewCell
@property(nonatomic,strong) FilmChatMsgListModel * FilmModel;
@end

NS_ASSUME_NONNULL_END
