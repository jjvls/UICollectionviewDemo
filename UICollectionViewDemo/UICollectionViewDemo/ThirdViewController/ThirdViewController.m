//
//  ThirdViewController.m
//  UICollectionViewDemo
//
//  Created by jiejin on 16/3/30.
//  Copyright © 2016年 jiejin. All rights reserved.
//

#import "ThirdViewController.h"
#import "LNGood.h"
#import "LNWaterfallFlowCell.h"
#import "LNWaterfallFlowLayout.h"

@interface ThirdViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

// 商品列表数组
@property (nonatomic, strong) NSMutableArray *goodsList;
// 当前的数据索引
@property (nonatomic, assign) NSInteger index;
// 瀑布流布局
@property (nonatomic, strong) LNWaterfallFlowLayout *waterfallFlowLayout;

@property (nonatomic, strong)UICollectionView *collectionView;

// 是否正在加载数据标记
@property (nonatomic, assign, getter=isLoading) BOOL loading;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.waterfallFlowLayout = [[LNWaterfallFlowLayout alloc] init];
    self.waterfallFlowLayout.minimumLineSpacing = 10;
    self.waterfallFlowLayout.minimumInteritemSpacing = 10;
    self.waterfallFlowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.waterfallFlowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
//    [self.collectionView registerClass:[LNWaterfallFlowCell class] forCellWithReuseIdentifier:@"CellCache"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"LNWaterfallFlowCell" bundle:nil] forCellWithReuseIdentifier:@"CellCache"];
    
    [self.view addSubview:self.collectionView];
    
    [self loadData];
}


/**
 *  加载数据
 */
- (void)loadData {
    
    NSArray *goods = [LNGood goodsWithIndex:self.index];
    [self.goodsList addObjectsFromArray:goods];
    
    self.index++;
    // 设置布局的属性
    self.waterfallFlowLayout.columnCount = 3;
    self.waterfallFlowLayout.goodsList = self.goodsList;
    // 刷新数据
    [self.collectionView reloadData];
}


#pragma mark - 数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.goodsList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // 创建可重用的cell
    LNWaterfallFlowCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellCache"
                                 forIndexPath:indexPath];
    
    cell.good = self.goodsList[indexPath.item];
    
    return cell;
}


#pragma mark - scrollView代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if(self.loading){
    
        return;
    }
    
    CGFloat contentOffsetY = scrollView.contentOffset.y;
    
    CGFloat subNum = contentOffsetY - (scrollView.contentSize.height - scrollView.bounds.size.height);
    if(subNum > - 5 && subNum < 5){
        
        NSLog(@"开始刷新");
        // 如果正在刷新数据，不需要再次刷新
       self.loading = YES;

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

            [self loadData];
            
            self.loading = NO;
        });
    }

}

#pragma mark - 懒加载
- (NSMutableArray *)goodsList {
    if (_goodsList == nil) {
        _goodsList = [NSMutableArray array];
    }
    return _goodsList;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
