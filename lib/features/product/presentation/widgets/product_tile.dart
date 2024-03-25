import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/app_paddings.dart';
import '../../../../core/resources/app_sizes.dart';

import '../../domain/entities/product_entity.dart';

class ProductWidget extends StatelessWidget {
  final ProductEntity product;

  const ProductWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: AppPaddings.p14,
        vertical: AppPaddings.p7,
      ),
      height: MediaQuery.of(context).size.width / 2.2,
      child: Row(
        children: [
          _buildImage(context),
          _buildTitleAndDescription(),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: product.image,
      imageBuilder: (context, imageProvider) => Padding(
        padding: const EdgeInsetsDirectional.only(end: AppPaddings.p14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.s20),
          child: Container(
            width: MediaQuery.of(context).size.width / 3,
            height: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.08),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
        ),
      ),
      progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
        padding: const EdgeInsetsDirectional.only(end: AppPaddings.p14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.s20),
          child: Container(
            width: MediaQuery.of(context).size.width / 3,
            height: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.08),
            ),
            child: const CupertinoActivityIndicator(),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Padding(
        padding: const EdgeInsetsDirectional.only(end: AppPaddings.p14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.s20),
          child: Container(
            width: MediaQuery.of(context).size.width / 3,
            height: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.08),
            ),
            child: const Icon(Icons.error),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndDescription() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppPaddings.p7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              product.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: AppSizes.s16,
                color: Colors.black87,
              ),
            ),

            // Description
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: AppPaddings.p4),
                child: Text(
                  product.description,
                  maxLines: 4,
                  style: const TextStyle(
                    fontSize: AppSizes.s14,
                  ),
                ),
              ),
            ),

            // Rate Count
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star, size: AppSizes.s16),
                    const SizedBox(width: 4),
                    Text(
                      product.rating.rate.toString(),
                      style: const TextStyle(
                        fontSize: AppSizes.s12,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.numbers, size: AppSizes.s18),
                    const SizedBox(width: 4),
                    Text(
                      product.rating.count.toString(),
                      style: const TextStyle(
                        fontSize: AppSizes.s12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
