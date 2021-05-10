//
//  GKLikeView.h
//  ORHotVideo
//
//  Created by gaokun on 2019/5/27.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ORLikeViewAction)(BOOL isLike);

@interface ORLikeView : UIView

@property (nonatomic, copy) ORLikeViewAction likeViewAction;
@property (nonatomic, assign) BOOL isLike;

- (void)startAnimationWithIsLike:(BOOL)isLike;

- (void)setupLikeState:(BOOL)isLike;

- (void)setupLikeCount:(NSString *)count;

@end

NS_ASSUME_NONNULL_END
