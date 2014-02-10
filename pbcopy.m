#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>

int pbcopy(NSString *pasteboardType) {
    NSFileHandle *input = [NSFileHandle fileHandleWithStandardInput];
    NSData *inputData = [NSData dataWithData:[input readDataToEndOfFile]];
    
    if (!pasteboardType)
        pasteboardType = (NSString *)kUTTypeText;
    
    [[UIPasteboard generalPasteboard] setData:inputData forPasteboardType:pasteboardType];
    return !inputData;
}

int main(int argc, char **argv, char **envp) {
    @autoreleasepool {
        if (argc > 1) {
            if (strcmp(argv[1], "-help") == 0 || strcmp(argv[1], "--help") == 0 || strcmp(argv[1], "-h") == 0) {
                printf("Usage: %s [-help | public.pasteboard-type ]\n%s takes the standard input and places it in the clipboard. Optionally, the pasteboard type of the input may be specified.\n", argv[0], argv[0]);
                return 0;
            } else {
                return pbcopy([NSString stringWithUTF8String:argv[1]]);
            }
        } else {
            return pbcopy(nil);
        }
    }
}
