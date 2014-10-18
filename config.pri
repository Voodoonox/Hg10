# Config.pri file version 2.0. Auto-generated by IDE. Any changes made by user will be lost!
BASEDIR = $$quote($$_PRO_FILE_PWD_)

device {
    CONFIG(debug, debug|release) {
        profile {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        } else {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }

    }

    CONFIG(release, debug|release) {
        !profile {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }
    }
}

simulator {
    CONFIG(debug, debug|release) {
        !profile {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }
    }
}

config_pri_assets {
    OTHER_FILES += \
        $$quote($$BASEDIR/assets/Conversation.qml) \
        $$quote($$BASEDIR/assets/Favorite.qml) \
        $$quote($$BASEDIR/assets/Home.qml) \
        $$quote($$BASEDIR/assets/ImagePreview.qml) \
        $$quote($$BASEDIR/assets/LoginForm.qml) \
        $$quote($$BASEDIR/assets/Settings.qml) \
        $$quote($$BASEDIR/assets/Welcome.qml) \
        $$quote($$BASEDIR/assets/images/available.png) \
        $$quote($$BASEDIR/assets/images/available.svg) \
        $$quote($$BASEDIR/assets/images/avatar.png) \
        $$quote($$BASEDIR/assets/images/avatar.png.square.png) \
        $$quote($$BASEDIR/assets/images/avatar.square.svg) \
        $$quote($$BASEDIR/assets/images/avatar.svg) \
        $$quote($$BASEDIR/assets/images/icon_about.png) \
        $$quote($$BASEDIR/assets/images/icon_bottom.png) \
        $$quote($$BASEDIR/assets/images/icon_favorites.png) \
        $$quote($$BASEDIR/assets/images/icon_home.png) \
        $$quote($$BASEDIR/assets/images/icon_left.png) \
        $$quote($$BASEDIR/assets/images/icon_settings.png) \
        $$quote($$BASEDIR/assets/images/send.png) \
        $$quote($$BASEDIR/assets/images/send.svg) \
        $$quote($$BASEDIR/assets/images/wallpaper/wallpaper.jpg) \
        $$quote($$BASEDIR/assets/main.qml) \
        $$quote($$BASEDIR/assets/template.html) \
        $$quote($$BASEDIR/assets/template_black.html) \
        $$quote($$BASEDIR/assets/template_end.html)
}

