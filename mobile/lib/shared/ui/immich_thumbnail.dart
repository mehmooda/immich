import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:immich_mobile/modules/asset_viewer/image_providers/immich_local_thumbnail_provider.dart';
import 'package:immich_mobile/modules/asset_viewer/image_providers/immich_remote_image_provider.dart';
import 'package:immich_mobile/shared/models/asset.dart';
import 'package:immich_mobile/shared/ui/hooks/blurhash_hook.dart';
import 'package:immich_mobile/shared/ui/thumbhash_placeholder.dart';
import 'package:octo_image/octo_image.dart';

class ImmichThumbnail extends HookWidget {
  const ImmichThumbnail({
    this.asset,
    this.width = 250,
    this.height = 250,
    this.fit = BoxFit.cover,
    super.key,
  });

  final Asset? asset;
  final double width;
  final double height;
  final BoxFit fit;

  // Helper function to return the image provider for the asset
  // either by using the asset ID or the asset itself
  /// [asset] is the Asset to request, or else use [assetId] to get a remote
  /// image provider
  /// Use [isThumbnail] and [thumbnailSize] if you'd like to request a thumbnail
  /// The size of the square thumbnail to request. Ignored if isThumbnail
  /// is not true
  static ImageProvider imageProvider({
    Asset? asset,
    String? assetId,
    int thumbnailSize = 256,
  }) {
    if (asset == null && assetId == null) {
      throw Exception('Must supply either asset or assetId');
    }

    if (asset == null) {
      return ImmichRemoteImageProvider(
        assetId: assetId!,
        isThumbnail: true,
      );
    }

    if (useLocal(asset)) {
      return ImmichLocalThumbnailProvider(
        asset: asset,
        height: thumbnailSize,
        width: thumbnailSize,
      );
    } else {
      return ImmichRemoteImageProvider(
        assetId: asset.remoteId!,
        isThumbnail: true,
      );
    }
  }

  static bool useLocal(Asset asset) => !asset.isRemote || asset.isLocal;

  @override
  Widget build(BuildContext context) {
    Uint8List? blurhash = useBlurHashState(asset).value;
    if (asset == null) {
      return Container(
        color: Colors.grey,
        width: width,
        height: height,
        child: const Center(
          child: Icon(Icons.no_photography),
        ),
      );
    }

    return OctoImage.fromSet(
      placeholderFadeInDuration: Duration.zero,
      fadeInDuration: Duration.zero,
      fadeOutDuration: const Duration(milliseconds: 100),
      octoSet: blurHashOrPlaceholder(blurhash),
      image: ImmichThumbnail.imageProvider(
        asset: asset,
      ),
      width: width,
      height: height,
      fit: fit,
    );
  }
}
