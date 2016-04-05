//
//  MyHeadView.h
//  SuanFaTest
//
//  Created by jiejin on 16/3/29.
//  Copyright © 2016年 jiejin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RewardModel;


typedef NS_ENUM(NSInteger, UserActionType) {
    EntenrUserCenterType,
    ChangeRewardStateType
};

@protocol MyHeadViewDelegate <NSObject>

- (void)userActionWithUserType:(UserActionType)actionType andNeedValue:(NSString *)value;

@end



@interface MyHeadView : UICollectionReusableView

@property (nonatomic, strong) UILabel *contentLab;
@property (nonatomic, weak) id<MyHeadViewDelegate> delegate;


- (CGFloat)getHeadViewHeightWithModel:(RewardModel *)model;

- (void)updateUIWithModel:(RewardModel *)model;


@end