config_pri_source_group1 {
    SOURCES += \
        $$quote($$BASEDIR/src/ConversationController.cpp) \
        $$quote($$BASEDIR/src/ConversationManager.cpp) \
        $$quote($$BASEDIR/src/Image/CookieJar.cpp) \
        $$quote($$BASEDIR/src/Image/HFRNetworkAccessManager.cpp) \
        $$quote($$BASEDIR/src/Image/NetImageTracker.cpp) \
        $$quote($$BASEDIR/src/Image/WebResourceManager.cpp) \
        $$quote($$BASEDIR/src/ListContactsController.cpp) \
        $$quote($$BASEDIR/src/LoginController.cpp) \
        $$quote($$BASEDIR/src/SettingsController.cpp) \
        $$quote($$BASEDIR/src/XMPPService.cpp) \
        $$quote($$BASEDIR/src/applicationui.cpp) \
        $$quote($$BASEDIR/src/base/QXmppArchiveIq.cpp) \
        $$quote($$BASEDIR/src/base/QXmppBindIq.cpp) \
        $$quote($$BASEDIR/src/base/QXmppBookmarkSet.cpp) \
        $$quote($$BASEDIR/src/base/QXmppByteStreamIq.cpp) \
        $$quote($$BASEDIR/src/base/QXmppCodec.cpp) \
        $$quote($$BASEDIR/src/base/QXmppConstants.cpp) \
        $$quote($$BASEDIR/src/base/QXmppDataForm.cpp) \
        $$quote($$BASEDIR/src/base/QXmppDiscoveryIq.cpp) \
        $$quote($$BASEDIR/src/base/QXmppElement.cpp) \
        $$quote($$BASEDIR/src/base/QXmppEntityTimeIq.cpp) \
        $$quote($$BASEDIR/src/base/QXmppGlobal.cpp) \
        $$quote($$BASEDIR/src/base/QXmppIbbIq.cpp) \
        $$quote($$BASEDIR/src/base/QXmppIq.cpp) \
        $$quote($$BASEDIR/src/base/QXmppJingleIq.cpp) \
        $$quote($$BASEDIR/src/base/QXmppLogger.cpp) \
        $$quote($$BASEDIR/src/base/QXmppMessage.cpp) \
        $$quote($$BASEDIR/src/base/QXmppMucIq.cpp) \
        $$quote($$BASEDIR/src/base/QXmppNonSASLAuth.cpp) \
        $$quote($$BASEDIR/src/base/QXmppPingIq.cpp) \
        $$quote($$BASEDIR/src/base/QXmppPresence.cpp) \
        $$quote($$BASEDIR/src/base/QXmppPubSubIq.cpp) \
        $$quote($$BASEDIR/src/base/QXmppRegisterIq.cpp) \
        $$quote($$BASEDIR/src/base/QXmppResultSet.cpp) \
        $$quote($$BASEDIR/src/base/QXmppRosterIq.cpp) \
        $$quote($$BASEDIR/src/base/QXmppRpcIq.cpp) \
        $$quote($$BASEDIR/src/base/QXmppRtpChannel.cpp) \
        $$quote($$BASEDIR/src/base/QXmppSasl.cpp) \
        $$quote($$BASEDIR/src/base/QXmppSessionIq.cpp) \
        $$quote($$BASEDIR/src/base/QXmppSocks.cpp) \
        $$quote($$BASEDIR/src/base/QXmppStanza.cpp) \
        $$quote($$BASEDIR/src/base/QXmppStream.cpp) \
        $$quote($$BASEDIR/src/base/QXmppStreamFeatures.cpp) \
        $$quote($$BASEDIR/src/base/QXmppStreamInitiationIq.cpp) \
        $$quote($$BASEDIR/src/base/QXmppStun.cpp) \
        $$quote($$BASEDIR/src/base/QXmppUtils.cpp) \
        $$quote($$BASEDIR/src/base/QXmppVCardIq.cpp) \
        $$quote($$BASEDIR/src/base/QXmppVersionIq.cpp) \
        $$quote($$BASEDIR/src/base/qdnslookup.cpp) \
        $$quote($$BASEDIR/src/base/qdnslookup_unix.cpp) \
        $$quote($$BASEDIR/src/client/QXmppArchiveManager.cpp) \
        $$quote($$BASEDIR/src/client/QXmppBookmarkManager.cpp) \
        $$quote($$BASEDIR/src/client/QXmppCallManager.cpp) \
        $$quote($$BASEDIR/src/client/QXmppClient.cpp) \
        $$quote($$BASEDIR/src/client/QXmppClientExtension.cpp) \
        $$quote($$BASEDIR/src/client/QXmppConfiguration.cpp) \
        $$quote($$BASEDIR/src/client/QXmppDiscoveryManager.cpp) \
        $$quote($$BASEDIR/src/client/QXmppEntityTimeManager.cpp) \
        $$quote($$BASEDIR/src/client/QXmppInvokable.cpp) \
        $$quote($$BASEDIR/src/client/QXmppMessageReceiptManager.cpp) \
        $$quote($$BASEDIR/src/client/QXmppMucManager.cpp) \
        $$quote($$BASEDIR/src/client/QXmppOutgoingClient.cpp) \
        $$quote($$BASEDIR/src/client/QXmppRemoteMethod.cpp) \
        $$quote($$BASEDIR/src/client/QXmppRosterManager.cpp) \
        $$quote($$BASEDIR/src/client/QXmppRpcManager.cpp) \
        $$quote($$BASEDIR/src/client/QXmppTransferManager.cpp) \
        $$quote($$BASEDIR/src/client/QXmppVCardManager.cpp) \
        $$quote($$BASEDIR/src/client/QXmppVersionManager.cpp) \
        $$quote($$BASEDIR/src/main.cpp)

    HEADERS += \
        $$quote($$BASEDIR/src/ConversationController.hpp) \
        $$quote($$BASEDIR/src/ConversationManager.hpp) \
        $$quote($$BASEDIR/src/DataObjects.h) \
        $$quote($$BASEDIR/src/Image/CookieJar.hpp) \
        $$quote($$BASEDIR/src/Image/HFRNetworkAccessManager.hpp) \
        $$quote($$BASEDIR/src/Image/NetImageTracker.h) \
        $$quote($$BASEDIR/src/Image/WebResourceManager.h) \
        $$quote($$BASEDIR/src/ListContactsController.hpp) \
        $$quote($$BASEDIR/src/LoginController.hpp) \
        $$quote($$BASEDIR/src/SettingsController.hpp) \
        $$quote($$BASEDIR/src/XMPPService.hpp) \
        $$quote($$BASEDIR/src/applicationui.hpp) \
        $$quote($$BASEDIR/src/base/QXmppArchiveIq.h) \
        $$quote($$BASEDIR/src/base/QXmppBindIq.h) \
        $$quote($$BASEDIR/src/base/QXmppBookmarkSet.h) \
        $$quote($$BASEDIR/src/base/QXmppByteStreamIq.h) \
        $$quote($$BASEDIR/src/base/QXmppCodec_p.h) \
        $$quote($$BASEDIR/src/base/QXmppConstants.h) \
        $$quote($$BASEDIR/src/base/QXmppDataForm.h) \
        $$quote($$BASEDIR/src/base/QXmppDiscoveryIq.h) \
        $$quote($$BASEDIR/src/base/QXmppElement.h) \
        $$quote($$BASEDIR/src/base/QXmppEntityTimeIq.h) \
        $$quote($$BASEDIR/src/base/QXmppGlobal.h) \
        $$quote($$BASEDIR/src/base/QXmppIbbIq.h) \
        $$quote($$BASEDIR/src/base/QXmppIq.h) \
        $$quote($$BASEDIR/src/base/QXmppJingleIq.h) \
        $$quote($$BASEDIR/src/base/QXmppLogger.h) \
        $$quote($$BASEDIR/src/base/QXmppMessage.h) \
        $$quote($$BASEDIR/src/base/QXmppMucIq.h) \
        $$quote($$BASEDIR/src/base/QXmppNonSASLAuth.h) \
        $$quote($$BASEDIR/src/base/QXmppPingIq.h) \
        $$quote($$BASEDIR/src/base/QXmppPresence.h) \
        $$quote($$BASEDIR/src/base/QXmppPubSubIq.h) \
        $$quote($$BASEDIR/src/base/QXmppRegisterIq.h) \
        $$quote($$BASEDIR/src/base/QXmppResultSet.h) \
        $$quote($$BASEDIR/src/base/QXmppRosterIq.h) \
        $$quote($$BASEDIR/src/base/QXmppRpcIq.h) \
        $$quote($$BASEDIR/src/base/QXmppRtpChannel.h) \
        $$quote($$BASEDIR/src/base/QXmppSasl_p.h) \
        $$quote($$BASEDIR/src/base/QXmppSessionIq.h) \
        $$quote($$BASEDIR/src/base/QXmppSocks.h) \
        $$quote($$BASEDIR/src/base/QXmppStanza.h) \
        $$quote($$BASEDIR/src/base/QXmppStream.h) \
        $$quote($$BASEDIR/src/base/QXmppStreamFeatures.h) \
        $$quote($$BASEDIR/src/base/QXmppStreamInitiationIq_p.h) \
        $$quote($$BASEDIR/src/base/QXmppStun.h) \
        $$quote($$BASEDIR/src/base/QXmppUtils.h) \
        $$quote($$BASEDIR/src/base/QXmppVCardIq.h) \
        $$quote($$BASEDIR/src/base/QXmppVersionIq.h) \
        $$quote($$BASEDIR/src/base/qdnslookup.h) \
        $$quote($$BASEDIR/src/base/qdnslookup_p.h) \
        $$quote($$BASEDIR/src/client/QXmppArchiveManager.h) \
        $$quote($$BASEDIR/src/client/QXmppBookmarkManager.h) \
        $$quote($$BASEDIR/src/client/QXmppCallManager.h) \
        $$quote($$BASEDIR/src/client/QXmppClient.h) \
        $$quote($$BASEDIR/src/client/QXmppClientExtension.h) \
        $$quote($$BASEDIR/src/client/QXmppConfiguration.h) \
        $$quote($$BASEDIR/src/client/QXmppDiscoveryManager.h) \
        $$quote($$BASEDIR/src/client/QXmppEntityTimeManager.h) \
        $$quote($$BASEDIR/src/client/QXmppInvokable.h) \
        $$quote($$BASEDIR/src/client/QXmppMessageReceiptManager.h) \
        $$quote($$BASEDIR/src/client/QXmppMucManager.h) \
        $$quote($$BASEDIR/src/client/QXmppOutgoingClient.h) \
        $$quote($$BASEDIR/src/client/QXmppRemoteMethod.h) \
        $$quote($$BASEDIR/src/client/QXmppRosterManager.h) \
        $$quote($$BASEDIR/src/client/QXmppRpcManager.h) \
        $$quote($$BASEDIR/src/client/QXmppTransferManager.h) \
        $$quote($$BASEDIR/src/client/QXmppTransferManager_p.h) \
        $$quote($$BASEDIR/src/client/QXmppVCardManager.h) \
        $$quote($$BASEDIR/src/client/QXmppVersionManager.h)
}

