//
//  VideosViewController.m
//  L_Video
//
//  Created by lanou3g on 16/7/8.
//  Copyright © 2016年 LLL. All rights reserved.
//

#import "VideosViewController.h"
#import "VideoModel.h"
#import "VideoCollectionViewCell.h"
#import "VideoRequest.h"
#import "playerView.h"
#import "VideoDetailRequest.h"
#import "VideoDetailModel.h"

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface VideosViewController ()
<
    UICollectionViewDataSource,
    UICollectionViewDelegate,
    UICollectionViewDelegateFlowLayout,
    VideoCollectionViewCellDelegate
>

@property (weak, nonatomic) IBOutlet UICollectionView *videoCollectionView;
// 显示的布局形式
@property (nonatomic, assign) NSInteger layoutType;

@property (nonatomic, strong) NSMutableArray *videos;

// 播放视频所需要的view
@property (nonatomic, strong) playerView *playView;

// 获得当前播放视频的cell
@property (nonatomic, strong) VideoCollectionViewCell *currentCell;
// 获得当前的indexpath
@property (nonatomic, strong) NSIndexPath *currentPath;

@property (nonatomic, assign) BOOL isPlaying;

@property (nonatomic, strong) NSArray *visibleIndexPaths;

@end

@implementation VideosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.videos = [NSMutableArray array];
    
    self.videoCollectionView.backgroundColor = [UIColor whiteColor];
    
    // 一行显示两个item
    self.layoutType = 0;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // cell间距为0
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.itemSize = CGSizeMake(kScreenWidth / 2.0, 200);
    self.videoCollectionView.collectionViewLayout = layout;
    
    [self.videoCollectionView registerNib:[UINib nibWithNibName:@"VideoCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:VideoCollectionViewCell_Identify];
    
    
    [self addRightItem];
    
    if (self.sourceFrom == 0) {
        // dota
        [self requestDotaVideos];
    }else if (self.sourceFrom == 1) {
        // lol
        [self requestLOLVideos];
    }
    
}

- (void)addRightItem {
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemAdd) target:self action:@selector(changeLayoutType:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}
// 请求Dota视频
- (void)requestDotaVideos {
    
    __weak typeof (self) weakSelf = self;
    [[VideoRequest shareVideoRequest] requestDotaSingleAuthorAllVideoWithAuthorID:self.authorID Success:^(NSDictionary *dic) {
        NSLog(@"dotaVideoSuccess == %@",dic);
        weakSelf.videos = [VideoModel parseVideoWithDic:dic];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.videoCollectionView reloadData];
        });
    } failure:^(NSError *error) {
        NSLog(@"dota error == %@",error);
    }];
    
}

// 请求LOL视频
- (void)requestLOLVideos {
    
    __weak typeof (self) weakSelf = self;
    [[VideoRequest shareVideoRequest] requestLOLSingleAuthorAllVideoWithAuthorID:self.authorID success:^(NSDictionary *dic) {
        NSLog(@"LOLVideoSuccess == %@",dic);
        weakSelf.videos = [VideoModel parseVideoWithDic:dic];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.videoCollectionView reloadData];
        });
    } failure:^(NSError *error) {
        NSLog(@"lol error == %@",error);
    }];
    
}

- (void)changeLayoutType:(UIBarButtonItem *)item {
    
    if (self.layoutType == 0) {
        self.layoutType = 1;
    }else if (self.layoutType == 1) {
        self.layoutType = 0;
    }else {
        
    }
    
    [self.videoCollectionView reloadData];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.layoutType == 0) {
        return CGSizeMake(kScreenWidth / 2.0, 200);
    }else if (self.layoutType == 1) {
        return CGSizeMake(kScreenWidth, 200);
    }
    return CGSizeMake(kScreenWidth / 2.0, 200);
}

// 点击cell上的播放按钮，播放cell上的视频
- (void)videoCollectionViewPlayBtnCliked:(VideoCollectionViewCell *)cell {
    
    // 点击cell获得当前的cell
    self.currentPath = [self.videoCollectionView indexPathForCell:cell];
    
    // 判断
    if (self.playView) {
        [self.playView.player pause];
        [self.playView removeFromSuperview];
        self.isPlaying = NO;
    }
    
    
    VideoModel *model = cell.videoModel;
    // 根据model的id去请求视频的url
    [[VideoDetailRequest shareVideoDetailRequest] requestSingleDotaVideoWithVideoID:model.videoId success:^(NSDictionary *dic) {
        NSLog(@"singleVideoDetailSuccess%@",dic);
        
        VideoDetailModel *videoDetailModel = [[VideoDetailModel alloc] init];
        [videoDetailModel setValuesForKeysWithDictionary:dic];
        // 播放视频
        self.playView = [[playerView alloc] initWithUrl:videoDetailModel.url frame:cell.bounds];
        [cell.contentView addSubview:self.playView];
        self.isPlaying = YES;
    } failure:^(NSError *error) {
        NSLog(@"singleVideoDetailError %@",error);
    }];
    
    
    // 请求完url之后，初始化playerView
    // playerView增加到cell上
    // 播放
}

#pragma mark -- CollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.videos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    VideoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:VideoCollectionViewCell_Identify forIndexPath:indexPath];
    cell.type = (int)self.layoutType;
    cell.delegate = self;
    cell.videoModel = self.videos[indexPath.row];
    self.visibleIndexPaths = [self.videoCollectionView indexPathsForVisibleItems];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    // 先把cell的坐标转换成屏幕坐标
    CGRect changedFrame = [self.videoCollectionView convertRect:self.currentCell.frame toView:self.view];
    
    NSLog(@"frame %@",NSStringFromCGRect(changedFrame));
    
    if (changedFrame.origin.y < -changedFrame.size.height + 64 || changedFrame.origin.y > kScreenHeight) {
        [self putToRightCorner];
    }else {
        
        [self backToCell];
        
    }
    
}


// 当cell划出去的时候，放到右下角播放
- (void)putToRightCorner {
    
    if (self.isPlaying) {
        [self.playView removeFromSuperview];
        __weak typeof(self) weakSelf = self;
        [UIView animateWithDuration:0.5 animations:^{
            CGRect rightFrame = CGRectMake(kScreenWidth / 2.0, kScreenHeight / 4.0 * 3.0, kScreenWidth / 2.0, kScreenHeight / 4.0);
            weakSelf.playView.frame = rightFrame;
            // 把layer的frame也改变
            weakSelf.playView.playerLayer.frame = self.playView.bounds;
            
            [weakSelf.view addSubview:self.playView];
            [weakSelf.view bringSubviewToFront:self.playView];
        }];
    }
    
}

- (void)backToCell {
    
    
    // 先获取屏幕上的所有cell
    __weak typeof(self) weakSelf = self;
    if ([self.visibleIndexPaths containsObject:self.currentPath]) {
        if (self.isPlaying) {
            [self.playView removeFromSuperview];
        }
        [UIView animateWithDuration:0.5 animations:^{
            weakSelf.playView.frame = weakSelf.currentCell.bounds;
            weakSelf.playView.playerLayer.frame = weakSelf.playView.bounds;
            // 然后把playerView增加到celld的contentView上
            [weakSelf.currentCell.contentView addSubview:weakSelf.playView];
            [weakSelf.currentCell.contentView bringSubviewToFront:weakSelf.playView];
            
        }];
        
    }
    
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
