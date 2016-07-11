//
//  AuthorsViewController.m
//  L_Video
//
//  Created by lanou3g on 16/7/7.
//  Copyright © 2016年 LLL. All rights reserved.
//

#import "AuthorsViewController.h"
#import "AuthorTableViewCell.h"
#import "AuthorRequest.h"
#import "AuthorModel.h"
#import "VideosViewController.h"


@interface AuthorsViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource,
    UIScrollViewDelegate
>
@property (weak, nonatomic) IBOutlet UITableView *dataTableView;
@property (weak, nonatomic) IBOutlet UITableView *lolTableView;

@property (nonatomic, strong) NSMutableArray *dotaAllAuthors;

@property (nonatomic, strong) NSMutableArray *lolAllAuthors;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation AuthorsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dotaAllAuthors = [NSMutableArray array];
    self.lolAllAuthors = [NSMutableArray array];
    
    
    
    // Do any additional setup after loading the view.
    
    // 注册两个TableViewCell
    [self.dataTableView registerNib:[UINib nibWithNibName:@"AuthorTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:AuthorTableViewCell_Identify];
    [self.lolTableView registerNib:[UINib nibWithNibName:@"AuthorTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:AuthorTableViewCell_Identify];
    
    // 调用请求
    [self requestDotaAuthors];
    [self requestLOLAuthors];
    
    self.scrollView.delegate = self;
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.rootVC.VideoTabBar.hidden = NO;
    
}


- (IBAction)setSegmentPress:(id)sender {
    
    switch ([sender selectedSegmentIndex]) {
        case 0:
            self.scrollView.contentOffset = CGPointMake(0, 0);
            break;
        case 1:
            self.scrollView.contentOffset = CGPointMake(kScreenWidth, 0);
            break;
    }
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    CGFloat temp = scrollView.contentOffset.x / kScreenWidth;
    
    
    if ([scrollView isMemberOfClass:[UIScrollView class]]) {
        self.segmentedControl.selectedSegmentIndex = temp;
    }
    
    
}
- (void)requestDotaAuthors {
    
    
    __weak typeof(self) weakSelf = self;
    [[AuthorRequest shareAuthorRequest] requestDotaAllAuthorSuccess:^(NSDictionary *dic) {
        NSLog(@"Dotadic ==%@",dic);
        
        weakSelf.dotaAllAuthors = [AuthorModel parseAuthorsWithDic:dic];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.dataTableView reloadData];
        });
        
    } failure:^(NSError *error) {
        NSLog(@"error%@",error);
    }];
    
}

- (void)requestLOLAuthors {
    
    __weak typeof(self) weakSelf = self;
    [[AuthorRequest shareAuthorRequest] requestLOLAllAuthorSuccess:^(NSDictionary *dic) {
        NSLog(@"LOLdic == %@",dic);
        
        weakSelf.lolAllAuthors = [AuthorModel parseAuthorsWithDic:dic];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.lolTableView reloadData];
        });
        
    } failure:^(NSError *error) {
        NSLog(@"error == %@",error);
    }];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (tableView == self.dataTableView) {
        return self.dotaAllAuthors.count;
    }else {
        return self.lolAllAuthors.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AuthorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:AuthorTableViewCell_Identify];
    
    AuthorModel *model = nil;
    
    if (tableView == self.dataTableView) {
        model = self.dotaAllAuthors[indexPath.row];
        cell.authorModel = model;
    }else {
        model = self.lolAllAuthors[indexPath.row];
        cell.authorModel = model;
    }
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    VideosViewController *videoVC = [sb instantiateViewControllerWithIdentifier:@"VideosViewController"];
    
    if (tableView == self.dataTableView) {
        AuthorModel *model = self.dotaAllAuthors[indexPath.row];
        videoVC.authorID = model.authorId;
        videoVC.sourceFrom = 0;
    }else {
        AuthorModel *model = self.lolAllAuthors[indexPath.row];
        videoVC.authorID = model.authorId;
        videoVC.sourceFrom = 1;
    }
    
    self.rootVC.VideoTabBar.hidden = YES;
    
    [self.navigationController pushViewController:videoVC animated:YES];
    
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