CONFIG += precompile_header

PRECOMPILED_HEADER = $$quote($$BASEDIR/precompiled.h)

lupdate_inclusion {
    SOURCES += \
        $$quote($$BASEDIR/../src/*.c) \
        $$quote($$BASEDIR/../src/*.c++) \
        $$quote($$BASEDIR/../src/*.cc) \
        $$quote($$BASEDIR/../src/*.cpp) \
        $$quote($$BASEDIR/../src/*.cxx) \
        $$quote($$BASEDIR/../src/Image/*.c) \
        $$quote($$BASEDIR/../src/Image/*.c++) \
        $$quote($$BASEDIR/../src/Image/*.cc) \
        $$quote($$BASEDIR/../src/Image/*.cpp) \
        $$quote($$BASEDIR/../src/Image/*.cxx) \
        $$quote($$BASEDIR/../src/base/*.c) \
        $$quote($$BASEDIR/../src/base/*.c++) \
        $$quote($$BASEDIR/../src/base/*.cc) \
        $$quote($$BASEDIR/../src/base/*.cpp) \
        $$quote($$BASEDIR/../src/base/*.cxx) \
        $$quote($$BASEDIR/../src/client/*.c) \
        $$quote($$BASEDIR/../src/client/*.c++) \
        $$quote($$BASEDIR/../src/client/*.cc) \
        $$quote($$BASEDIR/../src/client/*.cpp) \
        $$quote($$BASEDIR/../src/client/*.cxx) \
        $$quote($$BASEDIR/../assets/*.qml) \
        $$quote($$BASEDIR/../assets/*.js) \
        $$quote($$BASEDIR/../assets/*.qs) \
        $$quote($$BASEDIR/../assets/images/*.qml) \
        $$quote($$BASEDIR/../assets/images/*.js) \
        $$quote($$BASEDIR/../assets/images/*.qs) \
        $$quote($$BASEDIR/../assets/images/wallpaper/*.qml) \
        $$quote($$BASEDIR/../assets/images/wallpaper/*.js) \
        $$quote($$BASEDIR/../assets/images/wallpaper/*.qs)

    HEADERS += \
        $$quote($$BASEDIR/../src/*.h) \
        $$quote($$BASEDIR/../src/*.h++) \
        $$quote($$BASEDIR/../src/*.hh) \
        $$quote($$BASEDIR/../src/*.hpp) \
        $$quote($$BASEDIR/../src/*.hxx)
}

TRANSLATIONS = $$quote($${TARGET}.ts)
