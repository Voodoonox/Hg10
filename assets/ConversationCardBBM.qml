import bb.cascades 1.3
import com.netimage 1.0
import Network.ConversationController 1.0

NavigationPane {
    id: nav
    property int depth
    
    Page {
        id: conversationCard
        objectName: "conversationCard"
                
        property string name
        property string avatar
        property string id
        property bool   room
        property variant previewPage
        property variant smileyPage
        property variant historyPage
        property string smileyToAdd
        property string filenameChat
        
        property int nbIcons
        
        titleBar: TitleBar {
            kind: TitleBarKind.FreeForm
            kindProperties: FreeFormTitleBarKindProperties {
                Container {
                    layout: DockLayout { }
                    leftPadding: 10
                    rightPadding: 10
                    background: Application.themeSupport.theme.colorTheme.style == VisualStyle.Dark ? Color.create("#282828") : Color.create("#f0f0f0");
                    
                    ImageView {
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Right
                        id: avatarOwnImg
                        scalingMethod: ScalingMethod.AspectFit
                        minHeight: ui.du(9)
                        maxHeight: ui.du(9)
                        minWidth: ui.du(9)
                        maxWidth: ui.du(9)
                        image: trackerOwn.image
                        
                        attachedObjects: [
                            NetImageTracker {
                                id: trackerOwn
                                
                                source: conversationCard.avatar                                    
                            } 
                        ]
                    }
                    
                    Label {
                        text: conversationCard.name
                        textStyle {
                            color: Application.themeSupport.theme.colorTheme.style == VisualStyle.Dark ? Color.White : Color.Black
                        }
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Center
                    }
                    
                    ImageButton {
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Left
                        defaultImageSource: Application.themeSupport.theme.colorTheme.style == VisualStyle.Dark ? "asset:///images/icon_left.png" : "asset:///images/icon_left_black.png"
                        onClicked: {
                            conversationController.closeCard();
                        }
                    }
                }
            }
        }
        
        
        Container {
            layout: DockLayout {
            
            }
            
            
            
            Container {
                id: wallpaperContainer
                layout: StackLayout {
                    orientation: LayoutOrientation.TopToBottom
                }        
                
                background: Application.themeSupport.theme.colorTheme.style == VisualStyle.Dark ? Color.create("#000000") : Color.create("#c7dfe4")
                
                ActivityIndicator {
                    id: linkStatusActivity
                    preferredHeight: 50
                    horizontalAlignment: HorizontalAlignment.Center
                }
                
                ScrollView {
                    verticalAlignment: VerticalAlignment.Fill
                    horizontalAlignment: HorizontalAlignment.Fill
                    id: scrollView
                    
                    property bool pullTriggered
                    onViewableAreaChanging: {
                        if(viewableArea.y < -100) {
                            if(!pullTriggered) {
                                conversationController.loadMore();
                                pullTriggered = true;
                            }
                        } else {
                            pullTriggered = false;
                        }
                    }
                    
                    focusRetentionPolicyFlags: FocusRetentionPolicy.LoseToFocusable
                    
                    WebView {
                        id: messageView
                        
                        
                        settings.textAutosizingEnabled: false
                        settings.zoomToFitEnabled: false
                        
                        html: Application.themeSupport.theme.colorTheme.style == VisualStyle.Dark ? "<!DOCTYPE html><html><head><style>body { background-color: #000000; } </style></head><body></body></html>" : "" ;
                        
                        onLoadingChanged: {
                            if (loadRequest.status == WebLoadStatus.Succeeded) {
                                messageView.evaluateJavaScript("scrollToEnd();");
                                txtField.requestFocus();
                            }
                        }
                        
                        onMessageReceived: {
                            var isScroll = RegExp("SCROLLTO:([0-9]+)")
                            var match = message.data.match(isScroll);
                            if(match)
                                scrollView.scrollToPoint(0, match[1], ScrollAnimation.None);
                            
                            var isOpenImg = RegExp("OPEN_IMAGE:([^\']+)")
                            match = message.data.match(isOpenImg);
                            if(match)
                                conversationCard.showPictureViewer(match[1]);
                            
                            var isOpenSound = RegExp("PLAY_SOUND:([^\']+)")
                            match = message.data.match(isOpenSound);
                            if(match) {
                                conversationController.playAudio("file:///" + match[1]);
                            }
                            
                            console.log(message.data)
                        }
                        
                        onNavigationRequested: {
                            if(request.navigationType != WebNavigationType.Other) {
                                request.action = WebNavigationRequestAction.Ignore;
                                
                                console.log("on nav requested")
                                var urlImg = RegExp(".jpg");
                                var urlImgPng = RegExp(".png");
                                var urlImgGif = RegExp(".gif");
                                if(urlImg.test(request.url.toString()) || urlImgPng.test(request.url.toString()) || urlImgGif.test(request.url.toString()))
                                    conversationCard.showPictureViewer(request.url);
                                else
                                    conversationController.invokeBrowser(request.url.toString());
                            
                            } else { 
                                request.action = WebNavigationRequestAction.Accept;
                            }
                        }
                        
                        onTouch: {
                            if(emoticonsPicker.preferredHeight > 0)
                                conversationCard.toogleEmoji();
                        }
                    }
                }
                
                Container {
                    id: inputContainer
                    verticalAlignment: VerticalAlignment.Bottom
                    horizontalAlignment: HorizontalAlignment.Fill
                    
                    
                    layout: StackLayout {
                        orientation: LayoutOrientation.TopToBottom
                    }
                    
                    ProgressIndicator {
                        horizontalAlignment: HorizontalAlignment.Fill
                        id: uploadingIndicator
                        fromValue: 0
                        toValue: 100
                        visible: false
                    }
                    
                    Container {
                        layout: StackLayout {
                            orientation: LayoutOrientation.LeftToRight
                        }
                        background: Application.themeSupport.theme.colorTheme.style == VisualStyle.Dark ? Color.create("#202020") : Color.create("#f5f5f5")
                        
                        ImageButton {
                            preferredHeight: ui.du(10)
                            preferredWidth: ui.du(10)
                            defaultImageSource: Application.themeSupport.theme.colorTheme.style == VisualStyle.Dark ? "asset:///images/icon_clip_white.png" : "asset:///images/icon_clip.png"
                            
                            onClicked: {
                                actionSelector.selectedOption = option1;
                                conversationCard.toogleEmoji();
                            }
                        }
                        
                        TextArea {
                            preferredHeight: ui.du(10)
                            horizontalAlignment: HorizontalAlignment.Fill
                            id: txtField
                            
                            input {
                                submitKey: SubmitKey.Send
                                onSubmitted: {
                                    conversationController.send(txtField.text);
                                    txtField.text = "";  
                                }
                            }
                        }
                        
                        ImageButton {
                            preferredHeight: ui.du(10)
                            preferredWidth: ui.du(10)
                            defaultImageSource: Application.themeSupport.theme.colorTheme.style == VisualStyle.Dark ? "asset:///images/icon_smile_white.png" : "asset:///images/icon_smile.png"
                            onClicked: {
                                actionSelector.selectedOption = option2;
                                conversationCard.toogleEmoji();
                            }
                        }                    
                    }
                }
                
                Container {
                    id: emoticonsPicker
                    background: Application.themeSupport.theme.colorTheme.style == VisualStyle.Dark ? Color.Black : Color.White
                    
                    preferredHeight: 0
                    layout: StackLayout {
                        orientation: LayoutOrientation.TopToBottom
                    }
                    
                    Container {
                        visible: false
                        id: segmentedControlContainer
                        
                        SegmentedControl {
                            horizontalAlignment: HorizontalAlignment.Fill
                            id: actionSelector
                            
                            Option {
                                id: option1
                                text: qsTr("Actions")
                                value: 0
                            }
                            Option {
                                id: option2
                                text: qsTr("Smileys")
                                value: 1
                            }
                            
                            onSelectedOptionChanged: {
                                conversationController.loadActionMenu(selectedOption.value);
                            }
                        
                        }
                    }
                    
                    function numberOfButton() {
                        if(actionSelector.selectedOption.value == 0) {
                            return DisplayInfo.width > 1000 ? 6 : 4;
                        } else return  9;
                    
                    }
                    
                    
                    ListView {
                        id: actionComposerListView
                        
                        
                        layout: GridListLayout {
                            columnCount: emoticonsPicker.numberOfButton();
                            headerMode: ListHeaderMode.Sticky
                        }
                        
                        dataModel: GroupDataModel {
                            id: theModel
                            grouping: ItemGrouping.ByFullValue
                            sortingKeys: ["category"]
                            sortedAscending: false
                        
                        }
                        
                        
                        
                        listItemComponents: [
                            ListItemComponent {
                                type: "item"
                                
                                Container {
                                    horizontalAlignment: HorizontalAlignment.Center
                                    verticalAlignment: VerticalAlignment.Center
                                    layout: StackLayout {
                                        orientation: LayoutOrientation.TopToBottom
                                    }
                                    
                                    Container {
                                        preferredHeight: ui.du(2)
                                    }
                                    
                                    ImageView {
                                        visible: ListItemData.image != ""
                                        verticalAlignment: VerticalAlignment.Center
                                        horizontalAlignment: HorizontalAlignment.Center
                                        id: avatarImg
                                        scalingMethod: ScalingMethod.AspectFit
                                        image: tracker.image
                                        minHeight: ui.du(6)
                                        maxHeight: ui.du(6)
                                        minWidth: ui.du(6)
                                        maxWidth: ui.du(6)
                                        
                                        attachedObjects: [
                                            NetImageTracker {
                                                id: tracker
                                                source: ListItemData.image                                    
                                            } 
                                        ]
                                    }
                                    
                                    Label {
                                        text: ListItemData.caption
                                        horizontalAlignment: HorizontalAlignment.Center
                                        verticalAlignment: VerticalAlignment.Center
                                        content.flags: TextContentFlag.Emoticons
                                        textStyle.fontSize: ListItemData.image != "" ? FontSize.XSmall : FontSize.XLarge
                                    }
                                
                                }
                            }
                        ]
                        
                        onTriggered: {
                            
                            var chosenItem = dataModel.data(indexPath);
                            if(chosenItem.image == "") {
                                txtField.text = txtField.text  + chosenItem.caption;
                            } else {
                                switch (chosenItem.action) {
                                    case 1:
                                        messageView.evaluateJavaScript("scrollToEnd();");
                                        break;
                                    
                                    case 2:
                                        conversationController.refreshHistory(conversationCard.id, conversationCard.avatar, conversationCard.name);
                                        break;
                                    
                                    case 3:
                                        conversationController.pickFile();
                                        break;
                                    
                                    case 4:
                                        conversationController.send(txtField.text);
                                        txtField.text = "";
                                        break;
                                    
                                    case 5:
                                        actionSelector.selectedOption = option2;
                                        return;
                                    
                                    case 6:
                                        if(!conversationCard.smileyPage)
                                            conversationCard.smileyPage = smileyPicker.createObject();
                                        nav.push(conversationCard.smileyPage);
                                        break;
                                    
                                    case 7:
                                        conversationController.setWallpaper();
                                        break;
                                    
                                    case 8:
                                        voiceRecording.visible = true;
                                        conversationController.startRecordAudio();
                                        break;
                                    
                                    case 9:
                                        if(!conversationCard.historyPage)
                                            conversationCard.historyPage = historyBrowser.createObject();
                                        conversationCard.historyPage.name = conversationCard.name;
                                        conversationCard.historyPage.id = conversationCard.id;
                                        nav.push(conversationCard.historyPage);
                                        break;
                                }
                            
                            }
                            conversationCard.toogleEmoji();
                            txtField.requestFocus();
                        
                        }
                    }    
                }
            }
            
            
            Container {
                id: voiceRecording
                visible: false
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
                ImageButton {
                    preferredHeight: 200
                    preferredWidth: 200
                    defaultImageSource: Application.themeSupport.theme.colorTheme.style == VisualStyle.Dark ? "asset:///images/walkie_white.png" : "asset:///images/walkie.png"
                    verticalAlignment: VerticalAlignment.Center
                    
                    onClicked: {
                        conversationController.stopRecordAudio();
                        voiceRecording.visible = false;
                    }
                }
            }
        }
        
        function toogleEmoji() {
            if(emoticonsPicker.preferredHeight == 0) {
                segmentedControlContainer.visible = true;
                actionSelector.visible = true;
                emoticonsPicker.preferredHeight = DisplayInfo.width > 1000 ? 700 : 500;
                txtField.preferredHeight=50;
                conversationCard.actionBarVisibility = ChromeVisibility.Hidden;
            
            } else {
                emoticonsPicker.preferredHeight=0;
                txtField.preferredHeight=ui.du(10);
                actionSelector.visible = false;
                segmentedControlContainer.visible = false;
                conversationCard.actionBarVisibility = ChromeVisibility.Visible;
            }
        }
        
        
        actions: [
            ActionItem {
                title: qsTr("Refresh")
                imageSource: "asset:///images/icon_refresh.png"
                ActionBar.placement: ActionBarPlacement.InOverflow
                onTriggered: {
                    conversationController.refreshHistory(conversationCard.id, conversationCard.avatar, conversationCard.name);
                }
                shortcuts: [
                    Shortcut {
                        key: "r"
                    }
                ]
            }, 
            ActionItem {
                title: qsTr("Attach")
                imageSource: "asset:///images/icon_attach.png"
                ActionBar.placement: ActionBarPlacement.InOverflow
                onTriggered: {
                    conversationController.pickFile();
                }
                shortcuts: [
                    Shortcut {
                        key: "a"
                    }
                ]
            },
            ActionItem {
                title: qsTr("Reply")
                imageSource: "asset:///images/send.png"
                ActionBar.placement: ActionBarPlacement.OnBar
                onTriggered: {
                    conversationController.send(txtField.text);
                    txtField.text = "";            
                }
            },
            ActionItem {
                id: otrLockButton
                title: qsTr("Encryption")
                imageSource: "asset:///images/icon_lock_open.png"
                ActionBar.placement: ActionBarPlacement.OnBar
                onTriggered: {
                    conversationController.startOTR(id);
                }
            }, /*
            ActionItem {
                id: otrSMPButton
                title: qsTr("Authentification")
                imageSource: "asset:///images/icon_identification.png"
                ActionBar.placement: ActionBarPlacement.InOverflow
                onTriggered: {
                    conversationController.startSMP(id);
                }
            }, */
            ActionItem {
                title: qsTr("Stickers")
                ActionBar.placement: ActionBarPlacement.InOverflow
                imageSource: "asset:///images/document.png"
                onTriggered: {
                    if(!conversationCard.smileyPage)
                        conversationCard.smileyPage = smileyPicker.createObject();
                    nav.push(conversationCard.smileyPage);
                }
                shortcuts: [
                    Shortcut {
                        key: "s"
                    }
                ]
            },
            ActionItem {
                title: qsTr("History")
                ActionBar.placement: ActionBarPlacement.InOverflow
                imageSource: "asset:///images/clock_white.png"
                onTriggered: {
                    if(!conversationCard.historyPage)
                        conversationCard.historyPage = historyBrowser.createObject();
                    conversationCard.historyPage.name = conversationCard.name;
                    conversationCard.historyPage.id = conversationCard.id;
                    nav.push(conversationCard.historyPage);
                }
                shortcuts: [
                    Shortcut {
                        key: "h"
                    }
                ]
            },
            ActionItem {
                title: qsTr("To last message")
                imageSource: "asset:///images/icon_bottom.png"
                ActionBar.placement: ActionBarPlacement.InOverflow
                onTriggered: {
                    messageView.evaluateJavaScript("scrollToEnd();")
                }
                shortcuts: [
                    Shortcut {
                        key: "b"
                    }
                ]
            }
        ]
        
        onCreationCompleted: {
            conversationController.setWebView(messageView);
            conversationController.setLinkActivity(linkStatusActivity);
            conversationController.setActionListView(actionComposerListView);
            
            conversationController.loadActionMenu(0);
            
            actionSelector.visible = false;
            conversationCard.nbIcons = DisplayInfo.width > 1000 ? 6 : 4;
        
        }
        
        onIdChanged: {
            if(id != "") {
                actionSelector.visible = false;
                conversationController.load(id, avatar, name);
            }
        }
        
        onSmileyToAddChanged: {
            if(smileyToAdd != "")
                txtField.text = txtField.text + " " + smileyToAdd;
            smileyToAdd = "";
        }
        
        onRoomChanged: {
            conversationController.isRoom = room;
        }
        
        function showPictureViewer(imageUrl) {
            if(!previewPage)
                previewPage = imagePreview.createObject();
            previewPage.imageList = imageUrl;
            nav.push(previewPage);
        }
        
        attachedObjects: [
            ConversationController {
                id: conversationController
                
                onReceivedUrl: {
                    uploadingIndicator.visible = false;
                    txtField.text = txtField.text + " " + url;
                }
                
                onUploading: {
                    uploadingIndicator.visible = true;
                    uploadingIndicator.value = status;
                }
                
                onComplete: {
                    txtField.requestFocus();
                
                }
                
                onWallpaperChanged: {
                    messageView.settings.background = Color.Transparent;
                    back.imageSource = url;
                }
                
                onColorSet: {
                    wallpaperContainer.background = Color.create(value);
                }
                
                onUpdateGoneSecure: {
                    if(id == contact) {
                        otrLockButton.imageSource = "asset:///images/icon_lock_closed.png";
                    }
                }
                
                onUpdateGoneUnsecure: {
                    if(id == contact) {
                        otrLockButton.imageSource = "asset:///images/icon_lock_open.png";
                    }
                }
            },
            ImagePaintDefinition {
                id: back
                repeatPattern: RepeatPattern.Fill
                
                onImagePaintChanged: {
                    if(imageSource != "")
                        wallpaperContainer.background = back.imagePaint
                    else 
                        wallpaperContainer.background = Application.themeSupport.theme.colorTheme.style == VisualStyle.Dark ? Color.create("#000000") : Color.create("#c7dfe4");
                }
            },
            ComponentDefinition {
                id: imagePreview
                source: "ImagePreview.qml"
            },
            ComponentDefinition {
                id: smileyPicker
                source: "SmileyPicker.qml"
            },
            ComponentDefinition {
                id: historyBrowser
                source: "HistoryBrowser.qml"
            }
        ]
        
    }
}
