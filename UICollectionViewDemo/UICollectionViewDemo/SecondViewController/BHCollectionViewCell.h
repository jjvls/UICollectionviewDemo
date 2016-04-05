//
//  BHCollectionViewCell.h
//  SuanFaTest
//
//  Created by jiejin on 16/3/29.
//  Copyright © 2016年 jiejin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RewardModel;

@protocol BHCollectionViewCellDelegate <NSObject>

- (void)enterUserCenterWithUserId:(NSString *)userId;

@end


@interface BHCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *contentLab;
@property (nonatomic, weak) id<BHCollectionViewCellDelegate>delegate;

- (CGFloat)getCollectionViewCellHeightWithModel:(RewardModel *)model;

- (void)updateUIWithModel:(RewardModel *)model;

- (void)showBottomLine;

- (void)hiddenBottomLine;

@end
