//
//  NetState.h
//  NetState
//
//  Created by Farcaller on 29.09.09.
//  Copyright 2009 Hack&Dev Team. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NetState : NSObject {
	unsigned int networkCounter;
}

+ (NetState *)sharedInstance;

- (void)startedNetworkAccess;
- (void)finishedNetworkAccess;

@end
