
include $(CLEAR_VARS)

	LOCAL_MODULE 		:= LocalP7zip
#包含目录 
	LOCAL_C_INCLUDES := $(MY_HEAD_PATH_INCLUDES)
LOCAL_LDLIBS     := -llog -landroid -lGLESv1_CM
LOCAL_CPPFLAGS   := -fno-rtti -fno-exceptions -std=c++0x

#P7zip使用的宏
LOCAL_CFLAGS := -D__linux__ \
				-D_FILE_OFFSET_BITS=64 \
				-D_LARGEFILE_SOURCE \
				-DNDEBUG \
				-D_REENTRANT \
				-DENV_UNIX \
				-DBREAK_HANDLER \
				-DUNICODE \
				-D_UNICODE \
				-fexceptions \
				-DDEBUG \
				-D_DEBUG
	
	LOCAL_SRC_FILES := 3rdparty/p7zip/CPP/myWindows/myGetTickCount.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/myWindows/mySplitCommandLine.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/myWindows/myAddExeFlag.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/myWindows/wine_date_and_time.cpp
	
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/UI/Console/BenchCon.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/UI/Console/ConsoleClose.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/UI/Console/ExtractCallbackConsole.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/UI/Console/List.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/UI/Console/Main.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/UI/Console/MainAr.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/UI/Console/OpenCallbackConsole.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/UI/Console/PercentPrinter.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/UI/Console/UpdateCallbackConsole.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/UI/Console/UserInputUtils.cpp
	
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/Common/CommandLineParser.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/Common/CRC.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/Common/IntToString.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/Common/ListFileUtils.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/Common/StdInStream.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/Common/StdOutStream.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/Common/MyString.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/Common/MyWindows.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/Common/StringConvert.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/Common/StringToInt.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/Common/UTFConvert.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/Common/MyVector.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/Common/Wildcard.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/Common/MyXml.cpp
	
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/Windows/Error.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/Windows/FileDir.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/Windows/FileFind.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/Windows/FileIO.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/Windows/FileName.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/Windows/PropVariant.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/Windows/PropVariantConversions.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/Windows/PropVariantUtils.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/Windows/Synchronization.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/Windows/System.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/Windows/Time.cpp
	
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Common/CreateCoder.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Common/CWrappers.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Common/FilePathAutoRename.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip//Common/FileStreams.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Common/FilterCoder.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Common/InBuffer.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Common/InOutTempBuffer.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Common/LimitedStreams.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Common/LockedStream.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Common/MemBlocks.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Common/MethodId.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Common/MethodProps.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Common/OffsetStream.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Common/OutBuffer.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Common/OutMemStream.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Common/ProgressMt.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Common/ProgressUtils.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Common/StreamBinder.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Common/StreamObjects.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Common/StreamUtils.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Common/VirtThread.cpp
	
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/UI/Common/ArchiveCommandLine.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/UI/Common/ArchiveExtractCallback.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/UI/Common/ArchiveOpenCallback.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/UI/Common/Bench.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/UI/Common/DefaultName.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/UI/Common/EnumDirItems.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/UI/Common/Extract.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/UI/Common/ExtractingFilePath.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/UI/Common/LoadCodecs.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/UI/Common/OpenArchive.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/UI/Common/PropIDUtils.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/UI/Common/SetProperties.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/UI/Common/SortUtils.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/UI/Common/TempFiles.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/UI/Common/Update.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/UI/Common/UpdateAction.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/UI/Common/UpdateCallback.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/UI/Common/UpdatePair.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/UI/Common/UpdateProduce.cpp
	
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Bz2Handler.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/DeflateProps.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/GzHandler.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/LzmaHandler.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/PpmdHandler.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/SplitHandler.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/XzHandler.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/ZHandler.cpp
	
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Common/CoderMixer2.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Common/CoderMixer2MT.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Common/CrossThreadProgress.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Common/DummyOutStream.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Common/FindSignature.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Common/HandlerOut.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Common/InStreamWithCRC.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Common/ItemNameUtils.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Common/MultiStream.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Common/OutStreamWithCRC.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Common/OutStreamWithSha1.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Common/ParseProperties.cpp
	
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/7z/7zCompressionMode.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/7z/7zDecode.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/7z/7zEncode.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/7z/7zExtract.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/7z/7zFolderInStream.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/7z/7zFolderOutStream.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/7z/7zHandler.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/7z/7zHandlerOut.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/7z/7zHeader.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/7z/7zIn.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/7z/7zOut.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/7z/7zProperties.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/7z/7zSpecStream.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/7z/7zUpdate.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/7z/7zRegister.cpp
	
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Cab/CabBlockInStream.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Cab/CabHandler.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Cab/CabHeader.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Cab/CabIn.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Cab/CabRegister.cpp
	
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Chm/ChmHandler.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Chm/ChmHeader.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Chm/ChmIn.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Chm/ChmRegister.cpp
	
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Iso/IsoHandler.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Iso/IsoHeader.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Iso/IsoIn.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Iso/IsoRegister.cpp
	
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Rar/RarHandler.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Rar/RarHeader.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Rar/RarIn.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Rar/RarItem.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Rar/RarRegister.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Rar/RarVolumeInStream.cpp
	
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Tar/TarHandler.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Tar/TarHandlerOut.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Tar/TarHeader.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Tar/TarIn.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Tar/TarOut.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Tar/TarRegister.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Tar/TarUpdate.cpp
	
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Wim/WimHandler.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Wim/WimHandlerOut.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Wim/WimIn.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Wim/WimRegister.cpp
	
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Zip/ZipAddCommon.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Zip/ZipHandler.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Zip/ZipHandlerOut.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Zip/ZipHeader.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Zip/ZipIn.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Zip/ZipItem.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Zip/ZipOut.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Zip/ZipUpdate.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Archive/Zip/ZipRegister.cpp
	
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/Bcj2Coder.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/Bcj2Register.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/BcjCoder.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/BcjRegister.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/BitlDecoder.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/BranchCoder.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/BranchMisc.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/BranchRegister.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/ByteSwap.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/BZip2Crc.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/BZip2Decoder.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/BZip2Encoder.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/BZip2Register.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/CopyCoder.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/CopyRegister.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/Deflate64Register.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/DeflateDecoder.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/DeflateEncoder.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/DeflateRegister.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/DeltaFilter.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/ImplodeDecoder.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/ImplodeHuffmanDecoder.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/Lzma2Decoder.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/Lzma2Encoder.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/Lzma2Register.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/LzmaDecoder.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/LzmaEncoder.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/LzmaRegister.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/LzOutWindow.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/Lzx86Converter.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/LzxDecoder.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/PpmdDecoder.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/PpmdEncoder.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/PpmdRegister.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/PpmdZip.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/QuantumDecoder.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/Rar1Decoder.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/Rar2Decoder.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/Rar3Decoder.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/Rar3Vm.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/RarCodecsRegister.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/ShrinkDecoder.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Compress/ZDecoder.cpp
	
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Crypto/7zAes.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Crypto/7zAesRegister.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Crypto/HmacSha1.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Crypto/MyAes.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Crypto/Pbkdf2HmacSha1.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Crypto/RandGen.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Crypto/Sha1.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Crypto/WzAes.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Crypto/ZipCrypto.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Crypto/ZipStrong.cpp 
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Crypto/RarAes.cpp
	LOCAL_SRC_FILES += 3rdparty/p7zip/CPP/7zip/Crypto/Rar20Crypto.cpp
	
	LOCAL_SRC_FILES += 3rdparty/p7zip/C/Aes.c
	LOCAL_SRC_FILES += 3rdparty/p7zip/C/7zStream.c
	LOCAL_SRC_FILES += 3rdparty/p7zip/C/7zCrc.c
	LOCAL_SRC_FILES += 3rdparty/p7zip/C/7zCrcOpt.c
	LOCAL_SRC_FILES += 3rdparty/p7zip/C/Alloc.c
	LOCAL_SRC_FILES += 3rdparty/p7zip/C/Bra.c
	LOCAL_SRC_FILES += 3rdparty/p7zip/C/Bra86.c
	LOCAL_SRC_FILES += 3rdparty/p7zip/C/BraIA64.c
	LOCAL_SRC_FILES += 3rdparty/p7zip/C/BwtSort.c
	LOCAL_SRC_FILES += 3rdparty/p7zip/C/Delta.c
	LOCAL_SRC_FILES += 3rdparty/p7zip/C/HuffEnc.c
	LOCAL_SRC_FILES += 3rdparty/p7zip/C/LzFind.c
	LOCAL_SRC_FILES += 3rdparty/p7zip/C/LzFindMt.c
	LOCAL_SRC_FILES += 3rdparty/p7zip/C/Lzma2Dec.c
	LOCAL_SRC_FILES += 3rdparty/p7zip/C/Lzma2Enc.c
	LOCAL_SRC_FILES += 3rdparty/p7zip/C/LzmaDec.c
	LOCAL_SRC_FILES += 3rdparty/p7zip/C/LzmaEnc.c
	LOCAL_SRC_FILES += 3rdparty/p7zip/C/MtCoder.c
	LOCAL_SRC_FILES += 3rdparty/p7zip/C/Ppmd7.c
	LOCAL_SRC_FILES += 3rdparty/p7zip/C/Ppmd7Dec.c
	LOCAL_SRC_FILES += 3rdparty/p7zip/C/Ppmd7Enc.c
	LOCAL_SRC_FILES += 3rdparty/p7zip/C/Ppmd8.c
	LOCAL_SRC_FILES += 3rdparty/p7zip/C/Ppmd8Dec.c
	LOCAL_SRC_FILES += 3rdparty/p7zip/C/Ppmd8Enc.c
	LOCAL_SRC_FILES += 3rdparty/p7zip/C/Sha256.c
	LOCAL_SRC_FILES += 3rdparty/p7zip/C/Sort.c
	LOCAL_SRC_FILES += 3rdparty/p7zip/C/Threads.c
	LOCAL_SRC_FILES += 3rdparty/p7zip/C/Xz.c
	LOCAL_SRC_FILES += 3rdparty/p7zip/C/XzCrc64.c
	LOCAL_SRC_FILES += 3rdparty/p7zip/C/XzDec.c
	LOCAL_SRC_FILES += 3rdparty/p7zip/C/XzEnc.c
	LOCAL_SRC_FILES += 3rdparty/p7zip/C/XzIn.c 
	
	LOCAL_SRC_FILES += 3rdparty/p7zip/P7zipWrapper.cpp 

#include $(BUILD_STATIC_LIBRARY)
include $(BUILD_SHARED_LIBRARY)