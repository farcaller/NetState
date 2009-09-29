//
//  NetState.m
//  NetState
//
//  Created by Farcaller on 29.09.09.
//  Copyright 2009 Hack&Dev Team. All rights reserved.
//

#import "NetState.h"


@implementation NetState

+ (NetState *)sharedInstance
{
	static NetState *State = nil;
	
	@synchronized(self) {
		if(State == nil)
			State = [[NetState alloc] init];
	}
	
	return State;
}

- (void)startedNetworkAccess
{
	@synchronized(self) {
		if(networkCounter == 0) {
			[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		}
		++networkCounter;
	}
}

- (void)finishedNetworkAccess
{
	@synchronized(self) {
		if(networkCounter == 0) {
			NSLog(@"NetState: underlocking network counter!");
			return;
		}
		--networkCounter;
		if(networkCounter == 0) {
			[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
		}
	}	
}

@end
