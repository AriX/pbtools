#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>

int pbcopy() {
    NSFileHandle *input = [NSFileHandle fileHandleWithStandardInput];
    NSData *inputData = [NSData dataWithData:[input readDataToEndOfFile]];
    NSString *inputString = [[NSString alloc] initWithData:inputData encoding:NSUTF8StringEncoding];
    
    if ([inputString hasPrefix:@"{\rtf"])
        [[UIPasteboard generalPasteboard] setValue:inputString forPasteboardType:(NSString *)kUTTypeRTF];
    else
        [[UIPasteboard generalPasteboard] setString:inputString];
    
    [inputString release];
    return !inputString;
}

int main(int argc, char **argv, char **envp) {
    @autoreleasepool {
        if (argc > 1) {
            printf("Usage: %s [-help]\n%s takes the standard input and places it in the clipboard.\n", argv[0], argv[0]);
            return 0;
        } else {
            return pbcopy();
        }
    }
}
