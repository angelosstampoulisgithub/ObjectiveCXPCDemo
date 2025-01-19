//
//  XPCClient.m
//  ObjectiveCXPCDemo
//
//  Created by Angelos Staboulis on 19/1/25.
//

#import "XPCClient.h"
#import "XPCClient.h"
@implementation XPCClient

- (void)establishConnection {
    
    _connection = [[NSXPCConnection alloc]initWithServiceName:@"com.template.XPCService"];
    _connection.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(XPCServiceProtocol)];
    _connection.interruptionHandler = ^{
           NSLog(@"Connection interrupted");
    };
    _connection.invalidationHandler = ^{
           NSLog(@"Connection invalidated");
    };
    [_connection resume];
    _xpcClient = [_connection remoteObjectProxyWithErrorHandler:^(NSError * _Nonnull error) {
           NSLog(@"%@",error);
    }];
    
    NSLog(@"successfully connected to XPC service");
}

- (id<XPCServiceProtocol>)xpcService {
    if (self.connection == nil) {
        NSLog(@"no connection to XPC service");
        [self establishConnection];
        
    }
    
    return [self.connection remoteObjectProxyWithErrorHandler:^(NSError *err) {
        NSLog(@"%@", err);
    }];
}

- (void)invalidateConnection {
    if (self.connection == nil) {
        NSLog(@"no connection to invalidate");
        return;
    }
    
    [self.connection invalidate];
}






@end
