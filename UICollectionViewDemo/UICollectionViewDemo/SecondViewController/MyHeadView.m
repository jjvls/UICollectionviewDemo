//
//  MyHeadView.m
//  SuanFaTest
//
//  Created by jiejin on 16/3/29.
//  Copyright © 2016年 jiejin. All rights reserved.
//

#import "MyHeadView.h"
#import "Masonry.h"

@interface MyHeadView()

@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UILabel *timeLab;
@property (nonatomic, strong) UIButton *stateBtn;

@end

#define maxSpace 15
#define midSpace 10
#define minSpace 5
#define userHeadWidth 40
#define stateBtnWidth 60
#define stateBtnHeight 25

@implementation MyHeadView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addUIS];
    }
    return self;
}

- (void)addUIS{

    self.backgroundColor = [UIColor whiteColor];
    
    self.headImageView = [[UIImageView alloc] init];
    self.headImageView.backgroundColor = [UIColor redColor];
    
    self.headImageView.layer.masksToBounds = YES;
    self.headImageView.layer.cornerRadius = userHeadWidth / 2;
    
    [self addSubview:self.headImageView];
    
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(maxSpace);
        make.left.equalTo(self.mas_left).offset(maxSpace);
        make.width.equalTo(@(userHeadWidth));
        make.height.equalTo(@(userHeadWidth));
        
    }];
    
    self.nameLab = [[UILabel alloc] init];
    self.nameLab.font = [UIFont systemFontOfSize:14];
    self.nameLab.text = @"ajie";
    
    [self addSubview:self.nameLab];
    
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImageView.mas_right).offset(midSpace);
        make.top.equalTo(self.mas_top).offset(maxSpace);
    }];
    
    self.timeLab = [[UILabel alloc] init];
    self.timeLab.textColor = [UIColor lightGrayColor];
    self.timeLab.font = [UIFont systemFontOfSize:12];
    self.timeLab.text = @"2015";
    
    [self addSubview:self.timeLab];
    
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLab.mas_left);
        make.top.equalTo(self.nameLab.mas_bottom).offset(minSpace);
    }];
    
    self.stateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.stateBtn.layer.borderColor = [UIColor orangeColor].CGColor;
    self.stateBtn.layer.borderWidth = 0.5f;
    self.stateBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    
    self.stateBtn.layer.masksToBounds = YES;
    self.stateBtn.layer.cornerRadius = 5.0f;
    
    [self.stateBtn addTarget:self action:@selector(stateBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.stateBtn setTitle:@"停止悬赏" forState:UIControlStateNormal];
    [self.stateBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    
    [self addSubview:self.stateBtn];
    [self.stateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(maxSpace);
        make.right.equalTo(self.mas_right).offset(-maxSpace);
        make.width.equalTo(@(stateBtnWidth));
        make.height.equalTo(@(stateBtnHeight));
    }];
    
    self.contentLab = [[UILabel alloc] init];
    self.contentLab.font = [UIFont systemFontOfSize:14];
    self.contentLab.numberOfLines = 0;
    self.contentLab.textAlignment = NSTextAlignmentLeft;
    self.contentLab.lineBreakMode = NSLineBreakByCharWrapping;

    [self addSubview:self.contentLab];
    
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLab.mas_left);
        make.top.equalTo(self.headImageView.mas_bottom).offset(minSpace);
        make.right.equalTo(self.mas_right).offset(- maxSpace);
//        make.bottom.equalTo(self.mas_bottom).offset(-5);
    }];
    
    
    // 添加用户手势
    UITapGestureRecognizer *headTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(enterUserCenter)];
    self.headImageView.userInteractionEnabled = YES;
    [self.headImageView addGestureRecognizer:headTap];
    
    UITapGestureRecognizer *nameTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(enterUserCenter)];
    self.nameLab.userInteractionEnabled = YES;
    [self.nameLab addGestureRecognizer:nameTap];
    
}

- (CGFloat)getHeadViewHeightWithModel:(RewardModel *)model{

    CGFloat headViewHeight = 0;
    
    headViewHeight += maxSpace;
    
    headViewHeight += userHeadWidth;
    
    headViewHeight += minSpace;
    
    headViewHeight += 0; // 添加contentLab的高度
    
    headViewHeight += minSpace;
    
    return headViewHeight;
}

- (void)updateUIWithModel:(RewardModel *)model{

//    self.headImageView 
}

#pragma mark - userAction
- (void)enterUserCenter{

    if([self.delegate respondsToSelector:@selector(userActionWithUserType:andNeedValue:)]){
    
        // todo
    }
}

- (void)stateBtnAction{

    
}

@end
