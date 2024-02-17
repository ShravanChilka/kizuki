class FirestoreCollectionReference {
  static const categories = 'categories';
  static const userData = 'userData';
  static const wallpapers = 'wallpapers';
  static const favourites = 'favourites';
}

class WallpaperImageRef {
  static String small({required String wallpaperId}) {
    return 'wallpapers/$wallpaperId/small.png';
  }

  static String large({required String wallpaperId}) {
    return 'wallpapers/$wallpaperId/large.png';
  }
}

class CategoryImageRef {
  static String small({required String categoryId}) {
    return 'categories/$categoryId/small.png';
  }

  static String large({required String categoryId}) {
    return 'categories/$categoryId/large.png';
  }
}
