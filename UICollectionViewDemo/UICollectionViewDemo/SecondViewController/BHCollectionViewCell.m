//
//  BHCollectionViewCell.m
//  SuanFaTest
//
//  Created by jiejin on 16/3/29.
//  Copyright © 2016年 jiejin. All rights reserved.
//

#import "BHCollectionViewCell.h"
#import "Masonry.h"

@interface BHCollectionViewCell()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIImageView *userHeadImageView;
@property (nonatomic, strong) UILabel *userNameLab;
@property (nonatomic, strong) UILabel *timeLab;

@property (nonatomic, strong) UIView *bottomLineView;

@end

#define maxSpace 15
#define midSpace 10
#define minSpace 5
#define userHeadWidth 25
#define bottomLineHeight 0.5


@implementation BHCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addUIS];
    }
    return self;
}

- (void)addUIS{
    
    self.backgroundColor = [UIColor whiteColor];

    self.bgView = [[UIView alloc] init];
    self.bgView.backgroundColor = [UIColor yellowColor];
    
    [self addSubview:self.bgView];
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(maxSpace);
        make.right.equalTo(self.mas_right).offset(-maxSpace);
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
    self.userHeadImageView = [[UIImageView alloc] init];
    self.userHeadImageView.backgroundColor = [UIColor redColor];
    
    [self.bgView addSubview:self.userHeadImageView];
    
    [self.userHeadImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView.mas_top).offset(midSpace);
        make.left.equalTo(self.bgView.mas_left).offset(midSpace);
        make.width.equalTo(@(userHeadWidth));
        make.height.equalTo(@(userHeadWidth));
        
    }];
    
    self.userNameLab = [[UILabel alloc] init];
    self.userNameLab.font = [UIFont systemFontOfSize:14];
    self.userNameLab.text = @"ajie";
    
    [self.bgView addSubview:self.userNameLab];
    
    [self.userNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userHeadImageView.mas_right).offset(maxSpace);
        make.centerY.equalTo(self.userHeadImageView);
    }];
    
    self.timeLab = [[UILabel alloc] init];
    self.timeLab.textColor = [UIColor lightGrayColor];
    self.timeLab.font = [UIFont systemFontOfSize:12];
    self.timeLab.text = @"2015";
    
    [self.bgView addSubview:self.timeLab];
    
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.bgView.mas_right).offset(-minSpace);
        make.centerY.equalTo(self.userNameLab);
    }];
    
    self.contentLab = [[UILabel alloc] init];
    self.contentLab.font = [UIFont systemFontOfSize:14];
    self.contentLab.numberOfLines = 0;
    self.contentLab.textAlignment = NSTextAlignmentLeft;
    self.contentLab.lineBreakMode = NSLineBreakByCharWrapping;
    
    [self.bgView addSubview:self.contentLab];
    
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userNameLab.mas_left);
        make.top.equalTo(self.userHeadImageView.mas_bottom).offset(midSpace);
        make.right.equalTo(self.bgView.mas_right).offset(-midSpace);
        make.bottom.equalTo(self.bgView.mas_bottom).offset(-midSpace);
    }];
    
    self.bottomLineView = [[UIView alloc] init];
    self.bottomLineView.backgroundColor = [UIColor blackColor];
    
    [self.bgView addSubview:self.bottomLineView];
    
    [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentLab.mas_left);
        make.bottom.equalTo(self.bgView.mas_bottom);
        make.height.equalTo(@(bottomLineHeight));
        make.right.equalTo(self.bgView.mas_right);
    }];
    
    // 添加点击手势
    UITapGestureRecognizer *headTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(enterUserCenter)];
    self.userHeadImageView.userInteractionEnabled = YES;
    [self.userHeadImageView addGestureRecognizer:headTap];
    
    UITapGestureRecognizer *nameTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(enterUserCenter)];
    self.userNameLab.userInteractionEnabled = YES;
    [self.userNameLab addGestureRecognizer:nameTap];
    
}

- (CGFloat)getCollectionViewCellHeightWithModel:(RewardModel *)model{
    
    CGFloat headViewHeight = 0;
    
    headViewHeight += midSpace;
    
    headViewHeight += userHeadWidth;
    
    headViewHeight += midSpace;
    
    headViewHeight += 0; // 添加contentLab的高度
    
    headViewHeight += midSpace;
    
    return headViewHeight;
}

- (void)updateUIWithModel:(RewardModel *)model{
    
    //    self.headImageView
}

- (void)showBottomLine{
    
    self.bottomLineView.hidden = NO;
}

- (void)hiddenBottomLine{
    
    self.bottomLineView.hidden = YES;
}

#pragma mark - TapAction
- (void)enterUserCenter{

    if([self.delegate respondsToSelector:@selector(enterUserCenterWithUserId:)]){
    
        
    }
}

@end
