//
//  ViewController.h
//  HelloWorld_iPodLibrary
//
//  Created by vcj013 on 2014/05/27.
//  Copyright (c) 2014年 geechs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
@interface ViewController : UITableViewController
{
    NSMutableArray* sectionPlayList;
    NSMutableArray* sectionSongs;
    
    NSMutableDictionary* playListSongs;
    
    MPMusicPlayerController *player;
}
@end
