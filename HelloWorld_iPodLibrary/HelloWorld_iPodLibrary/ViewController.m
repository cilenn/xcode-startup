//
//  ViewController.m
//  HelloWorld_iPodLibrary
//
//  Created by vcj013 on 2014/05/27.
//  Copyright (c) 2014年 geechs. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController


- (void)loadView {
    
    [super loadView];
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tableView.rowHeight = 40;//セルのサイズ
    
    UIView *controlView = UIView.new;
    float control_view_width  = self.view.frame.size.width;
    float control_view_height = 50.0f;
    
    CGRect status_bar_frame;
    status_bar_frame = [[UIApplication sharedApplication] statusBarFrame];
    
    
    controlView.frame =
    CGRectMake(self.view.frame.origin.x, self.view.frame.size.height-(control_view_height-status_bar_frame.size.height),
               control_view_width, control_view_height);
    
    controlView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:controlView];
}

-(id)init {
    
    //画面の設定
    if ((self = [super initWithStyle:UITableViewStylePlain])) {
        
        //タイトルバーの設定
        UIBarButtonItem* rightItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(playStop)];
        self.navigationItem.rightBarButtonItem = rightItem;
        
    }
    
    //各セクション名と曲名用の配列の初期化
    sectionPlayList = [[NSMutableArray alloc] init];
    playListSongs = [[NSMutableDictionary alloc]init];
    
    //iPodの音楽ライブラリから取得
    MPMediaQuery *myPlaylistsQuery = [MPMediaQuery playlistsQuery];
    NSArray *playlists = [myPlaylistsQuery collections];
    
    for (MPMediaPlaylist *playlist in playlists) {
        
        //section名を配列にセット
        [sectionPlayList addObject:[playlist valueForProperty: MPMediaPlaylistPropertyName]];
        
        //各sectionにぶらさがる曲名用の配列を初期化
        sectionSongs  = [[NSMutableArray alloc] init];
        
        for (MPMediaItem *song in [playlist items]) {
            
            //曲情報を配列にセット(曲ID、曲名、アーティスト名、アルバム名)
            NSArray* cellDataArray = [[NSArray alloc]init];
            cellDataArray = [NSArray arrayWithObjects:[song valueForProperty: MPMediaItemPropertyPersistentID], [song valueForProperty: MPMediaItemPropertyTitle], [song valueForProperty: MPMediaItemPropertyArtist], [song valueForProperty: MPMediaItemPropertyAlbumTitle],nil];
            
            [sectionSongs addObject:cellDataArray];
            
        }
        
        //1section分のデータができたので、全体テーブル用の配列にセット
        [playListSongs setObject:sectionSongs forKey:[playlist valueForProperty: MPMediaPlaylistPropertyName]];
        
    }
    
    return self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
    return [sectionPlayList count];
}

- (NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section {
    return [sectionPlayList objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    id key = [sectionPlayList objectAtIndex:section];
    return [[playListSongs objectForKey:key]count];
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
    
    static NSString* identifier = @"basis-cell";//セルのスタイル設定
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    cell.textLabel.textColor = [UIColor blackColor];//セルのテキストカラー変更
    cell.detailTextLabel.textColor = [UIColor grayColor];//セルの詳細テキストのカラー変更
    
    cell.textLabel.font = [UIFont boldSystemFontOfSize:16];//セルのフォント変更
    cell.detailTextLabel.font = [UIFont systemFontOfSize:12];//セルの詳細テキストのフォント変更
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;//セルのアクセサリ設定
    
    //セルにデータの割り当て
    cell.textLabel.text =  [[[playListSongs objectForKey:[sectionPlayList objectAtIndex:indexPath.section]]objectAtIndex:indexPath.row]objectAtIndex:1];
    cell.detailTextLabel.text =  [[[playListSongs objectForKey:[sectionPlayList objectAtIndex:indexPath.section]]objectAtIndex:indexPath.row]objectAtIndex:3];
    
    return cell;
    
}

-(void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath{
    
    //選択された曲を検索条件に指定
    NSNumber *persistentId = [[[playListSongs objectForKey:[sectionPlayList objectAtIndex:indexPath.section]]objectAtIndex:indexPath.row]objectAtIndex:0];
    MPMediaQuery *songQuery = [MPMediaQuery songsQuery];
    MPMediaPropertyPredicate *predicate = [MPMediaPropertyPredicate predicateWithValue:persistentId forProperty:MPMediaItemPropertyPersistentID];
    [songQuery addFilterPredicate:predicate];
    
    //選択された曲を再生
    player = [MPMusicPlayerController applicationMusicPlayer];
    [player setQueueWithQuery:songQuery];
    [player play];
    
}

-(void)playStop {
    [player stop];
}

@end
