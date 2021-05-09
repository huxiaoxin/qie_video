//
//  SJDYTableViewCell.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/2/19.
//

#import <SJUIKit/SJUIKit.h>
#import "ORSliderView.h"
#import "ORHotChannelDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@class ORDYTableViewCell;

@protocol ORHotVideoControlViewDelegate <NSObject>

- (void)controlViewDidClickPriase:(ORDYTableViewCell *)controlView;

- (void)controlViewDidClickCollect:(ORDYTableViewCell *)controlView;

- (void)controlViewDidClickShare:(ORDYTableViewCell *)controlView;

- (void)controlViewDidClickPlayBtn:(ORDYTableViewCell *)controlView;

- (void)controlView:(ORDYTableViewCell *)controlView touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;

@end

@interface ORDYTableViewCell : SJBaseTableViewCell

@property (nonatomic, weak) id<ORHotVideoControlViewDelegate> delegate;

@property (nonatomic, strong) ORHotChannelDataItem  *videoItem;

@property (nonatomic, assign) BOOL isPlayButtonHidden;
@property (nonatomic, assign) BOOL isPlayButtonSelected;

- (void)setProgress:(float)progress;

- (void)startLoading;
- (void)stopLoading;

- (void)showLikeAnimation;
- (void)showUnLikeAnimation;

- (void)resumePlayStatus:(BOOL)isSelected;

@end

NS_ASSUME_NONNULL_END
