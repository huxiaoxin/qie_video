//
//  ORChooseSourceView.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/2/7.
//

#import <UIKit/UIKit.h>
#import "ORVideoPlayerDataModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^ORChooseSourceCompleteBlock)(NSString *sourceName);

@interface ORChooseSourceView : UIView

@property (nonatomic, copy) ORChooseSourceCompleteBlock chooseSourceCompleteBlock;

- (instancetype)initWithFrame:(CGRect)frame sources:(NSMutableArray <__kindof ORVideoSourceItem *> *)sources selectSource:(NSString *)selectSourceName;

@end

NS_ASSUME_NONNULL_END
